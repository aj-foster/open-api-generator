defmodule ThrottledScheduleOptions do
  @moduledoc """
  Provides struct and type for a ThrottledScheduleOptions
  """

  @type t :: %__MODULE__{datetime: DateTime.t(), throttle_percentage: integer}

  defstruct [:datetime, :throttle_percentage]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [datetime: {:string, :date_time}, throttle_percentage: :integer]
  end
end
