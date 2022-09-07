defmodule OpenAPI.Spec.Components do
  @moduledoc false
  use OpenAPI.Spec.Helper

  alias OpenAPI.Spec

  @type t :: %__MODULE__{
          schemas: %{optional(String.t()) => [Spec.Ref.t() | Spec.Schema.t()]},
          responses: %{optional(String.t()) => [Spec.Ref.t() | nil]},
          parameters: %{optional(String.t()) => [Spec.Ref.t() | Spec.Path.Parameter.t()]},
          examples: %{optional(String.t()) => [Spec.Ref.t() | Spec.Schema.Example.t()]},
          request_bodies: %{optional(String.t()) => [Spec.Ref.t() | nil]},
          headers: %{optional(String.t()) => [Spec.Ref.t() | Spec.Path.Header.t()]},
          security_schemes: %{optional(String.t()) => [Spec.Ref.t() | nil]},
          links: %{optional(String.t()) => [Spec.Ref.t() | nil]},
          callbacks: %{optional(String.t()) => [Spec.Ref.t() | nil]}
        }

  defstruct [
    :schemas,
    :responses,
    :parameters,
    :examples,
    :request_bodies,
    :headers,
    :security_schemes,
    :links,
    :callbacks
  ]

  @decoders %{
    schemas: {%{:string => [Spec.Ref, Spec.Schema]}, default: %{}},
    responses: {%{:string => [Spec.Ref, nil]}, default: %{}},
    parameters: {%{:string => [Spec.Ref, Spec.Path.Parameter]}, default: %{}},
    examples: {%{:string => [Spec.Ref, Spec.Schema.Example]}, default: %{}},
    request_bodies: {%{:string => [Spec.Ref, nil]}, default: %{}},
    headers: {%{:string => [Spec.Ref, Spec.Path.Header]}, default: %{}},
    security_schemes: {%{:string => [Spec.Ref, nil]}, default: %{}},
    links: {%{:string => [Spec.Ref, nil]}, default: %{}},
    callbacks: {%{:string => [Spec.Ref, nil]}, default: %{}}
  }
end
