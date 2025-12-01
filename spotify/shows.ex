defmodule Spotify.Shows do
  @moduledoc """
  Provides API endpoints related to shows
  """

  @default_client Spotify.Client

  @doc """
  Check User's Saved Shows

  Check if one or more shows is already saved in the current Spotify user's library.

  ## Options

    * `ids`

  """
  @callback check_users_saved_shows(opts :: keyword) ::
              {:ok, [boolean]}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def check_users_saved_shows(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids])

    client.request(%{
      args: [],
      call: {Spotify.Shows, :check_users_saved_shows},
      url: "/me/shows/contains",
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
  Get Show

  Get Spotify catalog information for a single show identified by its
  unique Spotify ID.

  ## Options

    * `market`

  """
  @callback get_a_show(id :: String.t(), opts :: keyword) ::
              {:ok, Spotify.ShowObject.t()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_a_show(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:market])

    client.request(%{
      args: [id: id],
      call: {Spotify.Shows, :get_a_show},
      url: "/shows/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {Spotify.ShowObject, :t}},
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
      call: {Spotify.Shows, :get_a_shows_episodes},
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
  Get Several Shows

  Get Spotify catalog information for several shows based on their Spotify IDs.

  ## Options

    * `market`
    * `ids`

  """
  @callback get_multiple_shows(opts :: keyword) ::
              {:ok, Spotify.ManySimplifiedShows.json_resp()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_multiple_shows(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids, :market])

    client.request(%{
      args: [],
      call: {Spotify.Shows, :get_multiple_shows},
      url: "/shows",
      method: :get,
      query: query,
      response: [
        {200, {Spotify.ManySimplifiedShows, :json_resp}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
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
  @callback get_users_saved_shows(opts :: keyword) ::
              {:ok, Spotify.PagingSavedShowObject.t()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_users_saved_shows(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset])

    client.request(%{
      args: [],
      call: {Spotify.Shows, :get_users_saved_shows},
      url: "/me/shows",
      method: :get,
      query: query,
      response: [
        {200, {Spotify.PagingSavedShowObject, :t}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
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
  @callback remove_shows_user(opts :: keyword) ::
              :ok
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def remove_shows_user(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids, :market])

    client.request(%{
      args: [],
      call: {Spotify.Shows, :remove_shows_user},
      url: "/me/shows",
      method: :delete,
      query: query,
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
  Save Shows for Current User

  Save one or more shows to current Spotify user's library.

  ## Options

    * `ids`

  """
  @callback save_shows_user(opts :: keyword) ::
              :ok
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def save_shows_user(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids])

    client.request(%{
      args: [],
      call: {Spotify.Shows, :save_shows_user},
      url: "/me/shows",
      method: :put,
      query: query,
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
