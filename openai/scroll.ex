defmodule OpenAI.Scroll do
  @moduledoc """
  Provides struct and type for a Scroll
  """

  @type t :: %__MODULE__{
          scroll_x: integer,
          scroll_y: integer,
          type: String.t(),
          x: integer,
          y: integer
        }

  defstruct [:scroll_x, :scroll_y, :type, :x, :y]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [scroll_x: :integer, scroll_y: :integer, type: {:const, "scroll"}, x: :integer, y: :integer]
  end
end
