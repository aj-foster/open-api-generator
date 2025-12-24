defmodule Klaviyo.GetSegmentMemberResponseCollectionData do
  @moduledoc """
  Provides struct and type for a GetSegmentMemberResponseCollectionData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.GetSegmentMemberResponseCollectionDataAttributes.t() | nil,
          id: String.t() | nil,
          links: Klaviyo.ObjectLinks.t() | nil,
          relationships: Klaviyo.GetSegmentMemberResponseCollectionDataRelationships.t() | nil,
          type: String.t() | nil
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.GetSegmentMemberResponseCollectionDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.GetSegmentMemberResponseCollectionDataRelationships, :t},
      type: {:const, "profile"}
    ]
  end
end
