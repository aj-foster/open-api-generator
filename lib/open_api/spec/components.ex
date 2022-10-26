defmodule OpenAPI.Spec.Components do
  @moduledoc false
  use OpenAPI.Spec.Helper

  alias OpenAPI.Spec

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

  @spec decode(map, map, map) :: {map, t}
  def decode(state, spec, yaml) do
    {state, schemas} = decode_schemas(state, spec, yaml)
    components = %__MODULE__{schemas: schemas}
    {state, components}
  end

  defp decode_schemas(state, spec, %{"schemas" => yaml}) do
    Enum.reduce(yaml, {state, %{}}, fn {name, schema_or_ref}, {state, schemas} ->
      {state, schema} = decode_schema(state, spec, schema_or_ref)
      {state, Map.put(schemas, name, schema)}
    end)
  end

  @spec decode_schema(map, map, map) :: {map, OpenAPI.Spec.Schema.t() | nil}
  defp decode_schema(state, spec, %{"$ref" => r}), do: ensure_schema(state, spec, r)
  defp decode_schema(state, spec, schema), do: OpenAPI.Spec.Schema.decode(state, spec, schema)

  @spec ensure_schema(map, map, String.t()) :: {map, OpenAPI.Spec.Schema.t()}
  defp ensure_schema(state, spec, schema_ref) do
    if Map.has_key?(state.schemas, schema_ref) do
      state
    else
      [file, path] = String.split(schema_ref, "#")
      state = ensure_file(state, file)
      yaml = get_in(state.files[file], String.split(path, "/"))

      decode(state, spec, yaml)
    end
  end

  @spec ensure_file(map, String.t()) :: map
  defp ensure_file(state, file) do
    if Map.has_key?(state.files, file) do
      state
    else
      OpenAPI.Reader.read(state, file)
    end
  end
end
