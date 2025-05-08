defmodule AttributionResponseObjectResourceRelationshipsCampaign do
  @moduledoc """
  Provides struct and type for a AttributionResponseObjectResourceRelationshipsCampaign
  """

  @type t :: %__MODULE__{data: AttributionResponseObjectResourceRelationshipsCampaignData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {AttributionResponseObjectResourceRelationshipsCampaignData, :t}]
  end
end
