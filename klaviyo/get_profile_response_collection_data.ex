defmodule Klaviyo.GetProfileResponseCollectionData do
  @moduledoc """
  Provides struct and type for a GetProfileResponseCollectionData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.GetProfileResponseCollectionDataAttributes.t() | nil,
          id: String.t() | nil,
          links: Klaviyo.ObjectLinks.t() | nil,
          relationships: Klaviyo.GetProfileResponseCollectionDataRelationships.t() | nil,
          type: String.t() | nil
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.GetProfileResponseCollectionDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.GetProfileResponseCollectionDataRelationships, :t},
      type: {:const, "profile"}
    ]
  end
end
