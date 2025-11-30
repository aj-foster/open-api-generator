defmodule Typesense.FacetCounts do
  @moduledoc """
  Provides struct and type for a FacetCounts
  """

  @type t :: %__MODULE__{
          counts: [Typesense.FacetCountsCounts.t()] | nil,
          field_name: String.t() | nil,
          stats: Typesense.FacetCountsStats.t() | nil
        }

  defstruct [:counts, :field_name, :stats]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      counts: [{Typesense.FacetCountsCounts, :t}],
      field_name: {:string, :generic},
      stats: {Typesense.FacetCountsStats, :t}
    ]
  end
end
