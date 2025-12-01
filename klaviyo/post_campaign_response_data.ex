defmodule Klaviyo.PostCampaignResponseData do
  @moduledoc """
  Provides struct and type for a PostCampaignResponseData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.PostCampaignResponseDataAttributes.t(),
          id: String.t(),
          links: Klaviyo.ObjectLinks.t(),
          relationships: Klaviyo.PostCampaignResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.PostCampaignResponseDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.PostCampaignResponseDataRelationships, :t},
      type: {:const, "campaign"}
    ]
  end
end
