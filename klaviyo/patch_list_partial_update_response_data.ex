defmodule PatchListPartialUpdateResponseData do
  @moduledoc """
  Provides struct and type for a PatchListPartialUpdateResponseData
  """

  @type t :: %__MODULE__{
          attributes: PatchListPartialUpdateResponseDataAttributes.t(),
          id: String.t(),
          links: ObjectLinks.t(),
          relationships: PatchListPartialUpdateResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PatchListPartialUpdateResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {PatchListPartialUpdateResponseDataRelationships, :t},
      type: {:const, "list"}
    ]
  end
end
