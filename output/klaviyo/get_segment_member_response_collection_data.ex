defmodule GetSegmentMemberResponseCollectionData do
  @moduledoc """
  Provides struct and type for a GetSegmentMemberResponseCollectionData
  """

  @type t :: %__MODULE__{
          attributes: GetSegmentMemberResponseCollectionDataAttributes.t() | nil,
          id: String.t() | nil,
          links: ObjectLinks.t() | nil,
          relationships: GetSegmentMemberResponseCollectionDataRelationships.t() | nil,
          type: String.t() | nil
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {GetSegmentMemberResponseCollectionDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {GetSegmentMemberResponseCollectionDataRelationships, :t},
      type: {:const, "profile"}
    ]
  end
end
