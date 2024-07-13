defmodule ImageResponseObjectResource do
  @moduledoc """
  Provides struct and type for a ImageResponseObjectResource
  """

  @type t :: %__MODULE__{
          attributes: ImageResponseObjectResourceAttributes.t(),
          id: String.t(),
          links: ObjectLinks.t(),
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {ImageResponseObjectResourceAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      type: {:const, "image"}
    ]
  end
end
