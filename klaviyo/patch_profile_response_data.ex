defmodule PatchProfileResponseData do
  @moduledoc """
  Provides struct and type for a PatchProfileResponseData
  """

  @type t :: %__MODULE__{
          attributes: PatchProfileResponseDataAttributes.t(),
          id: String.t() | nil,
          links: ObjectLinks.t(),
          relationships: PatchProfileResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PatchProfileResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {PatchProfileResponseDataRelationships, :t},
      type: {:const, "profile"}
    ]
  end
end
