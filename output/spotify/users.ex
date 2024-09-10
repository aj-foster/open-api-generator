defmodule Users do
  @moduledoc """
  Provides API endpoints related to users
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
      call: {Users, :check_current_user_follows},
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
  Check if Current User Follows Playlist


  Check to see if the current user is following a specified playlist.


  ## Options

    * `ids`

  """
  @spec check_if_user_follows_playlist(String.t(), keyword) ::
          {:ok, [boolean]}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def check_if_user_follows_playlist(playlist_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids])

    client.request(%{
      args: [playlist_id: playlist_id],
      call: {Users, :check_if_user_follows_playlist},
      url: "/playlists/#{playlist_id}/followers/contains",
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
      call: {Users, :follow_artists_users},
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
  Follow Playlist


  Add the current user as a follower of a playlist.

  """
  @spec follow_playlist(String.t(), map, keyword) ::
          :ok
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def follow_playlist(playlist_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [playlist_id: playlist_id, body: body],
      call: {Users, :follow_playlist},
      url: "/playlists/#{playlist_id}/followers",
      body: body,
      method: :put,
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
  Get Current User's Profile


  Get detailed profile information about the current user (including the
  current user's username).

  """
  @spec get_current_users_profile(keyword) ::
          {:ok, PrivateUserObject.t()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_current_users_profile(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Users, :get_current_users_profile},
      url: "/me",
      method: :get,
      response: [
        {200, {PrivateUserObject, :t}},
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
      call: {Users, :get_followed},
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
  Get User's Playlists


  Get a list of the playlists owned or followed by a Spotify user.


  ## Options

    * `limit`
    * `offset`

  """
  @spec get_list_users_playlists(String.t(), keyword) ::
          {:ok, PagingPlaylistObject.t()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_list_users_playlists(user_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset])

    client.request(%{
      args: [user_id: user_id],
      call: {Users, :get_list_users_playlists},
      url: "/users/#{user_id}/playlists",
      method: :get,
      query: query,
      response: [
        {200, {PagingPlaylistObject, :t}},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get User's Profile


  Get public profile information about a Spotify user.

  """
  @spec get_users_profile(String.t(), keyword) ::
          {:ok, PublicUserObject.t()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_users_profile(user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [user_id: user_id],
      call: {Users, :get_users_profile},
      url: "/users/#{user_id}",
      method: :get,
      response: [
        {200, {PublicUserObject, :t}},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
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
  @spec get_users_top_artists_and_tracks(String.t(), keyword) ::
          {:ok, PagingArtistOrTrackObject.json_resp()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_users_top_artists_and_tracks(type, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :time_range])

    client.request(%{
      args: [type: type],
      call: {Users, :get_users_top_artists_and_tracks},
      url: "/me/top/#{type}",
      method: :get,
      query: query,
      response: [
        {200, {PagingArtistOrTrackObject, :json_resp}},
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
      call: {Users, :unfollow_artists_users},
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

  @doc """
  Unfollow Playlist


  Remove the current user as a follower of a playlist.

  """
  @spec unfollow_playlist(String.t(), keyword) ::
          :ok
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def unfollow_playlist(playlist_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [playlist_id: playlist_id],
      call: {Users, :unfollow_playlist},
      url: "/playlists/#{playlist_id}/followers",
      method: :delete,
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
