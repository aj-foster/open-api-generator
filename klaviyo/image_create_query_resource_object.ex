defmodule ImageCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a ImageCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: ImageCreateQueryResourceObjectAttributes.t(),
          type: String.t()
        }

  defstruct [:attributes, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [attributes: {ImageCreateQueryResourceObjectAttributes, :t}, type: {:const, "image"}]
  end
end
