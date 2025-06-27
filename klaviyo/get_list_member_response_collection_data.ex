defmodule GetListMemberResponseCollectionData do
  @moduledoc """
  Provides struct and type for a GetListMemberResponseCollectionData
  """

  @type t :: %__MODULE__{
          attributes: GetListMemberResponseCollectionDataAttributes.t() | nil,
          id: String.t() | nil,
          links: ObjectLinks.t() | nil,
          relationships: GetListMemberResponseCollectionDataRelationships.t() | nil,
          type: String.t() | nil
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {GetListMemberResponseCollectionDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {GetListMemberResponseCollectionDataRelationships, :t},
      type: {:const, "profile"}
    ]
  end
end
