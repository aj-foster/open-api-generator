defmodule STOScheduleOptions do
  @moduledoc """
  Provides struct and type for a STOScheduleOptions
  """

  @type t :: %__MODULE__{date: Date.t()}

  defstruct [:date]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [date: {:string, :date}]
  end
end
