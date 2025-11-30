defmodule Klaviyo.PostTagGroupResponseData do
  @moduledoc """
  Provides struct and type for a PostTagGroupResponseData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.PostTagGroupResponseDataAttributes.t(),
          id: String.t(),
          links: Klaviyo.ObjectLinks.t(),
          relationships: Klaviyo.PostTagGroupResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.PostTagGroupResponseDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.PostTagGroupResponseDataRelationships, :t},
      type: {:const, "tag-group"}
    ]
  end
end
