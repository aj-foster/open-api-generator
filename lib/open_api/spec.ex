defmodule OpenAPI.Spec do
  @moduledoc """
  Open API specification expressed using Elixir structs.
  """
  alias OpenAPI.Spec

  @typedoc "Open API specification"
  @type t :: %__MODULE__{
          openapi: String.t(),
          info: Spec.Info.t(),
          servers: [Spec.Server.t()],
          paths: term,
          components: term,
          security: [term],
          tags: [term],
          external_docs: term
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
    paths: nil,
    components: nil,
    security: nil,
    tags: nil,
    external_docs: nil
  }

  def decoders, do: @decoders
end
