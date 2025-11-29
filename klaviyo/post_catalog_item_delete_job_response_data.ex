defmodule PostCatalogItemDeleteJobResponseData do
  @moduledoc """
  Provides struct and type for a PostCatalogItemDeleteJobResponseData
  """

  @type t :: %__MODULE__{
          attributes: PostCatalogItemDeleteJobResponseDataAttributes.t(),
          id: String.t(),
          links: ObjectLinks.t(),
          relationships: PostCatalogItemDeleteJobResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PostCatalogItemDeleteJobResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {PostCatalogItemDeleteJobResponseDataRelationships, :t},
      type: {:const, "catalog-item-bulk-delete-job"}
    ]
  end
end
