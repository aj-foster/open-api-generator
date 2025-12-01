defmodule Spotify.Categories do
  @moduledoc """
  Provides API endpoints related to categories
  """

  @default_client Spotify.Client

  @doc """
  Get Category's Playlists

  Get a list of Spotify playlists tagged with a particular category.

  ## Options

    * `limit`
    * `offset`

  """
  @callback get_a_categories_playlists(category_id :: String.t(), opts :: keyword) ::
              {:ok, Spotify.PagingFeaturedPlaylistObject.t()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_a_categories_playlists(category_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset])

    client.request(%{
      args: [category_id: category_id],
      call: {Spotify.Categories, :get_a_categories_playlists},
      url: "/browse/categories/#{category_id}/playlists",
      method: :get,
      query: query,
      response: [
        {200, {Spotify.PagingFeaturedPlaylistObject, :t}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
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
  @callback get_a_category(category_id :: String.t(), opts :: keyword) ::
              {:ok, Spotify.CategoryObject.t()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_a_category(category_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:locale])

    client.request(%{
      args: [category_id: category_id],
      call: {Spotify.Categories, :get_a_category},
      url: "/browse/categories/#{category_id}",
      method: :get,
      query: query,
      response: [
        {200, {Spotify.CategoryObject, :t}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
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
  @callback get_categories(opts :: keyword) ::
              {:ok, Spotify.PagedCategories.json_resp()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_categories(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :locale, :offset])

    client.request(%{
      args: [],
      call: {Spotify.Categories, :get_categories},
      url: "/browse/categories",
      method: :get,
      query: query,
      response: [
        {200, {Spotify.PagedCategories, :json_resp}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end
end
