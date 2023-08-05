defmodule OpenAPI.Processor.Naming do
  @moduledoc """
  Default plugin for naming operations and schemas
  """
  alias OpenAPI.Processor.State
  alias OpenAPI.Spec.Path.Operation, as: OperationSpec

  @doc """
  Choose the name of an operation client function based on its operation ID

  In this implementation, the operation ID is split up by slash characters with only the last
  portion taken (ex. "repos/get" becomes "get"), assuming that the module name will use the
  remaining portions. Then the value is normalized to be atom-friendly.

  Note that this function creates new atoms, and should not be run in a production environment.
  """
  @spec operation_function(State.t(), OperationSpec.t()) :: atom
  def operation_function(_state, operation_spec) do
    %OperationSpec{operation_id: id} = operation_spec

    id
    |> String.split("/", trim: true)
    |> List.last()
    |> normalize_identifier()
    |> String.to_atom()
  end

  #
  # Helpers
  #

  @doc """
  Normalize an identifier into snake_case

  ## Example

      iex> normalize_identifier("get-/customer/purchases/{date}_byId")
      "get_customer_purchases_date_by_id"

  """
  @spec normalize_identifier(String.t()) :: String.t()
  def normalize_identifier(input) do
    input
    |> String.split(~r/([^A-Za-z0-9]+)?([A-Z]+)?([a-z0-9]+)?/, include_captures: true, trim: true)
    |> Enum.map_join("_", fn segment ->
      segment
      |> String.replace(~r/^[^A-Za-z]+/, "")
      |> String.replace(~r/[^A-Za-z0-9]+$/, "")
      |> String.downcase()
    end)
  end
end
