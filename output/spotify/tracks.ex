defmodule Tracks do
  @moduledoc """
  Provides API endpoints related to tracks
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
      call: {Tracks, :add_tracks_to_playlist},
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
      call: {Tracks, :check_users_saved_tracks},
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
      call: {Tracks, :get_an_albums_tracks},
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
      call: {Tracks, :get_an_artists_top_tracks},
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
  Get Track's Audio Analysis


  Get a low-level audio analysis for a track in the Spotify catalog. The audio analysis describes the track’s structure and musical content, including rhythm, pitch, and timbre.

  """
  @spec get_audio_analysis(String.t(), keyword) ::
          {:ok, AudioAnalysisObject.t()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_audio_analysis(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Tracks, :get_audio_analysis},
      url: "/audio-analysis/#{id}",
      method: :get,
      response: [
        {200, {AudioAnalysisObject, :t}},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Track's Audio Features


  Get audio feature information for a single track identified by its unique
  Spotify ID.

  """
  @spec get_audio_features(String.t(), keyword) ::
          {:ok, AudioFeaturesObject.t()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_audio_features(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Tracks, :get_audio_features},
      url: "/audio-features/#{id}",
      method: :get,
      response: [
        {200, {AudioFeaturesObject, :t}},
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
      call: {Tracks, :get_playlists_tracks},
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
  Get Recommendations


  Recommendations are generated based on the available information for a given seed entity and matched against similar artists and tracks. If there is sufficient information about the provided seeds, a list of tracks will be returned together with pool size details.

  For artists and tracks that are very new or obscure there might not be enough data to generate a list of tracks.


  ## Options

    * `limit`
    * `market`
    * `seed_artists`
    * `seed_genres`
    * `seed_tracks`
    * `min_acousticness`
    * `max_acousticness`
    * `target_acousticness`
    * `min_danceability`
    * `max_danceability`
    * `target_danceability`
    * `min_duration_ms`
    * `max_duration_ms`
    * `target_duration_ms`
    * `min_energy`
    * `max_energy`
    * `target_energy`
    * `min_instrumentalness`
    * `max_instrumentalness`
    * `target_instrumentalness`
    * `min_key`
    * `max_key`
    * `target_key`
    * `min_liveness`
    * `max_liveness`
    * `target_liveness`
    * `min_loudness`
    * `max_loudness`
    * `target_loudness`
    * `min_mode`
    * `max_mode`
    * `target_mode`
    * `min_popularity`
    * `max_popularity`
    * `target_popularity`
    * `min_speechiness`
    * `max_speechiness`
    * `target_speechiness`
    * `min_tempo`
    * `max_tempo`
    * `target_tempo`
    * `min_time_signature`
    * `max_time_signature`
    * `target_time_signature`
    * `min_valence`
    * `max_valence`
    * `target_valence`

  """
  @spec get_recommendations(keyword) ::
          {:ok, RecommendationsObject.t()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_recommendations(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :limit,
        :market,
        :max_acousticness,
        :max_danceability,
        :max_duration_ms,
        :max_energy,
        :max_instrumentalness,
        :max_key,
        :max_liveness,
        :max_loudness,
        :max_mode,
        :max_popularity,
        :max_speechiness,
        :max_tempo,
        :max_time_signature,
        :max_valence,
        :min_acousticness,
        :min_danceability,
        :min_duration_ms,
        :min_energy,
        :min_instrumentalness,
        :min_key,
        :min_liveness,
        :min_loudness,
        :min_mode,
        :min_popularity,
        :min_speechiness,
        :min_tempo,
        :min_time_signature,
        :min_valence,
        :seed_artists,
        :seed_genres,
        :seed_tracks,
        :target_acousticness,
        :target_danceability,
        :target_duration_ms,
        :target_energy,
        :target_instrumentalness,
        :target_key,
        :target_liveness,
        :target_loudness,
        :target_mode,
        :target_popularity,
        :target_speechiness,
        :target_tempo,
        :target_time_signature,
        :target_valence
      ])

    client.request(%{
      args: [],
      call: {Tracks, :get_recommendations},
      url: "/recommendations",
      method: :get,
      query: query,
      response: [
        {200, {RecommendationsObject, :t}},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Several Tracks' Audio Features


  Get audio features for multiple tracks based on their Spotify IDs.


  ## Options

    * `ids`

  """
  @spec get_several_audio_features(keyword) ::
          {:ok, ManyAudioFeatures.json_resp()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_several_audio_features(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids])

    client.request(%{
      args: [],
      call: {Tracks, :get_several_audio_features},
      url: "/audio-features",
      method: :get,
      query: query,
      response: [
        {200, {ManyAudioFeatures, :json_resp}},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Several Tracks


  Get Spotify catalog information for multiple tracks based on their Spotify IDs.


  ## Options

    * `market`
    * `ids`

  """
  @spec get_several_tracks(keyword) ::
          {:ok, ManyTracks.json_resp()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_several_tracks(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids, :market])

    client.request(%{
      args: [],
      call: {Tracks, :get_several_tracks},
      url: "/tracks",
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
  Get Track


  Get Spotify catalog information for a single track identified by its
  unique Spotify ID.


  ## Options

    * `market`

  """
  @spec get_track(String.t(), keyword) ::
          {:ok, TrackObject.t()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_track(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:market])

    client.request(%{
      args: [id: id],
      call: {Tracks, :get_track},
      url: "/tracks/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {TrackObject, :t}},
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
      call: {Tracks, :get_users_saved_tracks},
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
      call: {Tracks, :get_users_top_artists_and_tracks},
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
      call: {Tracks, :remove_tracks_playlist},
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
      call: {Tracks, :remove_tracks_user},
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
      call: {Tracks, :reorder_or_replace_playlists_tracks},
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
      call: {Tracks, :save_tracks_user},
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
end
