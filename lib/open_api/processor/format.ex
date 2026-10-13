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

  @spec schema_format(State.t(), Schema.t()) :: format
  def schema_format(state, schema) do
    %State{schema_specs_by_ref: schema_specs_by_ref} = state
    %Schema{ref: ref} = schema

    schema_spec = Map.fetch!(schema_specs_by_ref, ref)

    format_from_spec(schema_spec) ||
      format_from_context(state, schema) ||
      format_from_title(schema_spec) ||
      :map
  end

  @spec format_from_spec(SchemaSpec.t()) :: format | nil
  defp format_from_spec(%SchemaSpec{"$oag_last_ref_path": []}), do: :struct

  defp format_from_spec(%SchemaSpec{"$oag_last_ref_path": ["components", "schemas", _]}),
    do: :struct

  defp format_from_spec(%SchemaSpec{"$oag_last_ref_path": ["components", "schemas", _, "items"]}),
    do: :struct

  defp format_from_spec(%SchemaSpec{
         "$oag_last_ref_path": ["components", "responses", _, "content", _, "schema"]
       }),
       do: :struct

  defp format_from_spec(_), do: nil

  @spec format_from_context(State.t(), Schema.t()) :: format | nil
  defp format_from_context(_state, %Schema{context: [{:request, _, _, _}]}), do: :typed_map
  defp format_from_context(_state, %Schema{context: [{:response, _, _, _, _}]}), do: :typed_map

  defp format_from_context(state, %Schema{context: [{:field, parent_ref, _}]}) do
    parent_schema = Map.fetch!(state.schemas_by_ref, parent_ref)
    schema_format(state, parent_schema)
  end

  defp format_from_context(_state, _schema), do: nil

  @spec format_from_title(SchemaSpec.t()) :: format | nil
  defp format_from_title(%SchemaSpec{title: title}) when is_binary(title), do: :struct
  defp format_from_title(_), do: nil
end
