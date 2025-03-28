defmodule PostCampaignMessageResponseData do
  @moduledoc """
  Provides struct and type for a PostCampaignMessageResponseData
  """

  @type t :: %__MODULE__{
          attributes: PostCampaignMessageResponseDataAttributes.t(),
          id: String.t(),
          links: ObjectLinks.t(),
          relationships: PostCampaignMessageResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PostCampaignMessageResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {PostCampaignMessageResponseDataRelationships, :t},
      type: {:const, "campaign-message"}
    ]
  end
end
