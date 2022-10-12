defmodule OpenAPI.Spec.Path.Operation do
  @moduledoc false
  use OpenAPI.Spec.Helper

  alias OpenAPI.Spec

  @type t :: %__MODULE__{
          tags: [String.t()],
          summary: String.t() | nil,
          description: String.t() | nil,
          external_docs: Spec.ExternalDocumentation.t() | nil,
          operation_id: String.t() | nil,
          parameters: nil,
          request_body: Spec.RequestBody.t() | nil,
          responses: %{optional(String.t()) => Spec.Ref.t() | Spec.Response.t()},
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
    parameters: {[[Spec.Ref, Spec.Path.Parameter]], default: []},
    request_body: Spec.RequestBody,
    responses: %{:string => [Spec.Ref, Spec.Response]},
    callbacks: nil,
    deprecated: {:boolean, default: false},
    security: nil,
    servers: {[Spec.Server], default: []}
  }
end
