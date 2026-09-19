defmodule Klaviyo.GetListMemberResponseCollectionData do
  @moduledoc """
  Provides struct and type for a GetListMemberResponseCollectionData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.GetListMemberResponseCollectionDataAttributes.t() | nil,
          id: String.t() | nil,
          links: Klaviyo.ObjectLinks.t() | nil,
          relationships: Klaviyo.GetListMemberResponseCollectionDataRelationships.t() | nil,
          type: String.t() | nil
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.GetListMemberResponseCollectionDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.GetListMemberResponseCollectionDataRelationships, :t},
      type: {:const, "profile"}
    ]
  end
end
