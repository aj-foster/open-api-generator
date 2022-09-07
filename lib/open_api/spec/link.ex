defmodule OpenAPI.Spec.Link do
  @moduledoc false
  use OpenAPI.Spec.Helper

  alias OpenAPI.Spec

  @type t :: %__MODULE__{
          operation_ref: String.t() | nil,
          operation_id: String.t() | nil,
          parameters: %{optional(String.t()) => any},
          request_body: any,
          description: String.t() | nil,
          server: Spec.Server.t() | nil
        }

  defstruct [
    :operation_ref,
    :operation_id,
    :parameters,
    :request_body,
    :description,
    :server
  ]

  @decoders %{
    operation_ref: :string,
    operation_id: :string,
    parameters: {%{:string => :any}, default: %{}},
    request_body: :any,
    description: :string,
    server: Spec.Server
  }

  def matches?(_value), do: true
end
