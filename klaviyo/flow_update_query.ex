defmodule FlowUpdateQuery do
  @moduledoc """
  Provides struct and type for a FlowUpdateQuery
  """

  @type t :: %__MODULE__{data: FlowUpdateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {FlowUpdateQueryResourceObject, :t}]
  end
end
