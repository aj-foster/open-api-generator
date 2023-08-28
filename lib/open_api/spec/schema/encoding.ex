defmodule OpenAPI.Spec.Schema.Encoding do
  @moduledoc "Raw schema encoding from the OpenAPI spec"
  import OpenAPI.Reader.State

  alias OpenAPI.Spec.Path.Header

  @type t :: %__MODULE__{
          content_type: String.t() | nil,
          headers: %{optional(String.t()) => Header.t()},
          style: String.t(),
          explode: boolean,
          allow_reserved: boolean
        }

  defstruct [
    :content_type,
    :headers,
    :style,
    :explode,
    :allow_reserved
  ]

  @doc false
  @spec decode(map, map) :: {map, t}
  def decode(state, yaml) do
    {state, headers} = decode_headers(state, yaml)

    encoding = %__MODULE__{
      content_type: Map.get(yaml, "contentType"),
      headers: headers,
      style: Map.fetch!(yaml, "style"),
      explode: Map.fetch!(yaml, "explode"),
      allow_reserved: Map.get(yaml, "allowReserved", false)
    }

    {state, encoding}
  end

  @spec decode_headers(map, map) :: {map, %{optional(String.t()) => Header.t()} | nil}
  defp decode_headers(state, %{"headers" => headers}) do
    with_path(state, headers, "headers", fn state, headers ->
      Enum.reduce(headers, {state, %{}}, fn {key, header}, {state, headers} ->
        {state, header} = with_path(state, header, key, &Header.decode/2)
        {state, Map.put(headers, key, header)}
      end)
    end)
  end

  defp decode_headers(state, _yaml), do: {state, nil}
end
