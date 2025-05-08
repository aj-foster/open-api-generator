defmodule Move do
  @moduledoc """
  Provides struct and type for a Move
  """

  @type t :: %__MODULE__{type: String.t(), x: integer, y: integer}

  defstruct [:type, :x, :y]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [type: {:const, "move"}, x: :integer, y: :integer]
  end
end
