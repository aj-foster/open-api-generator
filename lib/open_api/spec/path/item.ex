defmodule OpenAPI.Spec.Path.Item do
  @moduledoc false
  use OpenAPI.Spec.Helper

  alias OpenAPI.Spec

  @type t :: %__MODULE__{
          "$ref": String.t() | nil,
          summary: String.t() | nil,
          description: String.t() | nil,
          get: Spec.Path.Operation.t() | nil,
          put: Spec.Path.Operation.t() | nil,
          post: Spec.Path.Operation.t() | nil,
          delete: Spec.Path.Operation.t() | nil,
          options: Spec.Path.Operation.t() | nil,
          head: Spec.Path.Operation.t() | nil,
          patch: Spec.Path.Operation.t() | nil,
          trace: Spec.Path.Operation.t() | nil,
          servers: [Spec.Server.t()],
          parameters: nil
        }

  defstruct [
    :"$ref",
    :summary,
    :description,
    :get,
    :put,
    :post,
    :delete,
    :options,
    :head,
    :patch,
    :trace,
    :servers,
    :parameters
  ]

  @decoders %{
    "$ref": :string,
    summary: :string,
    description: :string,
    get: Spec.Path.Operation,
    put: Spec.Path.Operation,
    post: Spec.Path.Operation,
    delete: Spec.Path.Operation,
    options: Spec.Path.Operation,
    head: Spec.Path.Operation,
    patch: Spec.Path.Operation,
    trace: Spec.Path.Operation,
    servers: {[Spec.Server], default: []},
    parameters: nil
  }
end
