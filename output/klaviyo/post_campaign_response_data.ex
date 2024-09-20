defmodule PostCampaignResponseData do
  @moduledoc """
  Provides struct and type for a PostCampaignResponseData
  """

  @type t :: %__MODULE__{
          attributes: PostCampaignResponseDataAttributes.t(),
          id: String.t(),
          links: ObjectLinks.t(),
          relationships: PostCampaignResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PostCampaignResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {PostCampaignResponseDataRelationships, :t},
      type: {:const, "campaign"}
    ]
  end
end
