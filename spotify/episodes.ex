defmodule Spotify.Episodes do
  @moduledoc """
  Provides API endpoints related to episodes
  """

  @default_client Spotify.Client

  @doc """
  Check User's Saved Episodes

  Check if one or more episodes is already saved in the current Spotify user's 'Your Episodes' library.<br/>
  This API endpoint is in __beta__ and could change without warning. Please share any feedback that you have, or issues that you discover, in our [developer community forum](https://community.spotify.com/t5/Spotify-for-Developers/bd-p/Spotify_Developer)..

  ## Options

    * `ids`

  """
  @callback check_users_saved_episodes(opts :: keyword) ::
              {:ok, [boolean]}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def check_users_saved_episodes(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids])

    client.request(%{
      args: [],
      call: {Spotify.Episodes, :check_users_saved_episodes},
      url: "/me/episodes/contains",
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
  Get Show Episodes

  Get Spotify catalog information about an show’s episodes. Optional parameters can be used to limit the number of episodes returned.

  ## Options

    * `market`
    * `limit`
    * `offset`

  """
  @callback get_a_shows_episodes(id :: String.t(), opts :: keyword) ::
              {:ok, Spotify.PagingSimplifiedEpisodeObject.t()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_a_shows_episodes(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :market, :offset])

    client.request(%{
      args: [id: id],
      call: {Spotify.Episodes, :get_a_shows_episodes},
      url: "/shows/#{id}/episodes",
      method: :get,
      query: query,
      response: [
        {200, {Spotify.PagingSimplifiedEpisodeObject, :t}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Episode

  Get Spotify catalog information for a single episode identified by its
  unique Spotify ID.

  ## Options

    * `market`

  """
  @callback get_an_episode(id :: String.t(), opts :: keyword) ::
              {:ok, Spotify.EpisodeObject.t()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_an_episode(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:market])

    client.request(%{
      args: [id: id],
      call: {Spotify.Episodes, :get_an_episode},
      url: "/episodes/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {Spotify.EpisodeObject, :t}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Several Episodes

  Get Spotify catalog information for several episodes based on their Spotify IDs.

  ## Options

    * `ids`
    * `market`

  """
  @callback get_multiple_episodes(opts :: keyword) ::
              {:ok, Spotify.ManyEpisodes.json_resp()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_multiple_episodes(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids, :market])

    client.request(%{
      args: [],
      call: {Spotify.Episodes, :get_multiple_episodes},
      url: "/episodes",
      method: :get,
      query: query,
      response: [
        {200, {Spotify.ManyEpisodes, :json_resp}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
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
  @callback get_users_saved_episodes(opts :: keyword) ::
              {:ok, Spotify.PagingSavedEpisodeObject.t()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_users_saved_episodes(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :market, :offset])

    client.request(%{
      args: [],
      call: {Spotify.Episodes, :get_users_saved_episodes},
      url: "/me/episodes",
      method: :get,
      query: query,
      response: [
        {200, {Spotify.PagingSavedEpisodeObject, :t}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
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

  ## Request Body

  **Content Types**: `application/json`
  """
  @callback remove_episodes_user(body :: map, opts :: keyword) ::
              :ok
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def remove_episodes_user(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids])

    client.request(%{
      args: [body: body],
      call: {Spotify.Episodes, :remove_episodes_user},
      url: "/me/episodes",
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
  Save Episodes for Current User

  Save one or more episodes to the current user's library.<br/>
  This API endpoint is in __beta__ and could change without warning. Please share any feedback that you have, or issues that you discover, in our [developer community forum](https://community.spotify.com/t5/Spotify-for-Developers/bd-p/Spotify_Developer).

  ## Options

    * `ids`

  ## Request Body

  **Content Types**: `application/json`
  """
  @callback save_episodes_user(body :: map, opts :: keyword) ::
              :ok
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def save_episodes_user(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids])

    client.request(%{
      args: [body: body],
      call: {Spotify.Episodes, :save_episodes_user},
      url: "/me/episodes",
      body: body,
      method: :put,
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
