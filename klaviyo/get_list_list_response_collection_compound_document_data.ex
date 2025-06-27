defmodule GetListListResponseCollectionCompoundDocumentData do
  @moduledoc """
  Provides struct and type for a GetListListResponseCollectionCompoundDocumentData
  """

  @type t :: %__MODULE__{
          attributes: GetListListResponseCollectionCompoundDocumentDataAttributes.t() | nil,
          id: String.t() | nil,
          links: ObjectLinks.t() | nil,
          relationships: GetListListResponseCollectionCompoundDocumentDataRelationships.t() | nil,
          type: String.t() | nil
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {GetListListResponseCollectionCompoundDocumentDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {GetListListResponseCollectionCompoundDocumentDataRelationships, :t},
      type: {:const, "list"}
    ]
  end
end
