defmodule Klaviyo.GetListRetrieveResponseCompoundDocumentData do
  @moduledoc """
  Provides struct and type for a GetListRetrieveResponseCompoundDocumentData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.GetListRetrieveResponseCompoundDocumentDataAttributes.t() | nil,
          id: String.t() | nil,
          links: Klaviyo.ObjectLinks.t() | nil,
          relationships:
            Klaviyo.GetListRetrieveResponseCompoundDocumentDataRelationships.t() | nil,
          type: String.t() | nil
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.GetListRetrieveResponseCompoundDocumentDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.GetListRetrieveResponseCompoundDocumentDataRelationships, :t},
      type: {:const, "list"}
    ]
  end
end
