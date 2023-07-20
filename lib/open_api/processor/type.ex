defmodule OpenAPI.Processor.Type do
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
  """
  @type t ::
          primitive
          | {:array, t}
          | {:const, literal}
          | {:enum, [literal]}
          | {:object, %{object_key => t}}
          | {:union, [t]}

  @doc "Create an internal type representation of the given schema"
  @spec from_schema(Schema.t()) :: t
  def from_schema(schema)

  # Literals
  #

  def from_schema(%Schema{const: value}) when not is_nil(value), do: {:const, value}
  def from_schema(%Schema{enum: [value]}), do: {:const, value}
  def from_schema(%Schema{enum: values}) when is_list(values), do: {:enum, values}

  # Primitives
  #
  def from_schema(%Schema{type: "boolean"}), do: :boolean
  def from_schema(%Schema{type: "integer"}), do: :integer
  def from_schema(%Schema{type: "number"}), do: :number
  def from_schema(%Schema{type: "null"}), do: :null

  # Strings
  #
  def from_schema(%Schema{type: "string", format: "date"}), do: {:string, :date}
  def from_schema(%Schema{type: "string", format: "date-time"}), do: {:string, :date_time}
  def from_schema(%Schema{type: "string", format: "duration"}), do: {:string, :duration}
  def from_schema(%Schema{type: "string", format: "email"}), do: {:string, :email}
  def from_schema(%Schema{type: "string", format: "hostname"}), do: {:string, :hostname}
  def from_schema(%Schema{type: "string", format: "idn-email"}), do: {:string, :idn_email}
  def from_schema(%Schema{type: "string", format: "idn-hostname"}), do: {:string, :idn_hostname}
  def from_schema(%Schema{type: "string", format: "ipv4"}), do: {:string, :ipv4}
  def from_schema(%Schema{type: "string", format: "ipv6"}), do: {:string, :ipv6}
  def from_schema(%Schema{type: "string", format: "iri"}), do: {:string, :iri}
  def from_schema(%Schema{type: "string", format: "iri-reference"}), do: {:string, :iri_reference}
  def from_schema(%Schema{type: "string", format: "json-pointer"}), do: {:string, :json_pointer}
  def from_schema(%Schema{type: "string", format: "regex"}), do: {:string, :regex}

  def from_schema(%Schema{type: "string", format: "relative-json-pointer"}),
    do: {:string, :relative_json_pointer}

  def from_schema(%Schema{type: "string", format: "time"}), do: {:string, :time}
  def from_schema(%Schema{type: "string", format: "uri"}), do: {:string, :uri}
  def from_schema(%Schema{type: "string", format: "uri-reference"}), do: {:string, :uri_reference}
  def from_schema(%Schema{type: "string", format: "uri-template"}), do: {:string, :uri_template}
  def from_schema(%Schema{type: "string", format: "uuid"}), do: {:string, :uuid}
  def from_schema(%Schema{type: "string"}), do: {:string, :generic}

  # Arrays
  #
  def from_schema(%Schema{type: "array", items: items}), do: {:array, from_schema(items)}

  # Unions
  #
  def from_schema(%Schema{type: types} = schema) when is_list(types) do
    types
    |> Enum.map(&%Schema{schema | type: &1})
    |> create_union()
  end

  def from_schema(%Schema{any_of: types}) when is_list(types), do: create_union(types)
  def from_schema(%Schema{one_of: types}) when is_list(types), do: create_union(types)

  # Objects
  #
  def from_schema(%Schema{properties: properties, required: required}) do
    fields =
      Map.new(properties, fn {string_key, type} ->
        key =
          if is_list(required) and string_key in required do
            String.to_atom(string_key)
          else
            {:optional, String.to_atom(string_key)}
          end

        {key, from_schema(type)}
      end)

    {:object, fields}
  end

  # Fallback
  #
  def from_schema(schema) do
    raise "Unknown type: #{inspect(schema)}"
  end

  @spec create_union([Schema.t()]) :: t
  defp create_union(types) do
    types
    |> Enum.map(&from_schema/1)
    |> Enum.uniq()
    |> Enum.sort()
    |> case do
      [] -> :null
      [:null] -> :null
      types -> {:union, types}
    end
  end
end
