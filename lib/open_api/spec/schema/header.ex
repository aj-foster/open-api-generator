defmodule OpenAPI.Spec.Path.Header do
  @moduledoc false
  import OpenAPI.Reader.State

  alias OpenAPI.Spec.Schema
  alias OpenAPI.Spec.Schema.Example
  alias OpenAPI.Spec.Schema.Media

  @type t :: %__MODULE__{
          description: String.t() | nil,
          required: boolean,
          deprecated: boolean,
          allow_empty_value: boolean,
          style: String.t(),
          explode: boolean,
          allow_reserved: boolean,
          schema: Schema.t() | nil,
          example: any,
          examples: %{optional(String.t()) => Example.t()},
          content: %{optional(String.t()) => Media.t()}
        }

  defstruct [
    :description,
    :required,
    :deprecated,
    :allow_empty_value,
    :style,
    :explode,
    :allow_reserved,
    :schema,
    :example,
    :examples,
    :content
  ]

  @spec decode(map, map) :: {map, t}
  def decode(state, yaml) do
    {state, schema} = decode_schema(state, yaml)
    {state, examples} = decode_examples(state, yaml)
    {state, content} = decode_content(state, yaml)

    header = %__MODULE__{
      description: Map.get(yaml, "description"),
      required: Map.get(yaml, "required", false),
      deprecated: Map.get(yaml, "deprecated", false),
      allow_empty_value: Map.get(yaml, "allowEmptyValue", false),
      style: Map.get(yaml, "style", "simple"),
      explode: Map.get(yaml, "explode", false),
      allow_reserved: Map.get(yaml, "allowReserved", false),
      schema: schema,
      example: Map.get(yaml, "example"),
      examples: examples,
      content: content
    }

    {state, header}
  end

  @spec decode_schema(map, map) :: {map, Schema.t() | nil}
  def decode_schema(state, %{"schema" => schema}) do
    with_path(state, schema, "schema", fn state, schema ->
      with_ref(state, schema, &Schema.decode/2)
    end)
  end

  def decode_schema(state, _yaml), do: {state, nil}

  @spec decode_examples(map, map) :: {map, %{optional(String.t()) => Example.t()}}
  def decode_examples(state, %{"examples" => examples}) do
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

  def decode_examples(state, _yaml), do: {state, %{}}

  @spec decode_content(map, map) :: {map, %{optional(String.t()) => Media.t()}}
  def decode_content(state, %{"content" => content}) do
    with_path(state, content, "content", fn state, content ->
      Enum.reduce(content, {state, %{}}, fn {key, content_item}, {state, content} ->
        {state, content_item} =
          with_path(state, content_item, key, fn state, content_item ->
            with_ref(state, content_item, &Media.decode/2)
          end)

        {state, Map.put(content, key, content_item)}
      end)
    end)
  end

  def decode_content(state, _yaml), do: {state, %{}}
end
