defmodule OpenAPI.Spec.Link do
  @moduledoc false
  import OpenAPI.Reader.State

  alias OpenAPI.Spec.Server

  @type t :: %__MODULE__{
          operation_ref: String.t() | nil,
          operation_id: String.t() | nil,
          parameters: %{optional(String.t()) => any},
          request_body: any,
          description: String.t() | nil,
          server: Server.t() | nil
        }

  defstruct [
    :operation_ref,
    :operation_id,
    :parameters,
    :request_body,
    :description,
    :server
  ]

  @spec decode(map, map) :: {map, t}
  def decode(state, yaml) do
    {state, server} = decode_server(state, yaml)

    link = %__MODULE__{
      description: Map.get(yaml, "description"),
      operation_id: Map.get(yaml, "operationId"),
      operation_ref: Map.get(yaml, "operationRef"),
      parameters: Map.get(yaml, "parameters"),
      request_body: Map.get(yaml, "requestBody"),
      server: server
    }

    {state, link}
  end

  @spec decode_server(map, map) :: {map, Server.t() | nil}
  def decode_server(state, %{"server" => server}) do
    with_path(state, server, "server", &Server.decode/2)
  end

  def decode_server(state, _yaml), do: {state, nil}
end
