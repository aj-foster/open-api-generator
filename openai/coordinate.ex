defmodule OpenAI.Coordinate do
  @moduledoc """
  Provides struct and type for a Coordinate
  """

  @type t :: %__MODULE__{x: integer, y: integer}

  defstruct [:x, :y]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [x: :integer, y: :integer]
  end
end
