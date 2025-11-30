defmodule Klaviyo.PostCampaignValuesResponseDTOData do
  @moduledoc """
  Provides struct and type for a PostCampaignValuesResponseDTOData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.PostCampaignValuesResponseDTODataAttributes.t(),
          links: Klaviyo.ObjectLinks.t(),
          relationships: Klaviyo.PostCampaignValuesResponseDTODataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.PostCampaignValuesResponseDTODataAttributes, :t},
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.PostCampaignValuesResponseDTODataRelationships, :t},
      type: {:const, "campaign-values-report"}
    ]
  end
end
