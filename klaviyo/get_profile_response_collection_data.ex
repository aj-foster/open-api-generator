defmodule GetProfileResponseCollectionData do
  @moduledoc """
  Provides struct and type for a GetProfileResponseCollectionData
  """

  @type t :: %__MODULE__{
          attributes: GetProfileResponseCollectionDataAttributes.t() | nil,
          id: String.t() | nil,
          links: ObjectLinks.t() | nil,
          relationships: GetProfileResponseCollectionDataRelationships.t() | nil,
          type: String.t() | nil
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {GetProfileResponseCollectionDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {GetProfileResponseCollectionDataRelationships, :t},
      type: {:const, "profile"}
    ]
  end
end
