defmodule Shows do
  @moduledoc """
  Provides API endpoints related to shows
  """

  @default_client Client

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
      call: {Shows, :check_users_saved_shows},
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
  Get Show


  Get Spotify catalog information for a single show identified by its
  unique Spotify ID.


  ## Options

    * `market`

  """
  @spec get_a_show(String.t(), keyword) ::
          {:ok, ShowObject.t()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_a_show(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:market])

    client.request(%{
      args: [id: id],
      call: {Shows, :get_a_show},
      url: "/shows/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {ShowObject, :t}},
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
      call: {Shows, :get_a_shows_episodes},
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
  Get Several Shows


  Get Spotify catalog information for several shows based on their Spotify IDs.


  ## Options

    * `market`
    * `ids`

  """
  @spec get_multiple_shows(keyword) ::
          {:ok, ManySimplifiedShows.json_resp()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_multiple_shows(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids, :market])

    client.request(%{
      args: [],
      call: {Shows, :get_multiple_shows},
      url: "/shows",
      method: :get,
      query: query,
      response: [
        {200, {ManySimplifiedShows, :json_resp}},
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
      call: {Shows, :get_users_saved_shows},
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
      call: {Shows, :remove_shows_user},
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
      call: {Shows, :save_shows_user},
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
end
