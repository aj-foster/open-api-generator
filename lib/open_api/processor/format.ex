defmodule OpenAPI.Processor.Format do
  @moduledoc """
  Default implementation for format-related callbacks

  This module contains the default implementations for:

    * `c:OpenAPI.Processor.schema_format/2`

  ## Configuration

  This implementation does not currently use any configuration.
  """
  alias OpenAPI.Processor.Schema
  alias OpenAPI.Processor.State
  alias OpenAPI.Spec.Schema, as: SchemaSpec

  @type format :: :struct | :typed_map | :map

  @spec schema_format(State.t(), Schema.t()) :: format | :unknown
  def schema_format(state, schema) do
    %State{schemas_by_ref: schemas_by_ref, schema_specs_by_ref: schema_specs_by_ref} = state
    %Schema{ref: ref} = schema

    schema_spec = Map.fetch!(schema_specs_by_ref, ref)

    case {schema, schema_spec} do
      {_, %SchemaSpec{"$oag_last_ref_path": ["components", "schemas", _name]}} ->
        :struct

      {_, %SchemaSpec{"$oag_last_ref_path": ["components", "schemas", _name, "items"]}} ->
        :struct

      {_,
       %SchemaSpec{"$oag_last_ref_path": ["components", "responses", _, "content", _, "schema"]}} ->
        :struct

      {%Schema{context: [{:request, _, _, _}]}, _} ->
        :typed_map

      {%Schema{context: [{:response, _, _, _, _}]}, _} ->
        :typed_map

      {_, %SchemaSpec{title: title}} when is_binary(title) ->
        :struct

      {%Schema{context: [{:field, parent_ref, _}]}, _} ->
        case Map.fetch!(schemas_by_ref, parent_ref) do
          %Schema{output_format: nil} -> :unknown
          %Schema{output_format: format} -> format
        end

      _else ->
        :map
    end
  end
end
