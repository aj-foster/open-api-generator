defmodule DeleteTagGroupResponseData do
  @moduledoc """
  Provides struct and type for a DeleteTagGroupResponseData
  """

  @type t :: %__MODULE__{
          attributes: DeleteTagGroupResponseDataAttributes.t(),
          id: String.t(),
          links: ObjectLinks.t(),
          relationships: DeleteTagGroupResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {DeleteTagGroupResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {DeleteTagGroupResponseDataRelationships, :t},
      type: {:const, "tag-group"}
    ]
  end
end
