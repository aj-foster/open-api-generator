defmodule Klaviyo.PatchCampaignMessageResponseData do
  @moduledoc """
  Provides struct and type for a PatchCampaignMessageResponseData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.PatchCampaignMessageResponseDataAttributes.t(),
          id: String.t(),
          links: Klaviyo.ObjectLinks.t(),
          relationships: Klaviyo.PatchCampaignMessageResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.PatchCampaignMessageResponseDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.PatchCampaignMessageResponseDataRelationships, :t},
      type: {:const, "campaign-message"}
    ]
  end
end
