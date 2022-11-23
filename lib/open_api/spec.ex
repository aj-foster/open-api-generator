defmodule OpenAPI.Spec do
  @moduledoc """
  Open API specification expressed using Elixir structs.
  """

  alias OpenAPI.Spec
  alias OpenAPI.Spec.Components
  alias OpenAPI.Spec.ExternalDocumentation
  alias OpenAPI.Spec.Info
  alias OpenAPI.Spec.Server
  alias OpenAPI.Spec.Tag

  #
  # Definition
  #

  @typedoc "Open API specification"
  @type t :: %__MODULE__{
          openapi: String.t(),
          info: Spec.Info.t(),
          servers: [Spec.Server.t()],
          paths: %{optional(:string) => Spec.Path.Item.t()},
          components: Spec.Components.t(),
          security: [term],
          tags: [term],
          external_docs: Spec.ExternalDocumentation.t() | nil
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
    {state, tags} = decode_tags(state, yaml)
    {_state, external_docs} = decode_external_docs(state, yaml)

    %__MODULE__{
      openapi: Map.fetch!(yaml, "openapi"),
      info: info,
      servers: servers,
      paths: %{},
      components: components,
      security: [],
      tags: tags,
      external_docs: external_docs
    }
  end

  @spec decode_info(map, map) :: {map, Info.t()}
  defp decode_info(state, %{"info" => info}), do: Info.decode(state, info)

  @spec decode_servers(map, map) :: {map, [Server.t()]}
  defp decode_servers(state, %{"servers" => servers}) when is_list(servers) do
    {state, servers} =
      Enum.reduce(servers, {state, []}, fn server, {state, servers} ->
        {state, server} = Server.decode(state, server)
        {state, [server | servers]}
      end)

    {state, Enum.reverse(servers)}
  end

  defp decode_servers(state, _yaml), do: {state, [%Spec.Server{url: "/"}]}

  @spec decode_components(map, map) :: {map, Components.t()}
  defp decode_components(state, %{"components" => components}) do
    Components.decode(state, components)
  end

  @spec decode_tags(map, map) :: {map, [Tag.t()]}
  defp decode_tags(state, %{"tags" => tags}) do
    {state, tags} =
      Enum.reduce(tags, {state, []}, fn tag, {state, tags} ->
        {state, tag} = Tag.decode(state, tag)
        {state, [tag | tags]}
      end)

    {state, Enum.reverse(tags)}
  end

  @spec decode_external_docs(map, map) :: {map, ExternalDocumentation.t()}
  defp decode_external_docs(state, %{"external_docs" => docs}) do
    ExternalDocumentation.decode(state, docs)
  end

  defp decode_external_docs(state, _docs), do: {state, nil}
end
