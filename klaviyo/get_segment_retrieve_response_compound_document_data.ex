defmodule GetSegmentRetrieveResponseCompoundDocumentData do
  @moduledoc """
  Provides struct and type for a GetSegmentRetrieveResponseCompoundDocumentData
  """

  @type t :: %__MODULE__{
          attributes: GetSegmentRetrieveResponseCompoundDocumentDataAttributes.t() | nil,
          id: String.t() | nil,
          links: ObjectLinks.t() | nil,
          relationships: GetSegmentRetrieveResponseCompoundDocumentDataRelationships.t() | nil,
          type: String.t() | nil
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {GetSegmentRetrieveResponseCompoundDocumentDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {GetSegmentRetrieveResponseCompoundDocumentDataRelationships, :t},
      type: {:const, "segment"}
    ]
  end
end
