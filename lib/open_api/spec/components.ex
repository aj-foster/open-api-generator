defmodule OpenAPI.Spec.Components do
  @moduledoc false
  import OpenAPI.Spec.Helper

  alias OpenAPI.Spec
  alias OpenAPI.Spec.Schema

  @type t :: %__MODULE__{
          schemas: %{optional(String.t()) => [Spec.Ref.t() | Spec.Schema.t()]},
          responses: %{optional(String.t()) => [Spec.Ref.t() | Spec.Response.t()]},
          parameters: %{optional(String.t()) => [Spec.Ref.t() | Spec.Path.Parameter.t()]},
          examples: %{optional(String.t()) => [Spec.Ref.t() | Spec.Schema.Example.t()]},
          request_bodies: %{optional(String.t()) => [Spec.Ref.t() | Spec.RequestBody.t()]},
          headers: %{optional(String.t()) => [Spec.Ref.t() | Spec.Path.Header.t()]},
          security_schemes: %{optional(String.t()) => [Spec.Ref.t() | nil]},
          links: %{optional(String.t()) => [Spec.Ref.t() | Spec.Link.t()]},
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
    responses: {%{:string => [Spec.Ref, Spec.Response]}, default: %{}},
    parameters: {%{:string => [Spec.Ref, Spec.Path.Parameter]}, default: %{}},
    examples: {%{:string => [Spec.Ref, Spec.Schema.Example]}, default: %{}},
    request_bodies: {%{:string => [Spec.Ref, Spec.RequestBody]}, default: %{}},
    headers: {%{:string => [Spec.Ref, Spec.Path.Header]}, default: %{}},
    security_schemes: {%{:string => [Spec.Ref, nil]}, default: %{}},
    links: {%{:string => [Spec.Ref, Spec.Link]}, default: %{}},
    callbacks: {%{:string => [Spec.Ref, nil]}, default: %{}}
  }

  @spec decode(map, map) :: {map, t}
  def decode(state, yaml) do
    {state, schemas} = decode_schemas(state, yaml)

    components = %__MODULE__{
      schemas: schemas,
      responses: %{},
      parameters: %{},
      examples: %{},
      request_bodies: %{},
      headers: %{},
      security_schemes: %{},
      links: %{},
      callbacks: %{}
    }

    {state, components}
  end

  @spec decode_schemas(map, map) :: {map, %{optional(String.t()) => Schema.t()}}
  defp decode_schemas(state, %{"schemas" => yaml}) do
    with_path(state, yaml, "schemas", fn state, yaml ->
      Enum.reduce(yaml, {state, %{}}, fn {name, schema_or_ref}, {state, schemas} ->
        {state, schema} =
          with_path(state, schema_or_ref, name, fn state, schema_or_ref ->
            with_ref(state, schema_or_ref, &Schema.decode/2)
          end)

        {state, Map.put(schemas, name, schema)}
      end)
    end)
  end
end
