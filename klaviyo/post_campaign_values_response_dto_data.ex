defmodule PostCampaignValuesResponseDTOData do
  @moduledoc """
  Provides struct and type for a PostCampaignValuesResponseDTOData
  """

  @type t :: %__MODULE__{
          attributes: PostCampaignValuesResponseDTODataAttributes.t(),
          links: ObjectLinks.t(),
          relationships: PostCampaignValuesResponseDTODataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PostCampaignValuesResponseDTODataAttributes, :t},
      links: {ObjectLinks, :t},
      relationships: {PostCampaignValuesResponseDTODataRelationships, :t},
      type: {:const, "campaign-values-report"}
    ]
  end
end
