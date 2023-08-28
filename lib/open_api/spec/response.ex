defmodule OpenAPI.Spec.Response do
  @moduledoc "Raw response from the OpenAPI spec"
  import OpenAPI.Reader.State

  alias OpenAPI.Spec.Link
  alias OpenAPI.Spec.Path.Header
  alias OpenAPI.Spec.Schema.Media

  @type t :: %__MODULE__{
          description: String.t(),
          headers: %{optional(String.t()) => Header.t()},
          content: %{optional(String.t()) => Media.t()},
          links: %{optional(String.t()) => Link.t()}
        }

  defstruct [
    :description,
    :headers,
    :content,
    :links
  ]

  @doc false
  @spec decode(map, map) :: {map, t}
  def decode(state, yaml) do
    {state, content} = decode_content(state, yaml)
    {state, headers} = decode_headers(state, yaml)
    {state, links} = decode_links(state, yaml)

    response = %__MODULE__{
      description: Map.fetch!(yaml, "description"),
      headers: headers,
      content: content,
      links: links
    }

    {state, response}
  end

  @spec decode_content(map, map) :: {map, %{optional(String.t()) => Media.t()}}
  defp decode_content(state, %{"content" => content}) do
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

  defp decode_content(state, _yaml), do: {state, %{}}

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

  @spec decode_links(map, map) :: {map, %{optional(String.t()) => Header.t()} | nil}
  defp decode_links(state, %{"links" => links}) do
    with_path(state, links, "links", fn state, links ->
      Enum.reduce(links, {state, %{}}, fn {key, link}, {state, links} ->
        {state, link} = with_path(state, link, key, &Link.decode/2)
        {state, Map.put(links, key, link)}
      end)
    end)
  end

  defp decode_links(state, _yaml), do: {state, nil}
end
