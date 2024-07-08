defmodule GetFlowActionFlowRelationshipResponse do
  @moduledoc """
  Provides struct and type for a GetFlowActionFlowRelationshipResponse
  """

  @type t :: %__MODULE__{data: GetFlowActionFlowRelationshipResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {GetFlowActionFlowRelationshipResponseData, :t}]
  end
end
