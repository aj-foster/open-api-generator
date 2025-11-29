defmodule VectorStoreSearchResultsPage do
  @moduledoc """
  Provides struct and type for a VectorStoreSearchResultsPage
  """

  @type t :: %__MODULE__{
          data: [VectorStoreSearchResultItem.t()],
          has_more: boolean,
          next_page: String.t() | nil,
          object: String.t(),
          search_query: [String.t()]
        }

  defstruct [:data, :has_more, :next_page, :object, :search_query]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{VectorStoreSearchResultItem, :t}],
      has_more: :boolean,
      next_page: {:string, :generic},
      object: {:const, "vector_store.search_results.page"},
      search_query: [string: :generic]
    ]
  end
end
