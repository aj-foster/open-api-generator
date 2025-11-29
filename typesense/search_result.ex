defmodule SearchResult do
  @moduledoc """
  Provides struct and type for a SearchResult
  """

  @type t :: %__MODULE__{
          facet_counts: [FacetCounts.t()] | nil,
          found: integer | nil,
          grouped_hits: [SearchGroupedHit.t()] | nil,
          hits: [SearchResultHit.t()] | nil,
          out_of: integer | nil,
          page: integer | nil,
          request_params: SearchResultRequestParams.t() | nil,
          search_cutoff: boolean | nil,
          search_time_ms: integer | nil
        }

  defstruct [
    :facet_counts,
    :found,
    :grouped_hits,
    :hits,
    :out_of,
    :page,
    :request_params,
    :search_cutoff,
    :search_time_ms
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      facet_counts: [{FacetCounts, :t}],
      found: :integer,
      grouped_hits: [{SearchGroupedHit, :t}],
      hits: [{SearchResultHit, :t}],
      out_of: :integer,
      page: :integer,
      request_params: {SearchResultRequestParams, :t},
      search_cutoff: :boolean,
      search_time_ms: :integer
    ]
  end
end
