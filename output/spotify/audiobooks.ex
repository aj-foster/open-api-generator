defmodule Audiobooks do
  @moduledoc """
  Provides API endpoints related to audiobooks
  """

  @default_client Client

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
      call: {Audiobooks, :check_users_saved_audiobooks},
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
  Get an Audiobook


  Get Spotify catalog information for a single audiobook. Audiobooks are only available within the US, UK, Canada, Ireland, New Zealand and Australia markets.


  ## Options

    * `market`

  """
  @spec get_an_audiobook(String.t(), keyword) ::
          {:ok, AudiobookObject.t()}
          | {:error,
             BadRequest.json_resp()
             | Forbidden.json_resp()
             | NotFound.json_resp()
             | TooManyRequests.json_resp()
             | Unauthorized.json_resp()}
  def get_an_audiobook(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:market])

    client.request(%{
      args: [id: id],
      call: {Audiobooks, :get_an_audiobook},
      url: "/audiobooks/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {AudiobookObject, :t}},
        {400, {BadRequest, :json_resp}},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {404, {NotFound, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
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
  @spec get_audiobook_chapters(String.t(), keyword) ::
          {:ok, PagingSimplifiedChapterObject.t()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_audiobook_chapters(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :market, :offset])

    client.request(%{
      args: [id: id],
      call: {Audiobooks, :get_audiobook_chapters},
      url: "/audiobooks/#{id}/chapters",
      method: :get,
      query: query,
      response: [
        {200, {PagingSimplifiedChapterObject, :t}},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
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
  @spec get_multiple_audiobooks(keyword) ::
          {:ok, ManyAudiobooks.json_resp()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_multiple_audiobooks(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids, :market])

    client.request(%{
      args: [],
      call: {Audiobooks, :get_multiple_audiobooks},
      url: "/audiobooks",
      method: :get,
      query: query,
      response: [
        {200, {ManyAudiobooks, :json_resp}},
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
      call: {Audiobooks, :get_users_saved_audiobooks},
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
      call: {Audiobooks, :remove_audiobooks_user},
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
      call: {Audiobooks, :save_audiobooks_user},
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
end
