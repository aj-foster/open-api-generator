defmodule Klaviyo.GetSegmentRetrieveResponseCompoundDocumentData do
  @moduledoc """
  Provides struct and type for a GetSegmentRetrieveResponseCompoundDocumentData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.GetSegmentRetrieveResponseCompoundDocumentDataAttributes.t() | nil,
          id: String.t() | nil,
          links: Klaviyo.ObjectLinks.t() | nil,
          relationships:
            Klaviyo.GetSegmentRetrieveResponseCompoundDocumentDataRelationships.t() | nil,
          type: String.t() | nil
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.GetSegmentRetrieveResponseCompoundDocumentDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.GetSegmentRetrieveResponseCompoundDocumentDataRelationships, :t},
      type: {:const, "segment"}
    ]
  end
end
