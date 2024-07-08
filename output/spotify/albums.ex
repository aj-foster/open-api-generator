defmodule Albums do
  @moduledoc """
  Provides API endpoints related to albums
  """

  @default_client Client

  @doc """
  Check User's Saved Albums


  Check if one or more albums is already saved in the current Spotify user's 'Your Music' library.


  ## Options

    * `ids`

  """
  @spec check_users_saved_albums(keyword) ::
          {:ok, [boolean]}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def check_users_saved_albums(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids])

    client.request(%{
      args: [],
      call: {Albums, :check_users_saved_albums},
      url: "/me/albums/contains",
      method: :get,
      query: query,
      response: [
        {200, [:boolean]},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
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
  @spec get_an_album(String.t(), keyword) ::
          {:ok, AlbumObject.t()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_an_album(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:market])

    client.request(%{
      args: [id: id],
      call: {Albums, :get_an_album},
      url: "/albums/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {AlbumObject, :t}},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
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
  @spec get_an_albums_tracks(String.t(), keyword) ::
          {:ok, PagingSimplifiedTrackObject.t()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_an_albums_tracks(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :market, :offset])

    client.request(%{
      args: [id: id],
      call: {Albums, :get_an_albums_tracks},
      url: "/albums/#{id}/tracks",
      method: :get,
      query: query,
      response: [
        {200, {PagingSimplifiedTrackObject, :t}},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
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
  @spec get_an_artists_albums(String.t(), keyword) ::
          {:ok, PagingArtistDiscographyAlbumObject.t()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_an_artists_albums(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:include_groups, :limit, :market, :offset])

    client.request(%{
      args: [id: id],
      call: {Albums, :get_an_artists_albums},
      url: "/artists/#{id}/albums",
      method: :get,
      query: query,
      response: [
        {200, {PagingArtistDiscographyAlbumObject, :t}},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
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
  @spec get_multiple_albums(keyword) ::
          {:ok, ManyAlbums.json_resp()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_multiple_albums(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids, :market])

    client.request(%{
      args: [],
      call: {Albums, :get_multiple_albums},
      url: "/albums",
      method: :get,
      query: query,
      response: [
        {200, {ManyAlbums, :json_resp}},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
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
  @spec get_new_releases(keyword) ::
          {:ok, PagedAlbums.json_resp()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_new_releases(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset])

    client.request(%{
      args: [],
      call: {Albums, :get_new_releases},
      url: "/browse/new-releases",
      method: :get,
      query: query,
      response: [
        {200, {PagedAlbums, :json_resp}},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
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
  @spec get_users_saved_albums(keyword) ::
          {:ok, PagingSavedAlbumObject.t()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_users_saved_albums(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :market, :offset])

    client.request(%{
      args: [],
      call: {Albums, :get_users_saved_albums},
      url: "/me/albums",
      method: :get,
      query: query,
      response: [
        {200, {PagingSavedAlbumObject, :t}},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Remove Users' Saved Albums


  Remove one or more albums from the current user's 'Your Music' library.


  ## Options

    * `ids`

  """
  @spec remove_albums_user(map, keyword) ::
          :ok
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def remove_albums_user(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids])

    client.request(%{
      args: [body: body],
      call: {Albums, :remove_albums_user},
      url: "/me/albums",
      body: body,
      method: :delete,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, :null},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Save Albums for Current User


  Save one or more albums to the current user's 'Your Music' library.


  ## Options

    * `ids`

  """
  @spec save_albums_user(map, keyword) ::
          :ok
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def save_albums_user(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids])

    client.request(%{
      args: [body: body],
      call: {Albums, :save_albums_user},
      url: "/me/albums",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, :null},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end
end
