defmodule TimeIntervalObject do
  @moduledoc """
  Provides struct and type for a TimeIntervalObject
  """

  @type t :: %__MODULE__{confidence: number | nil, duration: number | nil, start: number | nil}

  defstruct [:confidence, :duration, :start]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [confidence: :number, duration: :number, start: :number]
  end
end
