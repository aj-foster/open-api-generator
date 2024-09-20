defmodule GetCampaignMessagesRelationshipListResponseCollection do
  @moduledoc """
  Provides struct and type for a GetCampaignMessagesRelationshipListResponseCollection
  """

  @type t :: %__MODULE__{data: [GetCampaignMessagesRelationshipListResponseCollectionData.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{GetCampaignMessagesRelationshipListResponseCollectionData, :t}]]
  end
end
