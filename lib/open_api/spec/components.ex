defmodule OpenAPI.Spec.Components do
  @moduledoc false
  use OpenAPI.Spec.Helper

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
    Enum.reduce(yaml, {state, %{}}, fn {name, schema_or_ref}, {state, schemas} ->
      {state, schema} = decode_schema(state, schema_or_ref)
      {state, Map.put(schemas, name, schema)}
    end)
  end

  @spec decode_schema(map, map) :: {map, Schema.t()}
  defp decode_schema(state, %{"$ref" => r}), do: ensure_schema(state, r)
  defp decode_schema(state, schema), do: Schema.decode(state, schema)

  @spec ensure_schema(map, String.t()) :: {map, t}
  defp ensure_schema(state, schema_ref) do
    stored_ref = state.schemas[schema_ref]

    if stored_ref do
      {state, stored_ref}
    else
      [file, path] = String.split(schema_ref, "#")
      state = ensure_file(state, file)
      yaml = get_in(state.files[file], String.split(path, "/", trim: true))

      decode(state, yaml)
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
