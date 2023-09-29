defmodule OpenAPI.Spec.Schema.Media do
  @moduledoc "Raw media schema from the OpenAPI spec"
  import OpenAPI.Reader.State

  alias OpenAPI.Spec
  alias OpenAPI.Spec.Schema
  alias OpenAPI.Spec.Schema.Encoding
  alias OpenAPI.Spec.Schema.Example

  @type t :: %__MODULE__{
          schema: Schema.t() | Spec.ref(),
          example: any,
          examples: %{optional(String.t()) => Example.t()},
          encoding: %{optional(String.t()) => Encoding.t()}
        }

  defstruct [
    :schema,
    :example,
    :examples,
    :encoding
  ]

  @doc false
  @spec decode(map, map) :: {map, t}
  def decode(state, yaml) do
    {state, encoding} = decode_encoding(state, yaml)
    {state, examples} = decode_examples(state, yaml)
    {state, schema} = decode_schema(state, yaml)

    media = %__MODULE__{
      encoding: encoding,
      example: Map.get(yaml, "example"),
      examples: examples,
      schema: schema
    }

    {state, media}
  end

  @spec decode_encoding(map, map) :: {map, %{optional(String.t()) => Example.t()}}
  defp decode_encoding(state, %{"encoding" => encoding}) do
    with_path(state, encoding, "encoding", fn state, encoding ->
      Enum.reduce(encoding, {state, %{}}, fn {key, encoding_item}, {state, encoding} ->
        {state, encoding_item} =
          with_path(state, encoding_item, key, fn state, encoding_item ->
            with_ref(state, encoding_item, &Encoding.decode/2)
          end)

        {state, Map.put(encoding, key, encoding_item)}
      end)
    end)
  end

  defp decode_encoding(state, _yaml), do: {state, %{}}

  @spec decode_examples(map, map) :: {map, %{optional(String.t()) => Example.t()}}
  defp decode_examples(state, %{"examples" => examples}) do
    with_path(state, examples, "examples", fn state, examples ->
      Enum.reduce(examples, {state, %{}}, fn {key, example}, {state, examples} ->
        {state, example} =
          with_path(state, example, key, fn state, example ->
            with_ref(state, example, &Example.decode/2)
          end)

        {state, Map.put(examples, key, example)}
      end)
    end)
  end

  defp decode_examples(state, _yaml), do: {state, %{}}

  @spec decode_schema(map, map) :: {map, Schema.t() | nil}
  defp decode_schema(state, %{"schema" => schema}) do
    with_path(state, schema, "schema", fn state, schema ->
      with_schema_ref(state, schema, &Schema.decode/2)
    end)
  end

  defp decode_schema(state, _yaml), do: {state, nil}
end
