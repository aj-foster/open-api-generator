defmodule Klaviyo.GetSegmentListResponseCollectionCompoundDocumentData do
  @moduledoc """
  Provides struct and type for a GetSegmentListResponseCollectionCompoundDocumentData
  """

  @type t :: %__MODULE__{
          attributes:
            Klaviyo.GetSegmentListResponseCollectionCompoundDocumentDataAttributes.t() | nil,
          id: String.t() | nil,
          links: Klaviyo.ObjectLinks.t() | nil,
          relationships:
            Klaviyo.GetSegmentListResponseCollectionCompoundDocumentDataRelationships.t() | nil,
          type: String.t() | nil
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.GetSegmentListResponseCollectionCompoundDocumentDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships:
        {Klaviyo.GetSegmentListResponseCollectionCompoundDocumentDataRelationships, :t},
      type: {:const, "segment"}
    ]
  end
end
