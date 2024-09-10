defmodule Library do
  @moduledoc """
  Provides API endpoints related to library
  """

  @default_client Client

  @doc """
  Change Playlist Details


  Change a playlist's name and public/private state. (The user must, of
  course, own the playlist.)

  """
  @spec change_playlist_details(String.t(), map, keyword) ::
          :ok
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def change_playlist_details(playlist_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [playlist_id: playlist_id, body: body],
      call: {Library, :change_playlist_details},
      url: "/playlists/#{playlist_id}",
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
      call: {Library, :check_current_user_follows},
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
      call: {Library, :check_users_saved_albums},
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
  Check User's Saved Audiobooks


  Check if one or more audiobooks are already saved in the current Spotify user's library.


  ## Options

    * `ids`

  """
  @spec check_users_saved_audiobooks(keyword) ::
          {:ok, [boolean]}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def check_users_saved_audiobooks(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids])

    client.request(%{
      args: [],
      call: {Library, :check_users_saved_audiobooks},
      url: "/me/audiobooks/contains",
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
  Check User's Saved Episodes


  Check if one or more episodes is already saved in the current Spotify user's 'Your Episodes' library.<br/>
  This API endpoint is in __beta__ and could change without warning. Please share any feedback that you have, or issues that you discover, in our [developer community forum](https://community.spotify.com/t5/Spotify-for-Developers/bd-p/Spotify_Developer)..


  ## Options

    * `ids`

  """
  @spec check_users_saved_episodes(keyword) ::
          {:ok, [boolean]}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def check_users_saved_episodes(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids])

    client.request(%{
      args: [],
      call: {Library, :check_users_saved_episodes},
      url: "/me/episodes/contains",
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
  Check User's Saved Shows


  Check if one or more shows is already saved in the current Spotify user's library.


  ## Options

    * `ids`

  """
  @spec check_users_saved_shows(keyword) ::
          {:ok, [boolean]}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def check_users_saved_shows(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids])

    client.request(%{
      args: [],
      call: {Library, :check_users_saved_shows},
      url: "/me/shows/contains",
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
  Check User's Saved Tracks


  Check if one or more tracks is already saved in the current Spotify user's 'Your Music' library.


  ## Options

    * `ids`

  """
  @spec check_users_saved_tracks(keyword) ::
          {:ok, [boolean]}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def check_users_saved_tracks(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids])

    client.request(%{
      args: [],
      call: {Library, :check_users_saved_tracks},
      url: "/me/tracks/contains",
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
  Create Playlist


  Create a playlist for a Spotify user. (The playlist will be empty until
  you [add tracks](/documentation/web-api/reference/add-tracks-to-playlist).)
  Each user is generally limited to a maximum of 11000 playlists.

  """
  @spec create_playlist(String.t(), map, keyword) ::
          {:ok, PlaylistObject.t()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def create_playlist(user_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [user_id: user_id, body: body],
      call: {Library, :create_playlist},
      url: "/users/#{user_id}/playlists",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {PlaylistObject, :t}},
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
      call: {Library, :follow_artists_users},
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
  Get Current User's Playlists


  Get a list of the playlists owned or followed by the current Spotify
  user.


  ## Options

    * `limit`
    * `offset`

  """
  @spec get_a_list_of_current_users_playlists(keyword) ::
          {:ok, PagingPlaylistObject.t()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_a_list_of_current_users_playlists(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset])

    client.request(%{
      args: [],
      call: {Library, :get_a_list_of_current_users_playlists},
      url: "/me/playlists",
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
      call: {Library, :get_followed},
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
      call: {Library, :get_users_saved_albums},
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
  Get User's Saved Audiobooks


  Get a list of the audiobooks saved in the current Spotify user's 'Your Music' library.


  ## Options

    * `limit`
    * `offset`

  """
  @spec get_users_saved_audiobooks(keyword) ::
          {:ok, PagingSimplifiedAudiobookObject.t()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_users_saved_audiobooks(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset])

    client.request(%{
      args: [],
      call: {Library, :get_users_saved_audiobooks},
      url: "/me/audiobooks",
      method: :get,
      query: query,
      response: [
        {200, {PagingSimplifiedAudiobookObject, :t}},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get User's Saved Episodes


  Get a list of the episodes saved in the current Spotify user's library.<br/>
  This API endpoint is in __beta__ and could change without warning. Please share any feedback that you have, or issues that you discover, in our [developer community forum](https://community.spotify.com/t5/Spotify-for-Developers/bd-p/Spotify_Developer).


  ## Options

    * `market`
    * `limit`
    * `offset`

  """
  @spec get_users_saved_episodes(keyword) ::
          {:ok, PagingSavedEpisodeObject.t()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_users_saved_episodes(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :market, :offset])

    client.request(%{
      args: [],
      call: {Library, :get_users_saved_episodes},
      url: "/me/episodes",
      method: :get,
      query: query,
      response: [
        {200, {PagingSavedEpisodeObject, :t}},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get User's Saved Shows


  Get a list of shows saved in the current Spotify user's library. Optional parameters can be used to limit the number of shows returned.


  ## Options

    * `limit`
    * `offset`

  """
  @spec get_users_saved_shows(keyword) ::
          {:ok, PagingSavedShowObject.t()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_users_saved_shows(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset])

    client.request(%{
      args: [],
      call: {Library, :get_users_saved_shows},
      url: "/me/shows",
      method: :get,
      query: query,
      response: [
        {200, {PagingSavedShowObject, :t}},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get User's Saved Tracks


  Get a list of the songs saved in the current Spotify user's 'Your Music' library.


  ## Options

    * `market`
    * `limit`
    * `offset`

  """
  @spec get_users_saved_tracks(keyword) ::
          {:ok, PagingSavedTrackObject.t()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_users_saved_tracks(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :market, :offset])

    client.request(%{
      args: [],
      call: {Library, :get_users_saved_tracks},
      url: "/me/tracks",
      method: :get,
      query: query,
      response: [
        {200, {PagingSavedTrackObject, :t}},
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
      call: {Library, :get_users_top_artists_and_tracks},
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
      call: {Library, :remove_albums_user},
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
  Remove User's Saved Audiobooks


  Remove one or more audiobooks from the Spotify user's library.


  ## Options

    * `ids`

  """
  @spec remove_audiobooks_user(keyword) ::
          :ok
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def remove_audiobooks_user(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids])

    client.request(%{
      args: [],
      call: {Library, :remove_audiobooks_user},
      url: "/me/audiobooks",
      method: :delete,
      query: query,
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
  Remove User's Saved Episodes


  Remove one or more episodes from the current user's library.<br/>
  This API endpoint is in __beta__ and could change without warning. Please share any feedback that you have, or issues that you discover, in our [developer community forum](https://community.spotify.com/t5/Spotify-for-Developers/bd-p/Spotify_Developer).


  ## Options

    * `ids`

  """
  @spec remove_episodes_user(map, keyword) ::
          :ok
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def remove_episodes_user(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids])

    client.request(%{
      args: [body: body],
      call: {Library, :remove_episodes_user},
      url: "/me/episodes",
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
  Remove User's Saved Shows


  Delete one or more shows from current Spotify user's library.


  ## Options

    * `ids`
    * `market`

  """
  @spec remove_shows_user(keyword) ::
          :ok
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def remove_shows_user(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids, :market])

    client.request(%{
      args: [],
      call: {Library, :remove_shows_user},
      url: "/me/shows",
      method: :delete,
      query: query,
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
  Remove User's Saved Tracks


  Remove one or more tracks from the current user's 'Your Music' library.


  ## Options

    * `ids`

  """
  @spec remove_tracks_user(map, keyword) ::
          :ok
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def remove_tracks_user(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids])

    client.request(%{
      args: [body: body],
      call: {Library, :remove_tracks_user},
      url: "/me/tracks",
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
      call: {Library, :save_albums_user},
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

  @doc """
  Save Audiobooks for Current User


  Save one or more audiobooks to the current Spotify user's library.


  ## Options

    * `ids`

  """
  @spec save_audiobooks_user(keyword) ::
          :ok
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def save_audiobooks_user(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids])

    client.request(%{
      args: [],
      call: {Library, :save_audiobooks_user},
      url: "/me/audiobooks",
      method: :put,
      query: query,
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
  Save Episodes for Current User


  Save one or more episodes to the current user's library.<br/>
  This API endpoint is in __beta__ and could change without warning. Please share any feedback that you have, or issues that you discover, in our [developer community forum](https://community.spotify.com/t5/Spotify-for-Developers/bd-p/Spotify_Developer).


  ## Options

    * `ids`

  """
  @spec save_episodes_user(map, keyword) ::
          :ok
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def save_episodes_user(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids])

    client.request(%{
      args: [body: body],
      call: {Library, :save_episodes_user},
      url: "/me/episodes",
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

  @doc """
  Save Shows for Current User


  Save one or more shows to current Spotify user's library.


  ## Options

    * `ids`

  """
  @spec save_shows_user(keyword) ::
          :ok
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def save_shows_user(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids])

    client.request(%{
      args: [],
      call: {Library, :save_shows_user},
      url: "/me/shows",
      method: :put,
      query: query,
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
  Save Tracks for Current User


  Save one or more tracks to the current user's 'Your Music' library.


  ## Options

    * `ids`

  """
  @spec save_tracks_user(map, keyword) ::
          :ok
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def save_tracks_user(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids])

    client.request(%{
      args: [body: body],
      call: {Library, :save_tracks_user},
      url: "/me/tracks",
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
      call: {Library, :unfollow_artists_users},
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
