defmodule Klaviyo.GetFlowMessageFlowActionRelationshipResponse do
  @moduledoc """
  Provides struct and type for a GetFlowMessageFlowActionRelationshipResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.GetFlowMessageFlowActionRelationshipResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.GetFlowMessageFlowActionRelationshipResponseData, :t}]
  end
end
