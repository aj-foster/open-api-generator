defmodule VectorStoreSearchRequest do
  @moduledoc """
  Provides struct and type for a VectorStoreSearchRequest
  """

  @type t :: %__MODULE__{
          filters: ComparisonFilter.t() | CompoundFilter.t() | nil,
          max_num_results: integer | nil,
          query: String.t() | [String.t()],
          ranking_options: VectorStoreSearchRequestRankingOptions.t() | nil,
          rewrite_query: boolean | nil
        }

  defstruct [:filters, :max_num_results, :query, :ranking_options, :rewrite_query]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      filters: {:union, [{ComparisonFilter, :t}, {CompoundFilter, :t}]},
      max_num_results: :integer,
      query: {:union, [{:string, :generic}, [string: :generic]]},
      ranking_options: {VectorStoreSearchRequestRankingOptions, :t},
      rewrite_query: :boolean
    ]
  end
end
