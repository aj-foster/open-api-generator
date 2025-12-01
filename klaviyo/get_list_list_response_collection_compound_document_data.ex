defmodule Klaviyo.GetListListResponseCollectionCompoundDocumentData do
  @moduledoc """
  Provides struct and type for a GetListListResponseCollectionCompoundDocumentData
  """

  @type t :: %__MODULE__{
          attributes:
            Klaviyo.GetListListResponseCollectionCompoundDocumentDataAttributes.t() | nil,
          id: String.t() | nil,
          links: Klaviyo.ObjectLinks.t() | nil,
          relationships:
            Klaviyo.GetListListResponseCollectionCompoundDocumentDataRelationships.t() | nil,
          type: String.t() | nil
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.GetListListResponseCollectionCompoundDocumentDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.GetListListResponseCollectionCompoundDocumentDataRelationships, :t},
      type: {:const, "list"}
    ]
  end
end
