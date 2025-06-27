defmodule GetCampaignTagRelationshipListResponseCollection do
  @moduledoc """
  Provides struct and type for a GetCampaignTagRelationshipListResponseCollection
  """

  @type t :: %__MODULE__{data: [GetCampaignTagRelationshipListResponseCollectionData.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{GetCampaignTagRelationshipListResponseCollectionData, :t}]]
  end
end
