defmodule GetFlowMessageFlowActionRelationshipResponse do
  @moduledoc """
  Provides struct and type for a GetFlowMessageFlowActionRelationshipResponse
  """

  @type t :: %__MODULE__{data: GetFlowMessageFlowActionRelationshipResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {GetFlowMessageFlowActionRelationshipResponseData, :t}]
  end
end
