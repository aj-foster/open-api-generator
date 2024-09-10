defmodule PatchCampaignResponseData do
  @moduledoc """
  Provides struct and type for a PatchCampaignResponseData
  """

  @type t :: %__MODULE__{
          attributes: PatchCampaignResponseDataAttributes.t(),
          id: String.t(),
          links: ObjectLinks.t(),
          relationships: PatchCampaignResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PatchCampaignResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {PatchCampaignResponseDataRelationships, :t},
      type: {:const, "campaign"}
    ]
  end
end
