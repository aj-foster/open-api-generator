defmodule GetFlowMessageTemplateRelationshipResponse do
  @moduledoc """
  Provides struct and type for a GetFlowMessageTemplateRelationshipResponse
  """

  @type t :: %__MODULE__{data: GetFlowMessageTemplateRelationshipResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {GetFlowMessageTemplateRelationshipResponseData, :t}]
  end
end
