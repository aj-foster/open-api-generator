defmodule Line.RichMenuBounds do
  @moduledoc """
  Provides struct and type for a RichMenuBounds
  """

  @type t :: %__MODULE__{
          height: integer | nil,
          width: integer | nil,
          x: integer | nil,
          y: integer | nil
        }

  defstruct [:height, :width, :x, :y]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      height: {:integer, "int64"},
      width: {:integer, "int64"},
      x: {:integer, "int64"},
      y: {:integer, "int64"}
    ]
  end
end
