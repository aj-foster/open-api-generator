defmodule GetProfileResponseCollectionCompoundDocumentData do
  @moduledoc """
  Provides struct and type for a GetProfileResponseCollectionCompoundDocumentData
  """

  @type t :: %__MODULE__{
          attributes: GetProfileResponseCollectionCompoundDocumentDataAttributes.t() | nil,
          id: String.t() | nil,
          links: ObjectLinks.t() | nil,
          relationships: GetProfileResponseCollectionCompoundDocumentDataRelationships.t() | nil,
          type: String.t() | nil
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {GetProfileResponseCollectionCompoundDocumentDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {GetProfileResponseCollectionCompoundDocumentDataRelationships, :t},
      type: {:const, "profile"}
    ]
  end
end
