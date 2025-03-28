defmodule FileSearchTool do
  @moduledoc """
  Provides struct and type for a FileSearchTool
  """

  @type t :: %__MODULE__{
          filters: ComparisonFilter.t() | CompoundFilter.t() | nil,
          max_num_results: integer | nil,
          ranking_options: FileSearchToolRankingOptions.t() | nil,
          type: String.t(),
          vector_store_ids: [String.t()]
        }

  defstruct [:filters, :max_num_results, :ranking_options, :type, :vector_store_ids]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      filters: {:union, [{ComparisonFilter, :t}, {CompoundFilter, :t}]},
      max_num_results: :integer,
      ranking_options: {FileSearchToolRankingOptions, :t},
      type: {:const, "file_search"},
      vector_store_ids: [string: :generic]
    ]
  end
end
