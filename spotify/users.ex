defmodule Spotify.Users do
  @moduledoc """
  Provides API endpoints related to users
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
      call: {Spotify.Users, :check_current_user_follows},
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
  Check if Current User Follows Playlist

  Check to see if the current user is following a specified playlist.

  ## Options

    * `ids`

  """
  @callback check_if_user_follows_playlist(playlist_id :: String.t(), opts :: keyword) ::
              {:ok, [boolean]}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def check_if_user_follows_playlist(playlist_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids])

    client.request(%{
      args: [playlist_id: playlist_id],
      call: {Spotify.Users, :check_if_user_follows_playlist},
      url: "/playlists/#{playlist_id}/followers/contains",
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
      call: {Spotify.Users, :follow_artists_users},
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
  Follow Playlist

  Add the current user as a follower of a playlist.

  ## Request Body

  **Content Types**: `application/json`
  """
  @callback follow_playlist(playlist_id :: String.t(), body :: map, opts :: keyword) ::
              :ok
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def follow_playlist(playlist_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [playlist_id: playlist_id, body: body],
      call: {Spotify.Users, :follow_playlist},
      url: "/playlists/#{playlist_id}/followers",
      body: body,
      method: :put,
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
  Get Current User's Profile

  Get detailed profile information about the current user (including the
  current user's username).

  """
  @callback get_current_users_profile(opts :: keyword) ::
              {:ok, Spotify.PrivateUserObject.t()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_current_users_profile(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Spotify.Users, :get_current_users_profile},
      url: "/me",
      method: :get,
      response: [
        {200, {Spotify.PrivateUserObject, :t}},
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
      call: {Spotify.Users, :get_followed},
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
  Get User's Playlists

  Get a list of the playlists owned or followed by a Spotify user.

  ## Options

    * `limit`
    * `offset`

  """
  @callback get_list_users_playlists(user_id :: String.t(), opts :: keyword) ::
              {:ok, Spotify.PagingPlaylistObject.t()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_list_users_playlists(user_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset])

    client.request(%{
      args: [user_id: user_id],
      call: {Spotify.Users, :get_list_users_playlists},
      url: "/users/#{user_id}/playlists",
      method: :get,
      query: query,
      response: [
        {200, {Spotify.PagingPlaylistObject, :t}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get User's Profile

  Get public profile information about a Spotify user.

  """
  @callback get_users_profile(user_id :: String.t(), opts :: keyword) ::
              {:ok, Spotify.PublicUserObject.t()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_users_profile(user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [user_id: user_id],
      call: {Spotify.Users, :get_users_profile},
      url: "/users/#{user_id}",
      method: :get,
      response: [
        {200, {Spotify.PublicUserObject, :t}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get User's Top Items

  Get the current user's top artists or tracks based on calculated affinity.

  ## Options

    * `time_range`
    * `limit`
    * `offset`

  """
  @callback get_users_top_artists_and_tracks(type :: String.t(), opts :: keyword) ::
              {:ok, Spotify.PagingArtistOrTrackObject.json_resp()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_users_top_artists_and_tracks(type, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :time_range])

    client.request(%{
      args: [type: type],
      call: {Spotify.Users, :get_users_top_artists_and_tracks},
      url: "/me/top/#{type}",
      method: :get,
      query: query,
      response: [
        {200, {Spotify.PagingArtistOrTrackObject, :json_resp}},
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
      call: {Spotify.Users, :unfollow_artists_users},
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

  @doc """
  Unfollow Playlist

  Remove the current user as a follower of a playlist.

  """
  @callback unfollow_playlist(playlist_id :: String.t(), opts :: keyword) ::
              :ok
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def unfollow_playlist(playlist_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [playlist_id: playlist_id],
      call: {Spotify.Users, :unfollow_playlist},
      url: "/playlists/#{playlist_id}/followers",
      method: :delete,
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
