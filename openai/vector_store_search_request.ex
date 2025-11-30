defmodule OpenAI.VectorStoreSearchRequest do
  @moduledoc """
  Provides struct and type for a VectorStoreSearchRequest
  """

  @type t :: %__MODULE__{
          filters: OpenAI.ComparisonFilter.t() | OpenAI.CompoundFilter.t() | nil,
          max_num_results: integer | nil,
          query: String.t() | [String.t()],
          ranking_options: OpenAI.VectorStoreSearchRequestRankingOptions.t() | nil,
          rewrite_query: boolean | nil
        }

  defstruct [:filters, :max_num_results, :query, :ranking_options, :rewrite_query]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      filters: {:union, [{OpenAI.ComparisonFilter, :t}, {OpenAI.CompoundFilter, :t}]},
      max_num_results: :integer,
      query: {:union, [:string, [:string]]},
      ranking_options: {OpenAI.VectorStoreSearchRequestRankingOptions, :t},
      rewrite_query: :boolean
    ]
  end
end
