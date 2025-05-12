defmodule PagedCategories do
  @moduledoc """
  Provides struct and type for a PagedCategories
  """

  @type json_resp :: %__MODULE__{categories: PagedCategoriesCategories.json_resp()}

  defstruct [:categories]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [categories: {PagedCategoriesCategories, :json_resp}]
  end
end
