defmodule Typesense.FacetCountsStats do
  @moduledoc """
  Provides struct and type for a FacetCountsStats
  """

  @type t :: %__MODULE__{
          avg: number | nil,
          max: number | nil,
          min: number | nil,
          sum: number | nil,
          total_values: integer | nil
        }

  defstruct [:avg, :max, :min, :sum, :total_values]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      avg: {:number, "double"},
      max: {:number, "double"},
      min: {:number, "double"},
      sum: {:number, "double"},
      total_values: :integer
    ]
  end
end
