defmodule Timeframe do
  @moduledoc """
  Provides struct and type for a Timeframe
  """

  @type t :: %__MODULE__{key: String.t()}

  defstruct [:key]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      key:
        {:enum,
         [
           "last_12_months",
           "last_30_days",
           "last_365_days",
           "last_3_months",
           "last_7_days",
           "last_90_days",
           "last_month",
           "last_week",
           "last_year",
           "this_month",
           "this_week",
           "this_year",
           "today",
           "yesterday"
         ]}
    ]
  end
end
