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
          | {:union, [t]}
          | reference

  defguard is_primitive(schema)
           when not is_nil(schema.const) or is_list(schema.enum) or
                  schema.type in ["boolean", "integer", "number", "null", "string"]

  @doc """
  Create an internal type representation of the given schema

  This function does not support objects or other schemas that would be stored in the processor
  state. If a schema may contain such a reference, use `from_schema/2` instead.

  It is expected that this function is called in cases when the range of possible types are known
  to be limited, such as query or path parameters.
  """
  @spec primitive_from_schema(Schema.t()) :: t
  def primitive_from_schema(schema)

  # Literals
  #

  def primitive_from_schema(%Schema{const: value}) when not is_nil(value), do: {:const, value}
  def primitive_from_schema(%Schema{enum: [value]}), do: {:const, value}
  def primitive_from_schema(%Schema{enum: values}) when is_list(values), do: {:enum, values}

  # Primitives
  #
  def primitive_from_schema(%Schema{type: "boolean"}), do: :boolean
  def primitive_from_schema(%Schema{type: "integer"}), do: :integer
  def primitive_from_schema(%Schema{type: "number"}), do: :number
  def primitive_from_schema(%Schema{type: "null"}), do: :null
  def primitive_from_schema(%Schema{type: "string"} = schema), do: string_type(schema)

  # Arrays
  #
  def primitive_from_schema(%Schema{type: "array", items: items}) do
    {:array, primitive_from_schema(items)}
  end

  # Unions
  #
  def primitive_from_schema(%Schema{type: types} = schema) when is_list(types) do
    types
    |> Enum.map(&%Schema{schema | type: &1})
    |> then(&create_primitive_union/1)
  end

  def primitive_from_schema(%Schema{any_of: types}) when is_list(types),
    do: create_primitive_union(types)

  def primitive_from_schema(%Schema{one_of: types}) when is_list(types),
    do: create_primitive_union(types)

  # Fallback
  #
  def primitive_from_schema(schema) do
    raise "Invalid primitive type: #{inspect(schema)}"
  end

  @spec create_primitive_union([Schema.t()]) :: t
  defp create_primitive_union(types) do
    types
    |> Enum.map(&primitive_from_schema/1)
    |> Enum.uniq()
    |> Enum.sort()
    |> case do
      [] -> :null
      [:null] -> :null
      types -> {:union, types}
    end
  end

  @doc """
  Create an internal type representation of the given schema

  This function supports referencing object schemas in the processor state. As a result, if it
  encounters an object schema as a sub-field of the given schema, it will potentially modify the
  processor state in order to stash a new reference.
  """
  @spec from_schema(%State{}, Schema.t()) :: {State.t(), t}
  def from_schema(state, schema)

  # Primitives
  #
  def from_schema(state, schema) when is_primitive(schema) do
    {state, primitive_from_schema(schema)}
  end

  # Arrays
  #
  def from_schema(state, %Schema{type: "array", items: items}) do
    {state, type} = from_schema(state, items)
    {state, {:array, type}}
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
  def from_schema(state, %Schema{properties: properties} = schema_spec) when is_map(properties) do
    %Schema{
      "$oag_last_ref_file": last_ref_file,
      "$oag_last_ref_path": last_ref_path
    } = schema_spec

    if Map.has_key?(state.schema_registry, {last_ref_file, last_ref_path}) do
      {state, Map.fetch!(state.schema_registry, {last_ref_file, last_ref_path})}
    else
      ref = make_ref()
      schemas = Map.put(state.schemas, ref, schema_spec)
      schema_registry = Map.put(state.schema_registry, {last_ref_file, last_ref_path}, ref)
      {%State{state | schemas: schemas, schema_registry: schema_registry}, ref}
    end
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
    {state, types} =
      Enum.reduce(types, {state, []}, fn type, {state, types} ->
        {state, type} = from_schema(state, type)
        {state, [type | types]}
      end)

    types =
      types
      |> Enum.uniq()
      |> Enum.sort()
      |> case do
        [] -> :null
        [:null] -> :null
        types -> {:union, types}
      end

    {state, types}
  end
end
