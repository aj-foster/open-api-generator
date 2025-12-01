defmodule Klaviyo.PatchCampaignResponseData do
  @moduledoc """
  Provides struct and type for a PatchCampaignResponseData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.PatchCampaignResponseDataAttributes.t(),
          id: String.t(),
          links: Klaviyo.ObjectLinks.t(),
          relationships: Klaviyo.PatchCampaignResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.PatchCampaignResponseDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.PatchCampaignResponseDataRelationships, :t},
      type: {:const, "campaign"}
    ]
  end
end
