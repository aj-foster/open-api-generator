defmodule OpenAPI.Spec.Path.Operation do
  @moduledoc false
  import OpenAPI.Spec.Helper

  alias OpenAPI.Spec.Path.Parameter
  alias OpenAPI.Spec.ExternalDocumentation
  alias OpenAPI.Spec.RequestBody
  alias OpenAPI.Spec.Response
  alias OpenAPI.Spec.Server

  @type t :: %__MODULE__{
          tags: [String.t()],
          summary: String.t() | nil,
          description: String.t() | nil,
          external_docs: ExternalDocumentation.t() | nil,
          operation_id: String.t() | nil,
          parameters: [Parameter.t()],
          request_body: RequestBody.t() | nil,
          responses: %{optional(String.t()) => Response.t()},
          callbacks: nil,
          deprecated: boolean,
          security: nil,
          servers: [Server.t()]
        }

  defstruct [
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

  @spec decode(map, map) :: {map, t}
  def decode(state, yaml) do
    {state, external_docs} = decode_external_docs(state, yaml)
    {state, parameters} = decode_parameters(state, yaml)
    {state, request_body} = decode_request_body(state, yaml)
    {state, responses} = decode_responses(state, yaml)
    {state, servers} = decode_servers(state, yaml)

    operation = %__MODULE__{
      tags: Map.get(yaml, "tags", []),
      summary: Map.get(yaml, "summary"),
      description: Map.get(yaml, "description"),
      external_docs: external_docs,
      operation_id: Map.get(yaml, "operation_id"),
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
  defp decode_external_docs(state, %{"external_docs" => docs}) do
    with_path(state, docs, "external_docs", &ExternalDocumentation.decode/2)
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
  def decode_request_body(state, %{"request_body" => request_body}) do
    with_path(state, request_body, "request_body", &RequestBody.decode/2)
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
