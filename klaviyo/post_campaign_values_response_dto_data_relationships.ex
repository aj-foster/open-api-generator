defmodule PostCampaignValuesResponseDTODataRelationships do
  @moduledoc """
  Provides struct and type for a PostCampaignValuesResponseDTODataRelationships
  """

  @type t :: %__MODULE__{
          campaigns: PostCampaignValuesResponseDTODataRelationshipsCampaigns.t() | nil
        }

  defstruct [:campaigns]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [campaigns: {PostCampaignValuesResponseDTODataRelationshipsCampaigns, :t}]
  end
end
