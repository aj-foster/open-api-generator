defmodule PostTagGroupResponseData do
  @moduledoc """
  Provides struct and type for a PostTagGroupResponseData
  """

  @type t :: %__MODULE__{
          attributes: PostTagGroupResponseDataAttributes.t(),
          id: String.t(),
          links: ObjectLinks.t(),
          relationships: PostTagGroupResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PostTagGroupResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {PostTagGroupResponseDataRelationships, :t},
      type: {:const, "tag-group"}
    ]
  end
end
