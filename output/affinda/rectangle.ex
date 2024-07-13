defmodule Rectangle do
  @moduledoc """
  Provides struct and type for a Rectangle
  """

  @type t :: %__MODULE__{pageIndex: integer | nil, x0: number, x1: number, y0: number, y1: number}

  defstruct [:pageIndex, :x0, :x1, :y0, :y1]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [pageIndex: :integer, x0: :number, x1: :number, y0: :number, y1: :number]
  end
end
