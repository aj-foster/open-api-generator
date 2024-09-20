defmodule Search do
  @moduledoc """
  Provides API endpoint related to search
  """

  @default_client Client

  @doc """
  Search for Item


  Get Spotify catalog information about albums, artists, playlists, tracks, shows, episodes or audiobooks
  that match a keyword string. Audiobooks are only available within the US, UK, Canada, Ireland, New Zealand and Australia markets.


  ## Options

    * `q`
    * `type`
    * `market`
    * `limit`
    * `offset`
    * `include_external`

  """
  @spec search(keyword) ::
          {:ok, SearchItems.json_resp()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def search(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:include_external, :limit, :market, :offset, :q, :type])

    client.request(%{
      args: [],
      call: {Search, :search},
      url: "/search",
      method: :get,
      query: query,
      response: [
        {200, {SearchItems, :json_resp}},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end
end
