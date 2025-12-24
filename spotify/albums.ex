defmodule Spotify.Albums do
  @moduledoc """
  Provides API endpoints related to albums
  """

  @default_client Spotify.Client

  @doc """
  Check User's Saved Albums

  Check if one or more albums is already saved in the current Spotify user's 'Your Music' library.

  ## Options

    * `ids`

  """
  @callback check_users_saved_albums(opts :: keyword) ::
              {:ok, [boolean]}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def check_users_saved_albums(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids])

    client.request(%{
      args: [],
      call: {Spotify.Albums, :check_users_saved_albums},
      url: "/me/albums/contains",
      method: :get,
      query: query,
      response: [
        {200, [:boolean]},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Album

  Get Spotify catalog information for a single album.

  ## Options

    * `market`

  """
  @callback get_an_album(id :: String.t(), opts :: keyword) ::
              {:ok, Spotify.AlbumObject.t()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_an_album(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:market])

    client.request(%{
      args: [id: id],
      call: {Spotify.Albums, :get_an_album},
      url: "/albums/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {Spotify.AlbumObject, :t}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Album Tracks

  Get Spotify catalog information about an album’s tracks.
  Optional parameters can be used to limit the number of tracks returned.

  ## Options

    * `market`
    * `limit`
    * `offset`

  """
  @callback get_an_albums_tracks(id :: String.t(), opts :: keyword) ::
              {:ok, Spotify.PagingSimplifiedTrackObject.t()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_an_albums_tracks(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :market, :offset])

    client.request(%{
      args: [id: id],
      call: {Spotify.Albums, :get_an_albums_tracks},
      url: "/albums/#{id}/tracks",
      method: :get,
      query: query,
      response: [
        {200, {Spotify.PagingSimplifiedTrackObject, :t}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Artist's Albums

  Get Spotify catalog information about an artist's albums.

  ## Options

    * `include_groups`
    * `market`
    * `limit`
    * `offset`

  """
  @callback get_an_artists_albums(id :: String.t(), opts :: keyword) ::
              {:ok, Spotify.PagingArtistDiscographyAlbumObject.t()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_an_artists_albums(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:include_groups, :limit, :market, :offset])

    client.request(%{
      args: [id: id],
      call: {Spotify.Albums, :get_an_artists_albums},
      url: "/artists/#{id}/albums",
      method: :get,
      query: query,
      response: [
        {200, {Spotify.PagingArtistDiscographyAlbumObject, :t}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Several Albums

  Get Spotify catalog information for multiple albums identified by their Spotify IDs.

  ## Options

    * `ids`
    * `market`

  """
  @callback get_multiple_albums(opts :: keyword) ::
              {:ok, Spotify.ManyAlbums.json_resp()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_multiple_albums(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids, :market])

    client.request(%{
      args: [],
      call: {Spotify.Albums, :get_multiple_albums},
      url: "/albums",
      method: :get,
      query: query,
      response: [
        {200, {Spotify.ManyAlbums, :json_resp}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get New Releases

  Get a list of new album releases featured in Spotify (shown, for example, on a Spotify player’s “Browse” tab).

  ## Options

    * `limit`
    * `offset`

  """
  @callback get_new_releases(opts :: keyword) ::
              {:ok, Spotify.PagedAlbums.json_resp()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_new_releases(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset])

    client.request(%{
      args: [],
      call: {Spotify.Albums, :get_new_releases},
      url: "/browse/new-releases",
      method: :get,
      query: query,
      response: [
        {200, {Spotify.PagedAlbums, :json_resp}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get User's Saved Albums

  Get a list of the albums saved in the current Spotify user's 'Your Music' library.

  ## Options

    * `limit`
    * `offset`
    * `market`

  """
  @callback get_users_saved_albums(opts :: keyword) ::
              {:ok, Spotify.PagingSavedAlbumObject.t()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_users_saved_albums(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :market, :offset])

    client.request(%{
      args: [],
      call: {Spotify.Albums, :get_users_saved_albums},
      url: "/me/albums",
      method: :get,
      query: query,
      response: [
        {200, {Spotify.PagingSavedAlbumObject, :t}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Remove Users' Saved Albums

  Remove one or more albums from the current user's 'Your Music' library.

  ## Options

    * `ids`

  ## Request Body

  **Content Types**: `application/json`
  """
  @callback remove_albums_user(body :: map, opts :: keyword) ::
              :ok
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def remove_albums_user(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids])

    client.request(%{
      args: [body: body],
      call: {Spotify.Albums, :remove_albums_user},
      url: "/me/albums",
      body: body,
      method: :delete,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, :null},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Save Albums for Current User

  Save one or more albums to the current user's 'Your Music' library.

  ## Options

    * `ids`

  ## Request Body

  **Content Types**: `application/json`
  """
  @callback save_albums_user(body :: map, opts :: keyword) ::
              :ok
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def save_albums_user(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids])

    client.request(%{
      args: [body: body],
      call: {Spotify.Albums, :save_albums_user},
      url: "/me/albums",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, :null},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end
end
