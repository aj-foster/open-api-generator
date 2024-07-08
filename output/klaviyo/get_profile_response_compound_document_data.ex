defmodule GetProfileResponseCompoundDocumentData do
  @moduledoc """
  Provides struct and type for a GetProfileResponseCompoundDocumentData
  """

  @type t :: %__MODULE__{
          attributes: GetProfileResponseCompoundDocumentDataAttributes.t() | nil,
          id: String.t() | nil,
          links: ObjectLinks.t() | nil,
          relationships: GetProfileResponseCompoundDocumentDataRelationships.t() | nil,
          type: String.t() | nil
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {GetProfileResponseCompoundDocumentDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {GetProfileResponseCompoundDocumentDataRelationships, :t},
      type: {:const, "profile"}
    ]
  end
end
