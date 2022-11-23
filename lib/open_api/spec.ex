defmodule OpenAPI.Spec do
  @moduledoc """
  Open API specification expressed using Elixir structs.
  """
  import OpenAPI.Spec.Helper

  alias OpenAPI.Spec
  alias OpenAPI.Spec.Components
  alias OpenAPI.Spec.ExternalDocumentation
  alias OpenAPI.Spec.Info
  alias OpenAPI.Spec.Path.Item
  alias OpenAPI.Spec.Server
  alias OpenAPI.Spec.Tag

  #
  # Definition
  #

  @typedoc "Open API specification"
  @type t :: %__MODULE__{
          openapi: String.t(),
          info: Info.t(),
          servers: [Server.t()],
          paths: %{optional(:string) => Item.t()},
          components: Components.t(),
          security: [term],
          tags: [term],
          external_docs: ExternalDocumentation.t() | nil
        }

  defstruct [
    :openapi,
    :info,
    :servers,
    :paths,
    :components,
    :security,
    :tags,
    :external_docs
  ]

  #
  # Decoder
  #

  @spec decode(map) :: t
  def decode(state) do
    yaml = state.files[""]

    {state, info} = decode_info(state, yaml)
    {state, servers} = decode_servers(state, yaml)
    {state, components} = decode_components(state, yaml)
    {state, paths} = decode_paths(state, yaml)
    {state, tags} = decode_tags(state, yaml)
    {_state, external_docs} = decode_external_docs(state, yaml)

    %__MODULE__{
      openapi: Map.fetch!(yaml, "openapi"),
      info: info,
      servers: servers,
      paths: paths,
      components: components,
      security: [],
      tags: tags,
      external_docs: external_docs
    }
  end

  @spec decode_info(map, map) :: {map, Info.t()}
  defp decode_info(state, %{"info" => info}), do: with_path(state, info, "info", &Info.decode/2)

  @spec decode_servers(map, map) :: {map, [Server.t()]}
  defp decode_servers(state, %{"servers" => servers}) when is_list(servers) do
    with_path(state, servers, "servers", fn state, servers ->
      {state, servers} =
        servers
        |> Enum.with_index()
        |> Enum.reduce({state, []}, fn {server, index}, {state, servers} ->
          {state, server} = with_path(state, server, index, &Server.decode/2)
          {state, [server | servers]}
        end)

      {state, Enum.reverse(servers)}
    end)
  end

  defp decode_servers(state, _yaml), do: {state, [%Spec.Server{url: "/"}]}

  @spec decode_components(map, map) :: {map, Components.t()}
  defp decode_components(state, %{"components" => components}) do
    with_path(state, components, "components", &Components.decode/2)
  end

  @spec decode_tags(map, map) :: {map, [Tag.t()]}
  defp decode_tags(state, %{"tags" => tags}) do
    with_path(state, tags, "tags", fn state, tags ->
      {state, tags} =
        tags
        |> Enum.with_index()
        |> Enum.reduce({state, []}, fn {tag, index}, {state, tags} ->
          {state, tag} = with_path(state, tag, index, &Tag.decode/2)
          {state, [tag | tags]}
        end)

      {state, Enum.reverse(tags)}
    end)
  end

  @spec decode_external_docs(map, map) :: {map, ExternalDocumentation.t()}
  defp decode_external_docs(state, %{"external_docs" => docs}) do
    with_path(state, docs, "external_docs", &ExternalDocumentation.decode/2)
  end

  defp decode_external_docs(state, _docs), do: {state, nil}

  @spec decode_paths(map, map) :: {map, %{optional(String.t()) => Item.t()}}
  defp decode_paths(state, %{"paths" => paths}) do
    with_path(state, paths, "paths", fn state, paths ->
      Enum.reduce(paths, {state, %{}}, fn {key, path}, {state, paths} ->
        {state, path} = with_path(state, path, key, &Item.decode/2)
        {state, Map.put(paths, key, path)}
      end)
    end)
  end
end
