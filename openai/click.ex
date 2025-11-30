defmodule OpenAI.Click do
  @moduledoc """
  Provides struct and type for a Click
  """

  @type t :: %__MODULE__{button: String.t(), type: String.t(), x: integer, y: integer}

  defstruct [:button, :type, :x, :y]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      button: {:enum, ["left", "right", "wheel", "back", "forward"]},
      type: {:const, "click"},
      x: :integer,
      y: :integer
    ]
  end
end
