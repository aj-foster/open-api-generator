defmodule OpenAPI.Spec.Path.Operation do
  @moduledoc false
  alias OpenAPI.Spec

  @type t :: %__MODULE__{
          tags: [String.t()],
          summary: String.t() | nil,
          description: String.t() | nil,
          external_docs: Spec.ExternalDocumentation.t() | nil,
          operation_id: String.t() | nil,
          parameters: nil,
          request_body: nil,
          responses: nil,
          callbacks: nil,
          deprecated: boolean,
          security: nil,
          servers: [Spec.Server.t()]
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

  @decoders %{
    tags: {[:string], default: []},
    summary: :string,
    description: :string,
    external_docs: Spec.ExternalDocumentation,
    operation_id: :string,
    parameters: nil,
    request_body: nil,
    responses: nil,
    callbacks: nil,
    deprecated: {:boolean, default: false},
    security: nil,
    servers: {[Spec.Server], default: []}
  }

  def decoders, do: @decoders
end
