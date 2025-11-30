defmodule Spotify.Player do
  @moduledoc """
  Provides API endpoints related to player
  """

  @default_client Spotify.Client

  @doc """
  Add Item to Playback Queue

  Add an item to the end of the user's current playback queue. This API only works for users who have Spotify Premium. The order of execution is not guaranteed when you use this API with other Player API endpoints.

  ## Options

    * `uri`
    * `device_id`

  """
  @callback add_to_queue(opts :: keyword) ::
              :ok
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def add_to_queue(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:device_id, :uri])

    client.request(%{
      args: [],
      call: {Spotify.Player, :add_to_queue},
      url: "/me/player/queue",
      method: :post,
      query: query,
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
  Get Available Devices

  Get information about a user’s available Spotify Connect devices. Some device models are not supported and will not be listed in the API response.

  """
  @callback get_a_users_available_devices(opts :: keyword) ::
              {:ok, Spotify.ManyDevices.json_resp()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_a_users_available_devices(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Spotify.Player, :get_a_users_available_devices},
      url: "/me/player/devices",
      method: :get,
      response: [
        {200, {Spotify.ManyDevices, :json_resp}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Playback State

  Get information about the user’s current playback state, including track or episode, progress, and active device.

  ## Options

    * `market`
    * `additional_types`

  """
  @callback get_information_about_the_users_current_playback(opts :: keyword) ::
              {:ok, Spotify.CurrentlyPlayingContextObject.t()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_information_about_the_users_current_playback(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:additional_types, :market])

    client.request(%{
      args: [],
      call: {Spotify.Player, :get_information_about_the_users_current_playback},
      url: "/me/player",
      method: :get,
      query: query,
      response: [
        {200, {Spotify.CurrentlyPlayingContextObject, :t}},
        {204, :null},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get the User's Queue

  Get the list of objects that make up the user's queue.

  """
  @callback get_queue(opts :: keyword) ::
              {:ok, Spotify.QueueObject.t()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_queue(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Spotify.Player, :get_queue},
      url: "/me/player/queue",
      method: :get,
      response: [
        {200, {Spotify.QueueObject, :t}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Recently Played Tracks

  Get tracks from the current user's recently played tracks.
  _**Note**: Currently doesn't support podcast episodes._

  ## Options

    * `limit`
    * `after`
    * `before`

  """
  @callback get_recently_played(opts :: keyword) ::
              {:ok, Spotify.CursorPagingPlayHistoryObject.t()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_recently_played(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :before, :limit])

    client.request(%{
      args: [],
      call: {Spotify.Player, :get_recently_played},
      url: "/me/player/recently-played",
      method: :get,
      query: query,
      response: [
        {200, {Spotify.CursorPagingPlayHistoryObject, :t}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Currently Playing Track

  Get the object currently being played on the user's Spotify account.

  ## Options

    * `market`
    * `additional_types`

  """
  @callback get_the_users_currently_playing_track(opts :: keyword) ::
              {:ok, Spotify.CurrentlyPlayingContextObject.t()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_the_users_currently_playing_track(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:additional_types, :market])

    client.request(%{
      args: [],
      call: {Spotify.Player, :get_the_users_currently_playing_track},
      url: "/me/player/currently-playing",
      method: :get,
      query: query,
      response: [
        {200, {Spotify.CurrentlyPlayingContextObject, :t}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Pause Playback

  Pause playback on the user's account. This API only works for users who have Spotify Premium. The order of execution is not guaranteed when you use this API with other Player API endpoints.

  ## Options

    * `device_id`

  """
  @callback pause_a_users_playback(opts :: keyword) ::
              :ok
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def pause_a_users_playback(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:device_id])

    client.request(%{
      args: [],
      call: {Spotify.Player, :pause_a_users_playback},
      url: "/me/player/pause",
      method: :put,
      query: query,
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
  Seek To Position

  Seeks to the given position in the user’s currently playing track. This API only works for users who have Spotify Premium. The order of execution is not guaranteed when you use this API with other Player API endpoints.

  ## Options

    * `position_ms`
    * `device_id`

  """
  @callback seek_to_position_in_currently_playing_track(opts :: keyword) ::
              :ok
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def seek_to_position_in_currently_playing_track(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:device_id, :position_ms])

    client.request(%{
      args: [],
      call: {Spotify.Player, :seek_to_position_in_currently_playing_track},
      url: "/me/player/seek",
      method: :put,
      query: query,
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
  Set Repeat Mode

  Set the repeat mode for the user's playback. This API only works for users who have Spotify Premium. The order of execution is not guaranteed when you use this API with other Player API endpoints.

  ## Options

    * `state`
    * `device_id`

  """
  @callback set_repeat_mode_on_users_playback(opts :: keyword) ::
              :ok
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def set_repeat_mode_on_users_playback(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:device_id, :state])

    client.request(%{
      args: [],
      call: {Spotify.Player, :set_repeat_mode_on_users_playback},
      url: "/me/player/repeat",
      method: :put,
      query: query,
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
  Set Playback Volume

  Set the volume for the user’s current playback device. This API only works for users who have Spotify Premium. The order of execution is not guaranteed when you use this API with other Player API endpoints.

  ## Options

    * `volume_percent`
    * `device_id`

  """
  @callback set_volume_for_users_playback(opts :: keyword) ::
              :ok
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def set_volume_for_users_playback(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:device_id, :volume_percent])

    client.request(%{
      args: [],
      call: {Spotify.Player, :set_volume_for_users_playback},
      url: "/me/player/volume",
      method: :put,
      query: query,
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
  Skip To Next

  Skips to next track in the user’s queue. This API only works for users who have Spotify Premium. The order of execution is not guaranteed when you use this API with other Player API endpoints.

  ## Options

    * `device_id`

  """
  @callback skip_users_playback_to_next_track(opts :: keyword) ::
              :ok
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def skip_users_playback_to_next_track(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:device_id])

    client.request(%{
      args: [],
      call: {Spotify.Player, :skip_users_playback_to_next_track},
      url: "/me/player/next",
      method: :post,
      query: query,
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
  Skip To Previous

  Skips to previous track in the user’s queue. This API only works for users who have Spotify Premium. The order of execution is not guaranteed when you use this API with other Player API endpoints.

  ## Options

    * `device_id`

  """
  @callback skip_users_playback_to_previous_track(opts :: keyword) ::
              :ok
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def skip_users_playback_to_previous_track(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:device_id])

    client.request(%{
      args: [],
      call: {Spotify.Player, :skip_users_playback_to_previous_track},
      url: "/me/player/previous",
      method: :post,
      query: query,
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
  Start/Resume Playback

  Start a new context or resume current playback on the user's active device. This API only works for users who have Spotify Premium. The order of execution is not guaranteed when you use this API with other Player API endpoints.

  ## Options

    * `device_id`

  ## Request Body

  **Content Types**: `application/json`
  """
  @callback start_a_users_playback(body :: map, opts :: keyword) ::
              :ok
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def start_a_users_playback(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:device_id])

    client.request(%{
      args: [body: body],
      call: {Spotify.Player, :start_a_users_playback},
      url: "/me/player/play",
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
  Toggle Playback Shuffle

  Toggle shuffle on or off for user’s playback. This API only works for users who have Spotify Premium. The order of execution is not guaranteed when you use this API with other Player API endpoints.

  ## Options

    * `state`
    * `device_id`

  """
  @callback toggle_shuffle_for_users_playback(opts :: keyword) ::
              :ok
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def toggle_shuffle_for_users_playback(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:device_id, :state])

    client.request(%{
      args: [],
      call: {Spotify.Player, :toggle_shuffle_for_users_playback},
      url: "/me/player/shuffle",
      method: :put,
      query: query,
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
  Transfer Playback

  Transfer playback to a new device and optionally begin playback. This API only works for users who have Spotify Premium. The order of execution is not guaranteed when you use this API with other Player API endpoints.

  ## Request Body

  **Content Types**: `application/json`
  """
  @callback transfer_a_users_playback(body :: map, opts :: keyword) ::
              :ok
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def transfer_a_users_playback(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Spotify.Player, :transfer_a_users_playback},
      url: "/me/player",
      body: body,
      method: :put,
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
end
