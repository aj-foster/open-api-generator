defmodule OpenAPI.Spec.Components do
  @moduledoc "Raw components map from the OpenAPI spec"
  import OpenAPI.Reader.State

  alias OpenAPI.Spec
  alias OpenAPI.Spec.Path.Parameter
  alias OpenAPI.Spec.RequestBody
  alias OpenAPI.Spec.Response
  alias OpenAPI.Spec.Schema
  alias OpenAPI.Spec.Schema.Example

  @type t :: %__MODULE__{
          schemas: %{optional(String.t()) => [Schema.t()]},
          responses: %{optional(String.t()) => [Response.t()]},
          parameters: %{optional(String.t()) => [Parameter.t() | Spec.ref()]},
          examples: %{optional(String.t()) => [Example.t()]},
          request_bodies: %{optional(String.t()) => [RequestBody.t()]},
          headers: %{optional(String.t()) => [Spec.Path.Header.t()]},
          security_schemes: %{optional(String.t()) => [nil]},
          links: %{optional(String.t()) => [Spec.Link.t()]},
          callbacks: %{optional(String.t()) => [nil]}
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

  @doc false
  @spec decode(map, map) :: {map, t}
  def decode(state, yaml) do
    {state, examples} = decode_examples(state, yaml)
    {state, parameters} = decode_parameters(state, yaml)
    {state, request_bodies} = decode_request_bodies(state, yaml)
    {state, responses} = decode_responses(state, yaml)
    {state, schemas} = decode_schemas(state, yaml)

    components = %__MODULE__{
      schemas: schemas,
      responses: responses,
      parameters: parameters,
      examples: examples,
      request_bodies: request_bodies,
      headers: %{},
      security_schemes: %{},
      links: %{},
      callbacks: %{}
    }

    {state, components}
  end

  @spec decode_examples(map, map) :: {map, %{optional(String.t()) => Example.t()}}
  defp decode_examples(state, %{"examples" => examples}) do
    with_path(state, examples, "examples", fn state, examples ->
      Enum.reduce(examples, {state, %{}}, fn {key, example}, {state, examples} ->
        {state, example} =
          with_path(state, example, key, fn state, example ->
            with_ref(state, example, &Example.decode/2)
          end)

        {state, Map.put(examples, key, example)}
      end)
    end)
  end

  defp decode_examples(state, _yaml), do: {state, %{}}

  @spec decode_parameters(map, map) :: {map, %{optional(String.t()) => Parameter.t()}}
  defp decode_parameters(state, %{"parameters" => yaml}) do
    with_path(state, yaml, "parameters", fn state, yaml ->
      Enum.reduce(yaml, {state, %{}}, fn {name, parameter_or_ref}, {state, parameters} ->
        {state, schema} =
          with_path(state, parameter_or_ref, name, fn state, parameter_or_ref ->
            with_ref(state, parameter_or_ref, &Parameter.decode/2)
          end)

        {state, Map.put(parameters, name, schema)}
      end)
    end)
  end

  defp decode_parameters(state, _yaml), do: {state, %{}}

  @spec decode_request_bodies(map, map) :: {map, %{optional(String.t()) => RequestBody.t()}}
  defp decode_request_bodies(state, %{"requestBodies" => yaml}) do
    with_path(state, yaml, "requestBodies", fn state, yaml ->
      Enum.reduce(yaml, {state, %{}}, fn {name, request_body_or_ref}, {state, request_bodies} ->
        {state, schema} =
          with_path(state, request_body_or_ref, name, fn state, request_body_or_ref ->
            with_ref(state, request_body_or_ref, &RequestBody.decode/2)
          end)

        {state, Map.put(request_bodies, name, schema)}
      end)
    end)
  end

  defp decode_request_bodies(state, _yaml), do: {state, %{}}

  @spec decode_responses(map, map) :: {map, %{optional(String.t()) => RequestBody.t()}}
  defp decode_responses(state, %{"responses" => yaml}) do
    with_path(state, yaml, "responses", fn state, yaml ->
      Enum.reduce(yaml, {state, %{}}, fn {name, response_or_ref}, {state, responses} ->
        {state, schema} =
          with_path(state, response_or_ref, name, fn state, response_or_ref ->
            with_ref(state, response_or_ref, &Response.decode/2)
          end)

        {state, Map.put(responses, name, schema)}
      end)
    end)
  end

  defp decode_responses(state, _yaml), do: {state, %{}}

  @spec decode_schemas(map, map) :: {map, %{optional(String.t()) => Schema.t()}}
  defp decode_schemas(state, %{"schemas" => yaml}) do
    with_path(state, yaml, "schemas", fn state, yaml ->
      Enum.reduce(yaml, {state, %{}}, fn {name, schema_or_ref}, {state, schemas} ->
        {state, schema} =
          with_path(state, schema_or_ref, name, fn state, schema_or_ref ->
            with_schema_ref(state, schema_or_ref, &Schema.decode/2)
          end)

        {state, Map.put(schemas, name, schema)}
      end)
    end)
  end

  defp decode_schemas(state, _yaml), do: {state, %{}}

  @doc false
  @spec merge(t, t) :: t
  def merge(components_one, components_two) do
    %__MODULE__{
      schemas: Map.merge(components_one.schemas, components_two.schemas),
      responses: Map.merge(components_one.responses, components_two.responses),
      parameters: Map.merge(components_one.parameters, components_two.parameters),
      examples: Map.merge(components_one.examples, components_two.examples),
      request_bodies: Map.merge(components_one.request_bodies, components_two.request_bodies),
      headers: Map.merge(components_one.headers, components_two.headers),
      security_schemes:
        Map.merge(components_one.security_schemes, components_two.security_schemes),
      links: Map.merge(components_one.links, components_two.links),
      callbacks: Map.merge(components_one.callbacks, components_two.callbacks)
    }
  end
end
