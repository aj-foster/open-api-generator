defmodule OpenAPI.Spec do
  @moduledoc """
  Open API specification expressed using Elixir structs.
  """
  use OpenAPI.Spec.Helper

  alias OpenAPI.Spec

  @typedoc "Open API specification"
  @type t :: %__MODULE__{
          openapi: String.t(),
          info: Spec.Info.t(),
          servers: [Spec.Server.t()],
          paths: %{optional(:string) => nil},
          components: term,
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

  @decoders %{
    openapi: :string,
    info: Spec.Info,
    servers: {[Spec.Server], default: [%Spec.Server{url: "/"}]},
    paths: {%{:string => Spec.Path.Item}, default: %{}},
    components: nil,
    security: nil,
    tags: {[Spec.Tag], default: []},
    external_docs: Spec.ExternalDocumentation
  }
end
