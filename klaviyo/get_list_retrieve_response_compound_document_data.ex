defmodule GetListRetrieveResponseCompoundDocumentData do
  @moduledoc """
  Provides struct and type for a GetListRetrieveResponseCompoundDocumentData
  """

  @type t :: %__MODULE__{
          attributes: GetListRetrieveResponseCompoundDocumentDataAttributes.t() | nil,
          id: String.t() | nil,
          links: ObjectLinks.t() | nil,
          relationships: GetListRetrieveResponseCompoundDocumentDataRelationships.t() | nil,
          type: String.t() | nil
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {GetListRetrieveResponseCompoundDocumentDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {GetListRetrieveResponseCompoundDocumentDataRelationships, :t},
      type: {:const, "list"}
    ]
  end
end
