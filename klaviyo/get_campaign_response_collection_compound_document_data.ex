defmodule GetCampaignResponseCollectionCompoundDocumentData do
  @moduledoc """
  Provides struct and type for a GetCampaignResponseCollectionCompoundDocumentData
  """

  @type t :: %__MODULE__{
          attributes: map | nil,
          id: String.t() | nil,
          links: ObjectLinks.t() | nil,
          relationships: GetCampaignResponseCollectionCompoundDocumentDataRelationships.t() | nil,
          type: String.t() | nil
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: :map,
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {GetCampaignResponseCollectionCompoundDocumentDataRelationships, :t},
      type: {:const, "campaign"}
    ]
  end
end
