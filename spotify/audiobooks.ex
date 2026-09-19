defmodule Spotify.Audiobooks do
  @moduledoc """
  Provides API endpoints related to audiobooks
  """

  @default_client Spotify.Client

  @doc """
  Check User's Saved Audiobooks

  Check if one or more audiobooks are already saved in the current Spotify user's library.

  ## Options

    * `ids`

  """
  @callback check_users_saved_audiobooks(opts :: keyword) ::
              {:ok, [boolean]}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def check_users_saved_audiobooks(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids])

    client.request(%{
      args: [],
      call: {Spotify.Audiobooks, :check_users_saved_audiobooks},
      url: "/me/audiobooks/contains",
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
  Get an Audiobook

  Get Spotify catalog information for a single audiobook. Audiobooks are only available within the US, UK, Canada, Ireland, New Zealand and Australia markets.

  ## Options

    * `market`

  """
  @callback get_an_audiobook(id :: String.t(), opts :: keyword) ::
              {:ok, Spotify.AudiobookObject.t()}
              | {:error,
                 Spotify.BadRequest.json_resp()
                 | Spotify.Forbidden.json_resp()
                 | Spotify.NotFound.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_an_audiobook(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:market])

    client.request(%{
      args: [id: id],
      call: {Spotify.Audiobooks, :get_an_audiobook},
      url: "/audiobooks/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {Spotify.AudiobookObject, :t}},
        {400, {Spotify.BadRequest, :json_resp}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {404, {Spotify.NotFound, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Audiobook Chapters

  Get Spotify catalog information about an audiobook's chapters. Audiobooks are only available within the US, UK, Canada, Ireland, New Zealand and Australia markets.

  ## Options

    * `market`
    * `limit`
    * `offset`

  """
  @callback get_audiobook_chapters(id :: String.t(), opts :: keyword) ::
              {:ok, Spotify.PagingSimplifiedChapterObject.t()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_audiobook_chapters(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :market, :offset])

    client.request(%{
      args: [id: id],
      call: {Spotify.Audiobooks, :get_audiobook_chapters},
      url: "/audiobooks/#{id}/chapters",
      method: :get,
      query: query,
      response: [
        {200, {Spotify.PagingSimplifiedChapterObject, :t}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Several Audiobooks

  Get Spotify catalog information for several audiobooks identified by their Spotify IDs. Audiobooks are only available within the US, UK, Canada, Ireland, New Zealand and Australia markets.

  ## Options

    * `ids`
    * `market`

  """
  @callback get_multiple_audiobooks(opts :: keyword) ::
              {:ok, Spotify.ManyAudiobooks.json_resp()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_multiple_audiobooks(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids, :market])

    client.request(%{
      args: [],
      call: {Spotify.Audiobooks, :get_multiple_audiobooks},
      url: "/audiobooks",
      method: :get,
      query: query,
      response: [
        {200, {Spotify.ManyAudiobooks, :json_resp}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
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
  @callback get_users_saved_audiobooks(opts :: keyword) ::
              {:ok, Spotify.PagingSimplifiedAudiobookObject.t()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_users_saved_audiobooks(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset])

    client.request(%{
      args: [],
      call: {Spotify.Audiobooks, :get_users_saved_audiobooks},
      url: "/me/audiobooks",
      method: :get,
      query: query,
      response: [
        {200, {Spotify.PagingSimplifiedAudiobookObject, :t}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
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
  @callback remove_audiobooks_user(opts :: keyword) ::
              :ok
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def remove_audiobooks_user(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids])

    client.request(%{
      args: [],
      call: {Spotify.Audiobooks, :remove_audiobooks_user},
      url: "/me/audiobooks",
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
  Save Audiobooks for Current User

  Save one or more audiobooks to the current Spotify user's library.

  ## Options

    * `ids`

  """
  @callback save_audiobooks_user(opts :: keyword) ::
              :ok
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def save_audiobooks_user(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids])

    client.request(%{
      args: [],
      call: {Spotify.Audiobooks, :save_audiobooks_user},
      url: "/me/audiobooks",
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
