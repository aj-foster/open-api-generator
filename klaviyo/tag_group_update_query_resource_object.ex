defmodule TagGroupUpdateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a TagGroupUpdateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: TagGroupUpdateQueryResourceObjectAttributes.t(),
          id: String.t(),
          type: String.t()
        }

  defstruct [:attributes, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {TagGroupUpdateQueryResourceObjectAttributes, :t},
      id: {:string, :generic},
      type: {:const, "tag-group"}
    ]
  end
end
