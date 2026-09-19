defmodule Spotify.Playlists do
  @moduledoc """
  Provides API endpoints related to playlists
  """

  @default_client Spotify.Client

  @doc """
  Add Items to Playlist

  Add one or more items to a user's playlist.

  ## Options

    * `position`
    * `uris`

  ## Request Body

  **Content Types**: `application/json`
  """
  @callback add_tracks_to_playlist(playlist_id :: String.t(), body :: map, opts :: keyword) ::
              {:ok, Spotify.PlaylistSnapshotId.json_resp()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def add_tracks_to_playlist(playlist_id, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:position, :uris])

    client.request(%{
      args: [playlist_id: playlist_id, body: body],
      call: {Spotify.Playlists, :add_tracks_to_playlist},
      url: "/playlists/#{playlist_id}/tracks",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {Spotify.PlaylistSnapshotId, :json_resp}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Change Playlist Details

  Change a playlist's name and public/private state. (The user must, of
  course, own the playlist.)

  ## Request Body

  **Content Types**: `application/json`
  """
  @callback change_playlist_details(playlist_id :: String.t(), body :: map, opts :: keyword) ::
              :ok
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def change_playlist_details(playlist_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [playlist_id: playlist_id, body: body],
      call: {Spotify.Playlists, :change_playlist_details},
      url: "/playlists/#{playlist_id}",
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
      call: {Spotify.Playlists, :check_if_user_follows_playlist},
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
  Create Playlist

  Create a playlist for a Spotify user. (The playlist will be empty until
  you [add tracks](/documentation/web-api/reference/add-tracks-to-playlist).)
  Each user is generally limited to a maximum of 11000 playlists.

  ## Request Body

  **Content Types**: `application/json`
  """
  @callback create_playlist(user_id :: String.t(), body :: map, opts :: keyword) ::
              {:ok, Spotify.PlaylistObject.t()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def create_playlist(user_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [user_id: user_id, body: body],
      call: {Spotify.Playlists, :create_playlist},
      url: "/users/#{user_id}/playlists",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {Spotify.PlaylistObject, :t}},
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
      call: {Spotify.Playlists, :follow_playlist},
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
      call: {Spotify.Playlists, :get_a_categories_playlists},
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
  Get Current User's Playlists

  Get a list of the playlists owned or followed by the current Spotify
  user.

  ## Options

    * `limit`
    * `offset`

  """
  @callback get_a_list_of_current_users_playlists(opts :: keyword) ::
              {:ok, Spotify.PagingPlaylistObject.t()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_a_list_of_current_users_playlists(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset])

    client.request(%{
      args: [],
      call: {Spotify.Playlists, :get_a_list_of_current_users_playlists},
      url: "/me/playlists",
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
  Get Featured Playlists

  Get a list of Spotify featured playlists (shown, for example, on a Spotify player's 'Browse' tab).

  ## Options

    * `locale`
    * `limit`
    * `offset`

  """
  @callback get_featured_playlists(opts :: keyword) ::
              {:ok, Spotify.PagingFeaturedPlaylistObject.t()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_featured_playlists(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :locale, :offset])

    client.request(%{
      args: [],
      call: {Spotify.Playlists, :get_featured_playlists},
      url: "/browse/featured-playlists",
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
      call: {Spotify.Playlists, :get_list_users_playlists},
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
  Get Playlist

  Get a playlist owned by a Spotify user.

  ## Options

    * `market`
    * `fields`
    * `additional_types`

  """
  @callback get_playlist(playlist_id :: String.t(), opts :: keyword) ::
              {:ok, Spotify.PlaylistObject.t()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_playlist(playlist_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:additional_types, :fields, :market])

    client.request(%{
      args: [playlist_id: playlist_id],
      call: {Spotify.Playlists, :get_playlist},
      url: "/playlists/#{playlist_id}",
      method: :get,
      query: query,
      response: [
        {200, {Spotify.PlaylistObject, :t}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Playlist Cover Image

  Get the current image associated with a specific playlist.

  """
  @callback get_playlist_cover(playlist_id :: String.t(), opts :: keyword) ::
              {:ok, [Spotify.ImageObject.t()]}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_playlist_cover(playlist_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [playlist_id: playlist_id],
      call: {Spotify.Playlists, :get_playlist_cover},
      url: "/playlists/#{playlist_id}/images",
      method: :get,
      response: [
        {200, [{Spotify.ImageObject, :t}]},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
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
  @callback get_playlists_tracks(playlist_id :: String.t(), opts :: keyword) ::
              {:ok, Spotify.PagingPlaylistTrackObject.t()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_playlists_tracks(playlist_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:additional_types, :fields, :limit, :market, :offset])

    client.request(%{
      args: [playlist_id: playlist_id],
      call: {Spotify.Playlists, :get_playlists_tracks},
      url: "/playlists/#{playlist_id}/tracks",
      method: :get,
      query: query,
      response: [
        {200, {Spotify.PagingPlaylistTrackObject, :t}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Remove Playlist Items

  Remove one or more items from a user's playlist.

  ## Request Body

  **Content Types**: `application/json`
  """
  @callback remove_tracks_playlist(playlist_id :: String.t(), body :: map, opts :: keyword) ::
              {:ok, Spotify.PlaylistSnapshotId.json_resp()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def remove_tracks_playlist(playlist_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [playlist_id: playlist_id, body: body],
      call: {Spotify.Playlists, :remove_tracks_playlist},
      url: "/playlists/#{playlist_id}/tracks",
      body: body,
      method: :delete,
      request: [{"application/json", :map}],
      response: [
        {200, {Spotify.PlaylistSnapshotId, :json_resp}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
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

  ## Request Body

  **Content Types**: `application/json`
  """
  @callback reorder_or_replace_playlists_tracks(
              playlist_id :: String.t(),
              body :: map,
              opts :: keyword
            ) ::
              {:ok, Spotify.PlaylistSnapshotId.json_resp()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def reorder_or_replace_playlists_tracks(playlist_id, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:uris])

    client.request(%{
      args: [playlist_id: playlist_id, body: body],
      call: {Spotify.Playlists, :reorder_or_replace_playlists_tracks},
      url: "/playlists/#{playlist_id}/tracks",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Spotify.PlaylistSnapshotId, :json_resp}},
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
      call: {Spotify.Playlists, :unfollow_playlist},
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

  @doc """
  Add Custom Playlist Cover Image

  Replace the image used to represent a specific playlist.

  ## Request Body

  **Content Types**: `image/jpeg`
  """
  @callback upload_custom_playlist_cover(
              playlist_id :: String.t(),
              body :: String.t(),
              opts :: keyword
            ) ::
              :ok
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def upload_custom_playlist_cover(playlist_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [playlist_id: playlist_id, body: body],
      call: {Spotify.Playlists, :upload_custom_playlist_cover},
      url: "/playlists/#{playlist_id}/images",
      body: body,
      method: :put,
      request: [{"image/jpeg", {:string, "byte"}}],
      response: [
        {202, :null},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end
end
