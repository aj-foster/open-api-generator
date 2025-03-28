defmodule PatchTagGroupResponseData do
  @moduledoc """
  Provides struct and type for a PatchTagGroupResponseData
  """

  @type t :: %__MODULE__{
          attributes: PatchTagGroupResponseDataAttributes.t(),
          id: String.t(),
          links: ObjectLinks.t(),
          relationships: PatchTagGroupResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PatchTagGroupResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {PatchTagGroupResponseDataRelationships, :t},
      type: {:const, "tag-group"}
    ]
  end
end
