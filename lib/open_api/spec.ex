defmodule OpenAPI.Spec do
  @moduledoc """
  Open API specification expressed using Elixir structs.
  """
  use OpenAPI.Spec.Helper

  alias OpenAPI.Spec
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

  @typep pre_spec :: %__MODULE__{}

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

  @decoders %{
    openapi: :string,
    info: Spec.Info,
    servers: {[Spec.Server], default: [%Spec.Server{url: "/"}]},
    paths: {%{:string => Spec.Path.Item}, default: %{}},
    components: Spec.Components,
    security: nil,
    tags: {[Spec.Tag], default: []},
    external_docs: Spec.ExternalDocumentation
  }

  #
  # Decoder
  #

  @spec decode(map) :: t
  def decode(state) do
    spec = %__MODULE__{}
    yaml = state.files[""]
    {state, spec} = decode_openapi(state, spec, yaml)
    {state, spec} = decode_info(state, spec, yaml)
    {state, spec} = decode_servers(state, spec, yaml)
    {state, spec} = decode_tags(state, spec, yaml)
    {_state, spec} = decode_external_docs(state, spec, yaml)

    spec
  end

  @spec decode_openapi(map, pre_spec, map) :: {map, pre_spec}
  defp decode_openapi(state, spec, %{"openapi" => openapi}) do
    {state, %{spec | openapi: openapi}}
  end

  @spec decode_info(map, pre_spec, map) :: {map, pre_spec}
  defp decode_info(state, spec, %{"info" => info}) do
    {state, info} = Info.decode(state, spec, info)
    {state, %{spec | info: info}}
  end

  @spec decode_servers(map, pre_spec, map) :: {map, pre_spec}
  defp decode_servers(state, spec, %{"servers" => servers}) when is_list(servers) do
    {state, servers} =
      Enum.reduce(servers, {state, []}, fn server, {state, servers} ->
        {state, server} = Server.decode(state, spec, server)
        {state, [server | servers]}
      end)

    {state, %{spec | servers: Enum.reverse(servers)}}
  end

  defp decode_servers(state, spec, _yaml),
    do: {state, %{spec | servers: [%Spec.Server{url: "/"}]}}

  @spec decode_tags(map, pre_spec, map) :: {map, pre_spec}
  defp decode_tags(state, spec, %{"tags" => tags}) do
    {state, tags} =
      Enum.reduce(tags, {state, []}, fn tag, {state, tags} ->
        {state, tag} = Tag.decode(state, spec, tag)
        {state, [tag | tags]}
      end)

    {state, %{spec | tags: Enum.reverse(tags)}}
  end

  @spec decode_external_docs(map, pre_spec, map) :: {map, pre_spec}
  defp decode_external_docs(state, spec, %{"external_docs" => docs}) do
    {state, docs} = ExternalDocumentation.decode(state, spec, docs)
    {state, %{spec | external_docs: docs}}
  end

  defp decode_external_docs(state, spec, _docs), do: {state, spec}
end
