defmodule Spotify.PagedCategories do
  @moduledoc """
  Provides struct and type for a PagedCategories
  """

  @type json_resp :: %__MODULE__{categories: Spotify.PagedCategoriesCategories.json_resp()}

  defstruct [:categories]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [categories: {Spotify.PagedCategoriesCategories, :json_resp}]
  end
end
