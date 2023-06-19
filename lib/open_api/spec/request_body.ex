defmodule OpenAPI.Spec.RequestBody do
  @moduledoc false
  import OpenAPI.Reader.State

  alias OpenAPI.Spec.Schema.Media

  @type t :: %__MODULE__{
          description: String.t() | nil,
          content: %{optional(String.t()) => Media.t()},
          required: boolean
        }

  defstruct [
    :description,
    :content,
    :required
  ]

  @spec decode(map, map) :: {map, t}
  def decode(state, yaml) do
    {state, content} = decode_content(state, yaml)

    request_body = %__MODULE__{
      description: Map.get(yaml, "description"),
      content: content,
      required: Map.get(yaml, "required", false)
    }

    {state, request_body}
  end

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
