defmodule ProfileCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a ProfileCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: ProfileCreateQueryResourceObjectAttributes.t(),
          type: String.t()
        }

  defstruct [:attributes, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [attributes: {ProfileCreateQueryResourceObjectAttributes, :t}, type: {:const, "profile"}]
  end
end
