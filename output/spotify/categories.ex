defmodule Categories do
  @moduledoc """
  Provides API endpoints related to categories
  """

  @default_client Client

  @doc """
  Get Category's Playlists


  Get a list of Spotify playlists tagged with a particular category.


  ## Options

    * `limit`
    * `offset`

  """
  @spec get_a_categories_playlists(String.t(), keyword) ::
          {:ok, PagingFeaturedPlaylistObject.t()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_a_categories_playlists(category_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset])

    client.request(%{
      args: [category_id: category_id],
      call: {Categories, :get_a_categories_playlists},
      url: "/browse/categories/#{category_id}/playlists",
      method: :get,
      query: query,
      response: [
        {200, {PagingFeaturedPlaylistObject, :t}},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Single Browse Category


  Get a single category used to tag items in Spotify (on, for example, the Spotify player’s “Browse” tab).


  ## Options

    * `locale`

  """
  @spec get_a_category(String.t(), keyword) ::
          {:ok, CategoryObject.t()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_a_category(category_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:locale])

    client.request(%{
      args: [category_id: category_id],
      call: {Categories, :get_a_category},
      url: "/browse/categories/#{category_id}",
      method: :get,
      query: query,
      response: [
        {200, {CategoryObject, :t}},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Several Browse Categories


  Get a list of categories used to tag items in Spotify (on, for example, the Spotify player’s “Browse” tab).


  ## Options

    * `locale`
    * `limit`
    * `offset`

  """
  @spec get_categories(keyword) ::
          {:ok, PagedCategories.json_resp()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_categories(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :locale, :offset])

    client.request(%{
      args: [],
      call: {Categories, :get_categories},
      url: "/browse/categories",
      method: :get,
      query: query,
      response: [
        {200, {PagedCategories, :json_resp}},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end
end
