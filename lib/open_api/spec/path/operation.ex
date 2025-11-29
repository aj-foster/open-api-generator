defmodule OpenAPI.Spec.Path.Operation do
  @moduledoc "Raw operation from the OpenAPI spec"
  import OpenAPI.Reader.State

  alias OpenAPI.Spec
  alias OpenAPI.Spec.Path.Parameter
  alias OpenAPI.Spec.ExternalDocumentation
  alias OpenAPI.Spec.RequestBody
  alias OpenAPI.Spec.Response
  alias OpenAPI.Spec.Server

  @type t :: %__MODULE__{
          "$oag_base_file": String.t(),
          "$oag_base_file_path": [Spec.path_segment()],
          "$oag_last_ref_file": String.t() | nil,
          "$oag_last_ref_path": [Spec.path_segment()],
          "$oag_path": String.t(),
          "$oag_path_method": String.t(),
          "$oag_path_parameters": [Parameter.t()],
          tags: [String.t()],
          summary: String.t() | nil,
          description: String.t() | nil,
          external_docs: ExternalDocumentation.t() | nil,
          operation_id: String.t() | nil,
          parameters: [Parameter.t()],
          request_body: RequestBody.t() | nil,
          responses: %{optional(pos_integer | :default) => Response.t()},
          callbacks: nil,
          deprecated: boolean,
          security: nil,
          servers: [Server.t()]
        }

  defstruct [
    :"$oag_base_file",
    :"$oag_base_file_path",
    :"$oag_last_ref_file",
    :"$oag_last_ref_path",
    :"$oag_path",
    :"$oag_path_method",
    :"$oag_path_parameters",
    :tags,
    :summary,
    :description,
    :external_docs,
    :operation_id,
    :parameters,
    :request_body,
    :responses,
    :callbacks,
    :deprecated,
    :security,
    :servers
  ]

  @doc false
  @spec decode(map, map) :: {map, t}
  def decode(state, yaml) do
    {state, external_docs} = decode_external_docs(state, yaml)
    {state, parameters} = decode_parameters(state, yaml)
    {state, request_body} = decode_request_body(state, yaml)
    {state, responses} = decode_responses(state, yaml)
    {state, servers} = decode_servers(state, yaml)

    reverse_base_file_path = Map.fetch!(state, :base_file_path)
    [method, path | _] = reverse_base_file_path

    operation = %__MODULE__{
      "$oag_base_file": Map.fetch!(state, :base_file),
      "$oag_base_file_path": reverse_base_file_path |> Enum.reverse(),
      "$oag_last_ref_file": Map.fetch!(state, :last_ref_file),
      "$oag_last_ref_path": Map.fetch!(state, :last_ref_path) |> Enum.reverse(),
      "$oag_path": path,
      "$oag_path_method": method,
      "$oag_path_parameters": Map.fetch!(state, :path_parameters),
      tags: Map.get(yaml, "tags", []),
      summary: Map.get(yaml, "summary"),
      description: Map.get(yaml, "description"),
      external_docs: external_docs,
      operation_id: Map.get(yaml, "operationId"),
      parameters: parameters,
      request_body: request_body,
      responses: responses,
      callbacks: nil,
      deprecated: Map.get(yaml, "deprecated", false),
      security: nil,
      servers: servers
    }

    {state, operation}
  end

  @spec decode_external_docs(map, map) :: {map, ExternalDocumentation.t()}
  defp decode_external_docs(state, %{"externalDocs" => docs}) do
    with_path(state, docs, "externalDocs", &ExternalDocumentation.decode/2)
  end

  defp decode_external_docs(state, _docs), do: {state, nil}

  @spec decode_parameters(map, map) :: {map, [Parameter.t()]}
  def decode_parameters(state, %{"parameters" => parameters}) do
    with_path(state, parameters, "parameters", fn state, parameters ->
      parameters
      |> Enum.with_index()
      |> Enum.reverse()
      |> Enum.reduce({state, []}, fn {parameter, index}, {state, list} ->
        {state, element} =
          with_path(state, parameter, index, fn state, parameter ->
            with_ref(state, parameter, &Parameter.decode/2)
          end)

        {state, [element | list]}
      end)
    end)
  end

  def decode_parameters(state, _yaml), do: {state, []}

  @spec decode_request_body(map, map) :: {map, RequestBody.t() | nil}
  def decode_request_body(state, %{"requestBody" => request_body}) do
    with_path(state, request_body, "requestBody", fn state, request_body ->
      with_ref(state, request_body, &RequestBody.decode/2)
    end)
  end

  def decode_request_body(state, _yaml), do: {state, nil}

  @spec decode_responses(map, map) :: {map, %{optional(String.t()) => t}}
  defp decode_responses(state, %{"responses" => responses}) do
    with_path(state, responses, "responses", fn state, responses ->
      Enum.reduce(responses, {state, %{}}, fn {key, response}, {state, responses} ->
        {state, property} =
          with_path(state, response, key, fn state, response ->
            with_ref(state, response, &Response.decode/2)
          end)

        key =
          cond do
            is_integer(key) -> key
            key == "default" -> :default
            String.match?(key, ~r/^[1-5]XX$/) -> key
            :else -> String.to_integer(key)
          end

        {state, Map.put(responses, key, property)}
      end)
    end)
  end

  defp decode_responses(state, _schema), do: {state, %{}}

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

  defp decode_servers(state, _yaml), do: {state, [%Server{url: "/"}]}
end
