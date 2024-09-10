defmodule Artists do
  @moduledoc """
  Provides API endpoints related to artists
  """

  @default_client Client

  @doc """
  Check If User Follows Artists or Users


  Check to see if the current user is following one or more artists or other Spotify users.


  ## Options

    * `type`
    * `ids`

  """
  @spec check_current_user_follows(keyword) ::
          {:ok, [boolean]}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def check_current_user_follows(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids, :type])

    client.request(%{
      args: [],
      call: {Artists, :check_current_user_follows},
      url: "/me/following/contains",
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
  Follow Artists or Users


  Add the current user as a follower of one or more artists or other Spotify users.


  ## Options

    * `type`
    * `ids`

  """
  @spec follow_artists_users(map, keyword) ::
          :ok
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def follow_artists_users(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids, :type])

    client.request(%{
      args: [body: body],
      call: {Artists, :follow_artists_users},
      url: "/me/following",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {204, :null},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Artist


  Get Spotify catalog information for a single artist identified by their unique Spotify ID.

  """
  @spec get_an_artist(String.t(), keyword) ::
          {:ok, ArtistObject.t()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_an_artist(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Artists, :get_an_artist},
      url: "/artists/#{id}",
      method: :get,
      response: [
        {200, {ArtistObject, :t}},
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
      call: {Artists, :get_an_artists_albums},
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
  Get Artist's Related Artists


  Get Spotify catalog information about artists similar to a given artist. Similarity is based on analysis of the Spotify community's listening history.

  """
  @spec get_an_artists_related_artists(String.t(), keyword) ::
          {:ok, ManyArtists.json_resp()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_an_artists_related_artists(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Artists, :get_an_artists_related_artists},
      url: "/artists/#{id}/related-artists",
      method: :get,
      response: [
        {200, {ManyArtists, :json_resp}},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Artist's Top Tracks


  Get Spotify catalog information about an artist's top tracks by country.


  ## Options

    * `market`

  """
  @spec get_an_artists_top_tracks(String.t(), keyword) ::
          {:ok, ManyTracks.json_resp()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_an_artists_top_tracks(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:market])

    client.request(%{
      args: [id: id],
      call: {Artists, :get_an_artists_top_tracks},
      url: "/artists/#{id}/top-tracks",
      method: :get,
      query: query,
      response: [
        {200, {ManyTracks, :json_resp}},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Followed Artists


  Get the current user's followed artists.


  ## Options

    * `type`
    * `after`
    * `limit`

  """
  @spec get_followed(keyword) ::
          {:ok, CursorPagedArtists.json_resp()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_followed(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :limit, :type])

    client.request(%{
      args: [],
      call: {Artists, :get_followed},
      url: "/me/following",
      method: :get,
      query: query,
      response: [
        {200, {CursorPagedArtists, :json_resp}},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Several Artists


  Get Spotify catalog information for several artists based on their Spotify IDs.


  ## Options

    * `ids`

  """
  @spec get_multiple_artists(keyword) ::
          {:ok, ManyArtists.json_resp()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_multiple_artists(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids])

    client.request(%{
      args: [],
      call: {Artists, :get_multiple_artists},
      url: "/artists",
      method: :get,
      query: query,
      response: [
        {200, {ManyArtists, :json_resp}},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Unfollow Artists or Users


  Remove the current user as a follower of one or more artists or other Spotify users.


  ## Options

    * `type`
    * `ids`

  """
  @spec unfollow_artists_users(map, keyword) ::
          :ok
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def unfollow_artists_users(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids, :type])

    client.request(%{
      args: [body: body],
      call: {Artists, :unfollow_artists_users},
      url: "/me/following",
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
end
