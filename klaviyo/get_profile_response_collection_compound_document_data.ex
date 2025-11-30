defmodule Klaviyo.GetProfileResponseCollectionCompoundDocumentData do
  @moduledoc """
  Provides struct and type for a GetProfileResponseCollectionCompoundDocumentData
  """

  @type t :: %__MODULE__{
          attributes:
            Klaviyo.GetProfileResponseCollectionCompoundDocumentDataAttributes.t() | nil,
          id: String.t() | nil,
          links: Klaviyo.ObjectLinks.t() | nil,
          relationships:
            Klaviyo.GetProfileResponseCollectionCompoundDocumentDataRelationships.t() | nil,
          type: String.t() | nil
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.GetProfileResponseCollectionCompoundDocumentDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.GetProfileResponseCollectionCompoundDocumentDataRelationships, :t},
      type: {:const, "profile"}
    ]
  end
end
