defmodule OpenAPI.Processor.Type do
  alias OpenAPI.Processor.State
  alias OpenAPI.Spec.Schema

  @typedoc "Literal values, as found in `const` and `enum` definitions"
  @type literal :: binary | boolean | number | nil

  @typedoc """
  Special cases of the string type

  `binary` represents binary data that may be encoded, while `generic` represents a generic string
  without a formatting constraint.
  """
  @type string_format ::
          :generic
          | :binary
          | :date
          | :date_time
          | :duration
          | :email
          | :hostname
          | :idn_email
          | :idn_hostname
          | :iri
          | :iri_reference
          | :ipv4
          | :ipv6
          | :json_pointer
          | :password
          | :regex
          | :relative_json_pointer
          | :time
          | :uri
          | :uri_reference
          | :uri_template
          | :uuid

  @typedoc """
  Basic type

  These types represent a subset of the six primitive values defined by JSON schema (omitting
  object and array, which are represented in `t:t/0`.) Note that both `integer` and `number` are
  acceptable types, with the latter covering both integer and decimal numbers.
  """
  @type primitive ::
          :boolean
          | :integer
          | :number
          | {:string, string_format}
          | :null

  @typedoc "Name of a field in an object type"
  @type object_key :: atom | {:optional, atom} | {:additional, :_}

  @typedoc """
  Internal representation of types

  In addition to the `t:primitive/0` types, values can be constants or enums defined by
  `t:literal/0` values. They can also be arrays or objects, as well as the union of multiple
  type definitions. If a value is nullable, it will be expressed as the union with `:null`.

  Elixir references (`t:reference/0`) represent schemas stored in the processor `State`.
  """
  @type t ::
          primitive
          | {:array, t}
          | {:const, literal}
          | {:enum, [literal]}
          | {:object, %{object_key => t}}
          | {:union, [t]}
          | reference

  @doc """
  Create an internal type representation of the given schema

  This variant of the function does not support schema references. If the schema may contain a
  reference stored in the processor state, use `from_schema/2` instead.
  """
  @spec from_schema(Schema.t()) :: t
  def from_schema(schema) do
    from_schema(%State{schemas: %{}, schema_registry: %{}}, schema)
  end

  @doc """
  Create an internal type representation of the given schema
  """
  @spec from_schema(%State{}, Schema.t()) :: t
  def from_schema(state, schema)

  # Literals
  #

  def from_schema(_state, %Schema{const: value}) when not is_nil(value), do: {:const, value}
  def from_schema(_state, %Schema{enum: [value]}), do: {:const, value}
  def from_schema(_state, %Schema{enum: values}) when is_list(values), do: {:enum, values}

  # Primitives
  #
  def from_schema(_state, %Schema{type: "boolean"}), do: :boolean
  def from_schema(_state, %Schema{type: "integer"}), do: :integer
  def from_schema(_state, %Schema{type: "number"}), do: :number
  def from_schema(_state, %Schema{type: "null"}), do: :null
  def from_schema(_state, %Schema{type: "string"} = schema), do: string_type(schema)

  # Arrays
  #
  def from_schema(state, %Schema{type: "array", items: items}) do
    {:array, from_schema(state, items)}
  end

  # Unions
  #
  def from_schema(state, %Schema{type: types} = schema) when is_list(types) do
    types
    |> Enum.map(&%Schema{schema | type: &1})
    |> then(&create_union(state, &1))
  end

  def from_schema(state, %Schema{any_of: types}) when is_list(types),
    do: create_union(state, types)

  def from_schema(state, %Schema{one_of: types}) when is_list(types),
    do: create_union(state, types)

  # Objects
  #
  def from_schema(state, %Schema{properties: properties, required: required}) do
    fields =
      Map.new(properties, fn {string_key, type} ->
        key =
          if is_list(required) and string_key in required do
            String.to_atom(string_key)
          else
            {:optional, String.to_atom(string_key)}
          end

        type =
          if ref = State.get_schema_reference(state, type) do
            ref
          else
            from_schema(state, type)
          end

        {key, type}
      end)

    {:object, fields}
  end

  # Fallback
  #
  def from_schema(_state, schema) do
    raise "Unknown type: #{inspect(schema)}"
  end

  @spec string_type(Schema.t()) :: {:string, string_format}
  defp string_type(%Schema{format: "date"}), do: {:string, :date}
  defp string_type(%Schema{format: "date-time"}), do: {:string, :date_time}
  defp string_type(%Schema{format: "duration"}), do: {:string, :duration}
  defp string_type(%Schema{format: "email"}), do: {:string, :email}
  defp string_type(%Schema{format: "hostname"}), do: {:string, :hostname}
  defp string_type(%Schema{format: "idn-email"}), do: {:string, :idn_email}
  defp string_type(%Schema{format: "idn-hostname"}), do: {:string, :idn_hostname}
  defp string_type(%Schema{format: "ipv4"}), do: {:string, :ipv4}
  defp string_type(%Schema{format: "ipv6"}), do: {:string, :ipv6}
  defp string_type(%Schema{format: "iri"}), do: {:string, :iri}
  defp string_type(%Schema{format: "iri-reference"}), do: {:string, :iri_reference}
  defp string_type(%Schema{format: "json-pointer"}), do: {:string, :json_pointer}
  defp string_type(%Schema{format: "password"}), do: {:string, :password}
  defp string_type(%Schema{format: "regex"}), do: {:string, :regex}

  defp string_type(%Schema{format: "relative-json-pointer"}),
    do: {:string, :relative_json_pointer}

  defp string_type(%Schema{format: "time"}), do: {:string, :time}
  defp string_type(%Schema{format: "uri"}), do: {:string, :uri}
  defp string_type(%Schema{format: "uri-reference"}), do: {:string, :uri_reference}
  defp string_type(%Schema{format: "uri-template"}), do: {:string, :uri_template}
  defp string_type(%Schema{format: "uuid"}), do: {:string, :uuid}
  defp string_type(_schema), do: {:string, :generic}

  @spec create_union(State.t(), [Schema.t()]) :: t
  defp create_union(state, types) do
    types
    |> Enum.map(&from_schema(state, &1))
    |> Enum.uniq()
    |> Enum.sort()
    |> case do
      [] -> :null
      [:null] -> :null
      types -> {:union, types}
    end
  end
end
