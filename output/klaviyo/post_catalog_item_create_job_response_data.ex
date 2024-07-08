defmodule PostCatalogItemCreateJobResponseData do
  @moduledoc """
  Provides struct and type for a PostCatalogItemCreateJobResponseData
  """

  @type t :: %__MODULE__{
          attributes: PostCatalogItemCreateJobResponseDataAttributes.t(),
          id: String.t(),
          links: ObjectLinks.t(),
          relationships: PostCatalogItemCreateJobResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PostCatalogItemCreateJobResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {PostCatalogItemCreateJobResponseDataRelationships, :t},
      type: {:const, "catalog-item-bulk-create-job"}
    ]
  end
end
