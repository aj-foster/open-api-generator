defmodule Episodes do
  @moduledoc """
  Provides API endpoints related to episodes
  """

  @default_client Client

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
      call: {Episodes, :check_users_saved_episodes},
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
  Get Show Episodes


  Get Spotify catalog information about an show’s episodes. Optional parameters can be used to limit the number of episodes returned.


  ## Options

    * `market`
    * `limit`
    * `offset`

  """
  @spec get_a_shows_episodes(String.t(), keyword) ::
          {:ok, PagingSimplifiedEpisodeObject.t()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_a_shows_episodes(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :market, :offset])

    client.request(%{
      args: [id: id],
      call: {Episodes, :get_a_shows_episodes},
      url: "/shows/#{id}/episodes",
      method: :get,
      query: query,
      response: [
        {200, {PagingSimplifiedEpisodeObject, :t}},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
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
  @spec get_an_episode(String.t(), keyword) ::
          {:ok, EpisodeObject.t()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_an_episode(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:market])

    client.request(%{
      args: [id: id],
      call: {Episodes, :get_an_episode},
      url: "/episodes/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {EpisodeObject, :t}},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
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
  @spec get_multiple_episodes(keyword) ::
          {:ok, ManyEpisodes.json_resp()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_multiple_episodes(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids, :market])

    client.request(%{
      args: [],
      call: {Episodes, :get_multiple_episodes},
      url: "/episodes",
      method: :get,
      query: query,
      response: [
        {200, {ManyEpisodes, :json_resp}},
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
      call: {Episodes, :get_users_saved_episodes},
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
      call: {Episodes, :remove_episodes_user},
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
      call: {Episodes, :save_episodes_user},
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
end
