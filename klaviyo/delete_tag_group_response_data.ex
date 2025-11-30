defmodule Klaviyo.DeleteTagGroupResponseData do
  @moduledoc """
  Provides struct and type for a DeleteTagGroupResponseData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.DeleteTagGroupResponseDataAttributes.t(),
          id: String.t(),
          links: Klaviyo.ObjectLinks.t(),
          relationships: Klaviyo.DeleteTagGroupResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.DeleteTagGroupResponseDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.DeleteTagGroupResponseDataRelationships, :t},
      type: {:const, "tag-group"}
    ]
  end
end
