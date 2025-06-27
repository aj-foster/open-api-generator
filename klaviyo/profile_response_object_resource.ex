defmodule ProfileResponseObjectResource do
  @moduledoc """
  Provides struct and type for a ProfileResponseObjectResource
  """

  @type t :: %__MODULE__{
          attributes: ProfileResponseObjectResourceAttributes.t(),
          id: String.t() | nil,
          links: ObjectLinks.t(),
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {ProfileResponseObjectResourceAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      type: {:const, "profile"}
    ]
  end
end
