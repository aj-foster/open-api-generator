defmodule Klaviyo.PostTagResponseData do
  @moduledoc """
  Provides struct and type for a PostTagResponseData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.PostTagResponseDataAttributes.t(),
          id: String.t(),
          links: Klaviyo.ObjectLinks.t(),
          relationships: Klaviyo.PostTagResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.PostTagResponseDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.PostTagResponseDataRelationships, :t},
      type: {:const, "tag"}
    ]
  end
end
