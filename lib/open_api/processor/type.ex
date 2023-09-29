defmodule OpenAPI.Processor.Type do
  alias OpenAPI.Processor.State
  alias OpenAPI.Spec
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
  Unnatural types introduced by the generator

  These types may be introduced in extra fields or when referenced schemas are ignored.
  """
  @type unnatural :: :any | :map

  @typedoc """
  Internal representation of types

  In addition to the `t:primitive/0` types, values can be constants or enums defined by
  `t:literal/0` values. They can also be arrays or objects, as well as the union of multiple
  type definitions. If a value is nullable, it will be expressed as the union with `:null`.

  Elixir references (`t:reference/0`) represent schemas stored in the processor `State`.
  """
  @type t ::
          primitive
          | unnatural
          | {:array, t}
          | {:const, literal}
          | {:enum, [literal]}
          | {:union, [t]}
          | reference

  @doc """
  Create an internal type representation of the given schema

  This function supports referencing object schemas in the processor state. As a result, if it
  encounters an object schema as a sub-field of the given schema, it will potentially modify the
  processor state in order to stash a new reference.
  """
  @spec from_schema(%State{}, Schema.t() | Spec.ref()) :: {State.t(), t}
  def from_schema(state, schema)

  # Schema references
  #
  def from_schema(state, {:ref, full_path}) do
    State.put_schema_ref(state, full_path)
  end

  # Primitives
  #
  def from_schema(state, %Schema{const: value}) when not is_nil(value),
    do: {state, {:const, value}}

  def from_schema(state, %Schema{enum: [value]}), do: {state, {:const, value}}

  def from_schema(state, %Schema{enum: values}) when is_list(values) do
    if Enum.any?(values, &is_map/1) do
      IO.warn("Invalid enum; expanding type to any: #{inspect(values)}")

      {state, :any}
    else
      {state, {:enum, values}}
    end
  end

  def from_schema(state, %Schema{type: "boolean"}), do: {state, :boolean}
  def from_schema(state, %Schema{type: "integer"}), do: {state, :integer}
  def from_schema(state, %Schema{type: "number"}), do: {state, :number}
  def from_schema(state, %Schema{type: "null"}), do: {state, :null}
  def from_schema(state, %Schema{type: "string"} = schema), do: {state, string_type(schema)}

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
    State.put_schema_spec(state, schema_spec)
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

  @spec reduce(t, acc, (t, acc -> acc)) :: acc when acc: any
  def reduce(type, accumulator, callback)
  def reduce({:array, type}, acc, cb), do: reduce(type, acc, cb)
  def reduce({:union, types}, acc, cb), do: Enum.reduce(types, acc, cb)
  def reduce(type, acc, cb), do: cb.(type, acc)
end
