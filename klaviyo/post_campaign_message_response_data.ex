defmodule Klaviyo.PostCampaignMessageResponseData do
  @moduledoc """
  Provides struct and type for a PostCampaignMessageResponseData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.PostCampaignMessageResponseDataAttributes.t(),
          id: String.t(),
          links: Klaviyo.ObjectLinks.t(),
          relationships: Klaviyo.PostCampaignMessageResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.PostCampaignMessageResponseDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.PostCampaignMessageResponseDataRelationships, :t},
      type: {:const, "campaign-message"}
    ]
  end
end
