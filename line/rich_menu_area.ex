defmodule Line.RichMenuArea do
  @moduledoc """
  Provides struct and type for a RichMenuArea
  """

  @type t :: %__MODULE__{action: Line.Action.t() | nil, bounds: Line.RichMenuBounds.t() | nil}

  defstruct [:action, :bounds]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [action: {Line.Action, :t}, bounds: {Line.RichMenuBounds, :t}]
  end
end
