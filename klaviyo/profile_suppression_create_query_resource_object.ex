defmodule ProfileSuppressionCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a ProfileSuppressionCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: ProfileSuppressionCreateQueryResourceObjectAttributes.t(),
          type: String.t()
        }

  defstruct [:attributes, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {ProfileSuppressionCreateQueryResourceObjectAttributes, :t},
      type: {:const, "profile"}
    ]
  end
end
