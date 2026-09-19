defmodule Klaviyo.GetTagCampaignRelationshipsResponseCollection do
  @moduledoc """
  Provides struct and type for a GetTagCampaignRelationshipsResponseCollection
  """

  @type t :: %__MODULE__{data: [Klaviyo.GetTagCampaignRelationshipsResponseCollectionData.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{Klaviyo.GetTagCampaignRelationshipsResponseCollectionData, :t}]]
  end
end
