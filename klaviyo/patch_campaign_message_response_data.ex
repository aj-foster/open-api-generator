defmodule PatchCampaignMessageResponseData do
  @moduledoc """
  Provides struct and type for a PatchCampaignMessageResponseData
  """

  @type t :: %__MODULE__{
          attributes: PatchCampaignMessageResponseDataAttributes.t(),
          id: String.t(),
          links: ObjectLinks.t(),
          relationships: PatchCampaignMessageResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PatchCampaignMessageResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {PatchCampaignMessageResponseDataRelationships, :t},
      type: {:const, "campaign-message"}
    ]
  end
end
