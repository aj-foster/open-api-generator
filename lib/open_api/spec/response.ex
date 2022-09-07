defmodule OpenAPI.Spec.Response do
  @moduledoc false
  use OpenAPI.Spec.Helper

  alias OpenAPI.Spec

  @type t :: %__MODULE__{
          description: String.t(),
          headers: %{optional(String.t()) => Spec.Path.Header.t() | Spec.Ref.t()},
          content: %{optional(String.t()) => Spec.Schema.Media.t()},
          links: %{optional(String.t()) => Spec.Link.t() | Spec.Ref.t()}
        }

  defstruct [
    :description,
    :headers,
    :content,
    :links
  ]

  @decoders %{
    description: :string,
    headers: {%{:string => [Spec.Ref, Spec.Path.Header]}, default: %{}},
    content: {%{:string => Spec.Schema.Media}, default: %{}},
    links: {%{:string => [Spec.Ref, Spec.Link]}, default: %{}}
  }

  def matches?(_value), do: true
end
