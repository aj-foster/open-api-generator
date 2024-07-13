defmodule CustomTimeframe do
  @moduledoc """
  Provides struct and type for a CustomTimeframe
  """

  @type t :: %__MODULE__{end: DateTime.t(), start: DateTime.t()}

  defstruct [:end, :start]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [end: {:string, :date_time}, start: {:string, :date_time}]
  end
end
