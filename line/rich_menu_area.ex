defmodule RichMenuArea do
  @moduledoc """
  Provides struct and type for a RichMenuArea
  """

  @type t :: %__MODULE__{action: Action.t() | nil, bounds: RichMenuBounds.t() | nil}

  defstruct [:action, :bounds]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [action: {Action, :t}, bounds: {RichMenuBounds, :t}]
  end
end
