defmodule PostListCreateResponseData do
  @moduledoc """
  Provides struct and type for a PostListCreateResponseData
  """

  @type t :: %__MODULE__{
          attributes: PostListCreateResponseDataAttributes.t(),
          id: String.t(),
          links: ObjectLinks.t(),
          relationships: PostListCreateResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PostListCreateResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {PostListCreateResponseDataRelationships, :t},
      type: {:const, "list"}
    ]
  end
end
