defmodule OpenAPI.Spec do
  @moduledoc false
  require Logger
  import OpenAPI.Reader.State

  alias OpenAPI.Reader.State
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

  @spec decode(State.t(), String.t()) :: State.t()
  def decode(state, filename) do
    yaml = state.files[filename]

    spec_version = Map.fetch!(yaml, "openapi")
    {state, info} = decode_info(state, yaml)
    {state, servers} = decode_servers(state, yaml)
    {state, components} = decode_components(state, yaml)
    {state, paths} = decode_paths(state, yaml)
    {state, tags} = decode_tags(state, yaml)
    {state, external_docs} = decode_external_docs(state, yaml)

    spec = %__MODULE__{
      openapi: spec_version,
      info: info,
      servers: servers,
      paths: paths,
      components: components,
      security: [],
      tags: tags,
      external_docs: external_docs
    }

    %State{state | spec: merge(state.spec, spec)}
  end

  @spec decode_info(State.t(), State.yaml()) :: {State.t(), Info.t()}
  defp decode_info(state, %{"info" => info}), do: with_path(state, info, "info", &Info.decode/2)

  @spec decode_servers(State.t(), State.yaml()) :: {State.t(), [Server.t()]}
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

  @spec decode_components(State.t(), State.yaml()) :: {State.t(), Components.t()}
  defp decode_components(state, %{"components" => components}) do
    with_path(state, components, "components", &Components.decode/2)
  end

  defp decode_components(state, _yaml), do: {state, Components.decode(state, %{})}

  @spec decode_tags(State.t(), State.yaml()) :: {State.t(), [Tag.t()]}
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

  defp decode_tags(state, _yaml), do: {state, []}

  @spec decode_external_docs(State.t(), State.yaml()) :: {State.t(), ExternalDocumentation.t()}
  defp decode_external_docs(state, %{"externalDocs" => docs}) do
    with_path(state, docs, "externalDocs", &ExternalDocumentation.decode/2)
  end

  defp decode_external_docs(state, _docs), do: {state, nil}

  @spec decode_paths(State.t(), State.yaml()) :: {State.t(), %{optional(String.t()) => Item.t()}}
  defp decode_paths(state, %{"paths" => paths}) do
    with_path(state, paths, "paths", fn state, paths ->
      Enum.reduce(paths, {state, %{}}, fn {key, path}, {state, paths} ->
        {state, path} = with_path(state, path, key, &Item.decode/2)
        {state, Map.put(paths, key, path)}
      end)
    end)
  end

  defp decode_paths(state, _yaml) do
    Logger.warning("Evaluating spec with no `paths` object; this will likely result in no output")
    {state, %{}}
  end

  @spec merge(t | nil, t) :: t
  defp merge(nil, spec_two), do: spec_two

  defp merge(spec_one, spec_two) do
    %__MODULE__{
      openapi: openapi_one,
      info: info_one,
      servers: servers_one,
      components: components_one,
      security: security_one,
      tags: tags_one,
      external_docs: external_docs_one
    } = spec_one

    %__MODULE__{
      servers: servers_two,
      components: components_two,
      security: security_two,
      tags: tags_two
    } = spec_two

    %__MODULE__{
      openapi: openapi_one,
      info: info_one,
      servers: servers_one ++ servers_two,
      components: Components.merge(components_one, components_two),
      security: security_one ++ security_two,
      tags: tags_one ++ tags_two,
      external_docs: external_docs_one
    }
  end
end
