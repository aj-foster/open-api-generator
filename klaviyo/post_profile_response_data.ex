defmodule PostProfileResponseData do
  @moduledoc """
  Provides struct and type for a PostProfileResponseData
  """

  @type t :: %__MODULE__{
          attributes: PostProfileResponseDataAttributes.t(),
          id: String.t() | nil,
          links: ObjectLinks.t(),
          relationships: PostProfileResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PostProfileResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {PostProfileResponseDataRelationships, :t},
      type: {:const, "profile"}
    ]
  end
end
