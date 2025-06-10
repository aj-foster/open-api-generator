defmodule PostTagResponseData do
  @moduledoc """
  Provides struct and type for a PostTagResponseData
  """

  @type t :: %__MODULE__{
          attributes: PostTagResponseDataAttributes.t(),
          id: String.t(),
          links: ObjectLinks.t(),
          relationships: PostTagResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PostTagResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {PostTagResponseDataRelationships, :t},
      type: {:const, "tag"}
    ]
  end
end
