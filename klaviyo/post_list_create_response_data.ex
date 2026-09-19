defmodule Klaviyo.PostListCreateResponseData do
  @moduledoc """
  Provides struct and type for a PostListCreateResponseData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.PostListCreateResponseDataAttributes.t(),
          id: String.t(),
          links: Klaviyo.ObjectLinks.t(),
          relationships: Klaviyo.PostListCreateResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.PostListCreateResponseDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.PostListCreateResponseDataRelationships, :t},
      type: {:const, "list"}
    ]
  end
end
