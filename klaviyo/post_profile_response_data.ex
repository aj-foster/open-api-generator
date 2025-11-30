defmodule Klaviyo.PostProfileResponseData do
  @moduledoc """
  Provides struct and type for a PostProfileResponseData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.PostProfileResponseDataAttributes.t(),
          id: String.t() | nil,
          links: Klaviyo.ObjectLinks.t(),
          relationships: Klaviyo.PostProfileResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.PostProfileResponseDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.PostProfileResponseDataRelationships, :t},
      type: {:const, "profile"}
    ]
  end
end
