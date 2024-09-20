defmodule Playlists do
  @moduledoc """
  Provides API endpoints related to playlists
  """

  @default_client Client

  @doc """
  Add Items to Playlist


  Add one or more items to a user's playlist.


  ## Options

    * `position`
    * `uris`

  """
  @spec add_tracks_to_playlist(String.t(), map, keyword) ::
          {:ok, PlaylistSnapshotId.json_resp()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def add_tracks_to_playlist(playlist_id, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:position, :uris])

    client.request(%{
      args: [playlist_id: playlist_id, body: body],
      call: {Playlists, :add_tracks_to_playlist},
      url: "/playlists/#{playlist_id}/tracks",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {PlaylistSnapshotId, :json_resp}},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

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
      call: {Playlists, :change_playlist_details},
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
      call: {Playlists, :check_if_user_follows_playlist},
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
      call: {Playlists, :create_playlist},
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
      call: {Playlists, :follow_playlist},
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
      call: {Playlists, :get_a_categories_playlists},
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
      call: {Playlists, :get_a_list_of_current_users_playlists},
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
  Get Featured Playlists


  Get a list of Spotify featured playlists (shown, for example, on a Spotify player's 'Browse' tab).


  ## Options

    * `locale`
    * `limit`
    * `offset`

  """
  @spec get_featured_playlists(keyword) ::
          {:ok, PagingFeaturedPlaylistObject.t()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_featured_playlists(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :locale, :offset])

    client.request(%{
      args: [],
      call: {Playlists, :get_featured_playlists},
      url: "/browse/featured-playlists",
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
      call: {Playlists, :get_list_users_playlists},
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
  Get Playlist


  Get a playlist owned by a Spotify user.


  ## Options

    * `market`
    * `fields`
    * `additional_types`

  """
  @spec get_playlist(String.t(), keyword) ::
          {:ok, PlaylistObject.t()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_playlist(playlist_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:additional_types, :fields, :market])

    client.request(%{
      args: [playlist_id: playlist_id],
      call: {Playlists, :get_playlist},
      url: "/playlists/#{playlist_id}",
      method: :get,
      query: query,
      response: [
        {200, {PlaylistObject, :t}},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Playlist Cover Image


  Get the current image associated with a specific playlist.

  """
  @spec get_playlist_cover(String.t(), keyword) ::
          {:ok, [ImageObject.t()]}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_playlist_cover(playlist_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [playlist_id: playlist_id],
      call: {Playlists, :get_playlist_cover},
      url: "/playlists/#{playlist_id}/images",
      method: :get,
      response: [
        {200, [{ImageObject, :t}]},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Playlist Items


  Get full details of the items of a playlist owned by a Spotify user.


  ## Options

    * `market`
    * `fields`
    * `limit`
    * `offset`
    * `additional_types`

  """
  @spec get_playlists_tracks(String.t(), keyword) ::
          {:ok, PagingPlaylistTrackObject.t()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_playlists_tracks(playlist_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:additional_types, :fields, :limit, :market, :offset])

    client.request(%{
      args: [playlist_id: playlist_id],
      call: {Playlists, :get_playlists_tracks},
      url: "/playlists/#{playlist_id}/tracks",
      method: :get,
      query: query,
      response: [
        {200, {PagingPlaylistTrackObject, :t}},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Remove Playlist Items


  Remove one or more items from a user's playlist.

  """
  @spec remove_tracks_playlist(String.t(), map, keyword) ::
          {:ok, PlaylistSnapshotId.json_resp()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def remove_tracks_playlist(playlist_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [playlist_id: playlist_id, body: body],
      call: {Playlists, :remove_tracks_playlist},
      url: "/playlists/#{playlist_id}/tracks",
      body: body,
      method: :delete,
      request: [{"application/json", :map}],
      response: [
        {200, {PlaylistSnapshotId, :json_resp}},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Playlist Items


  Either reorder or replace items in a playlist depending on the request's parameters.
  To reorder items, include `range_start`, `insert_before`, `range_length` and `snapshot_id` in the request's body.
  To replace items, include `uris` as either a query parameter or in the request's body.
  Replacing items in a playlist will overwrite its existing items. This operation can be used for replacing or clearing items in a playlist.
  <br/>
  **Note**: Replace and reorder are mutually exclusive operations which share the same endpoint, but have different parameters.
  These operations can't be applied together in a single request.


  ## Options

    * `uris`

  """
  @spec reorder_or_replace_playlists_tracks(String.t(), map, keyword) ::
          {:ok, PlaylistSnapshotId.json_resp()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def reorder_or_replace_playlists_tracks(playlist_id, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:uris])

    client.request(%{
      args: [playlist_id: playlist_id, body: body],
      call: {Playlists, :reorder_or_replace_playlists_tracks},
      url: "/playlists/#{playlist_id}/tracks",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {PlaylistSnapshotId, :json_resp}},
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
      call: {Playlists, :unfollow_playlist},
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

  @doc """
  Add Custom Playlist Cover Image


  Replace the image used to represent a specific playlist.

  """
  @spec upload_custom_playlist_cover(String.t(), String.t(), keyword) ::
          :ok
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def upload_custom_playlist_cover(playlist_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [playlist_id: playlist_id, body: body],
      call: {Playlists, :upload_custom_playlist_cover},
      url: "/playlists/#{playlist_id}/images",
      body: body,
      method: :put,
      request: [{"image/jpeg", {:string, :generic}}],
      response: [
        {202, :null},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end
end
