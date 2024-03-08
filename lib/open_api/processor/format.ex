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

  @type format :: :struct | :typed_map | :map

  @spec schema_format(State.t(), Schema.t()) :: format | :unknown
  def schema_format(state, schema_spec)

  def schema_format(_state, %Schema{context: [{:request, _, _, _}]}), do: :typed_map
  def schema_format(_state, %Schema{context: [{:response, _, _, _}]}), do: :typed_map

  def schema_format(state, %Schema{context: [{:field, parent_ref, _}]}) do
    %State{schemas_by_ref: schemas_by_ref} = state

    case Map.fetch!(schemas_by_ref, parent_ref) do
      %Schema{output_format: nil} -> :unknown
      %Schema{output_format: format} -> format
    end
  end

  def schema_format(_state, _schema), do: :struct
end
