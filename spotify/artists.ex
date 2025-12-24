defmodule Spotify.Artists do
  @moduledoc """
  Provides API endpoints related to artists
  """

  @default_client Spotify.Client

  @doc """
  Check If User Follows Artists or Users

  Check to see if the current user is following one or more artists or other Spotify users.

  ## Options

    * `type`
    * `ids`

  """
  @callback check_current_user_follows(opts :: keyword) ::
              {:ok, [boolean]}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def check_current_user_follows(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids, :type])

    client.request(%{
      args: [],
      call: {Spotify.Artists, :check_current_user_follows},
      url: "/me/following/contains",
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
  Follow Artists or Users

  Add the current user as a follower of one or more artists or other Spotify users.

  ## Options

    * `type`
    * `ids`

  ## Request Body

  **Content Types**: `application/json`
  """
  @callback follow_artists_users(body :: map, opts :: keyword) ::
              :ok
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def follow_artists_users(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids, :type])

    client.request(%{
      args: [body: body],
      call: {Spotify.Artists, :follow_artists_users},
      url: "/me/following",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {204, :null},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Artist

  Get Spotify catalog information for a single artist identified by their unique Spotify ID.

  """
  @callback get_an_artist(id :: String.t(), opts :: keyword) ::
              {:ok, Spotify.ArtistObject.t()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_an_artist(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Spotify.Artists, :get_an_artist},
      url: "/artists/#{id}",
      method: :get,
      response: [
        {200, {Spotify.ArtistObject, :t}},
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
      call: {Spotify.Artists, :get_an_artists_albums},
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
  Get Artist's Related Artists

  Get Spotify catalog information about artists similar to a given artist. Similarity is based on analysis of the Spotify community's listening history.

  """
  @callback get_an_artists_related_artists(id :: String.t(), opts :: keyword) ::
              {:ok, Spotify.ManyArtists.json_resp()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_an_artists_related_artists(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Spotify.Artists, :get_an_artists_related_artists},
      url: "/artists/#{id}/related-artists",
      method: :get,
      response: [
        {200, {Spotify.ManyArtists, :json_resp}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
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
  @callback get_an_artists_top_tracks(id :: String.t(), opts :: keyword) ::
              {:ok, Spotify.ManyTracks.json_resp()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_an_artists_top_tracks(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:market])

    client.request(%{
      args: [id: id],
      call: {Spotify.Artists, :get_an_artists_top_tracks},
      url: "/artists/#{id}/top-tracks",
      method: :get,
      query: query,
      response: [
        {200, {Spotify.ManyTracks, :json_resp}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
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
  @callback get_followed(opts :: keyword) ::
              {:ok, Spotify.CursorPagedArtists.json_resp()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_followed(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :limit, :type])

    client.request(%{
      args: [],
      call: {Spotify.Artists, :get_followed},
      url: "/me/following",
      method: :get,
      query: query,
      response: [
        {200, {Spotify.CursorPagedArtists, :json_resp}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
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
  @callback get_multiple_artists(opts :: keyword) ::
              {:ok, Spotify.ManyArtists.json_resp()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_multiple_artists(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids])

    client.request(%{
      args: [],
      call: {Spotify.Artists, :get_multiple_artists},
      url: "/artists",
      method: :get,
      query: query,
      response: [
        {200, {Spotify.ManyArtists, :json_resp}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
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

  ## Request Body

  **Content Types**: `application/json`
  """
  @callback unfollow_artists_users(body :: map, opts :: keyword) ::
              :ok
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def unfollow_artists_users(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids, :type])

    client.request(%{
      args: [body: body],
      call: {Spotify.Artists, :unfollow_artists_users},
      url: "/me/following",
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
end
