defmodule PostCatalogItemUpdateJobResponseData do
  @moduledoc """
  Provides struct and type for a PostCatalogItemUpdateJobResponseData
  """

  @type t :: %__MODULE__{
          attributes: PostCatalogItemUpdateJobResponseDataAttributes.t(),
          id: String.t(),
          links: ObjectLinks.t(),
          relationships: PostCatalogItemUpdateJobResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PostCatalogItemUpdateJobResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {PostCatalogItemUpdateJobResponseDataRelationships, :t},
      type: {:const, "catalog-item-bulk-update-job"}
    ]
  end
end
