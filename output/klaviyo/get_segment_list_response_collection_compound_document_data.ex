defmodule GetSegmentListResponseCollectionCompoundDocumentData do
  @moduledoc """
  Provides struct and type for a GetSegmentListResponseCollectionCompoundDocumentData
  """

  @type t :: %__MODULE__{
          attributes: GetSegmentListResponseCollectionCompoundDocumentDataAttributes.t() | nil,
          id: String.t() | nil,
          links: ObjectLinks.t() | nil,
          relationships:
            GetSegmentListResponseCollectionCompoundDocumentDataRelationships.t() | nil,
          type: String.t() | nil
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {GetSegmentListResponseCollectionCompoundDocumentDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {GetSegmentListResponseCollectionCompoundDocumentDataRelationships, :t},
      type: {:const, "segment"}
    ]
  end
end
