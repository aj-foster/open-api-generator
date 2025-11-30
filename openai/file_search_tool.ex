defmodule OpenAI.FileSearchTool do
  @moduledoc """
  Provides struct and type for a FileSearchTool
  """

  @type t :: %__MODULE__{
          filters: OpenAI.ComparisonFilter.t() | OpenAI.CompoundFilter.t() | nil,
          max_num_results: integer | nil,
          ranking_options: OpenAI.FileSearchToolRankingOptions.t() | nil,
          type: String.t(),
          vector_store_ids: [String.t()]
        }

  defstruct [:filters, :max_num_results, :ranking_options, :type, :vector_store_ids]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      filters: {:union, [{OpenAI.ComparisonFilter, :t}, {OpenAI.CompoundFilter, :t}]},
      max_num_results: :integer,
      ranking_options: {OpenAI.FileSearchToolRankingOptions, :t},
      type: {:const, "file_search"},
      vector_store_ids: [:string]
    ]
  end
end
