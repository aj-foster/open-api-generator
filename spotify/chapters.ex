defmodule Spotify.Chapters do
  @moduledoc """
  Provides API endpoints related to chapters
  """

  @default_client Spotify.Client

  @doc """
  Get a Chapter

  Get Spotify catalog information for a single audiobook chapter. Chapters are only available within the US, UK, Canada, Ireland, New Zealand and Australia markets.

  ## Options

    * `market`

  """
  @callback get_a_chapter(id :: String.t(), opts :: keyword) ::
              {:ok, Spotify.ChapterObject.t()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_a_chapter(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:market])

    client.request(%{
      args: [id: id],
      call: {Spotify.Chapters, :get_a_chapter},
      url: "/chapters/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {Spotify.ChapterObject, :t}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
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
      call: {Spotify.Chapters, :get_audiobook_chapters},
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
  Get Several Chapters

  Get Spotify catalog information for several audiobook chapters identified by their Spotify IDs. Chapters are only available within the US, UK, Canada, Ireland, New Zealand and Australia markets.

  ## Options

    * `ids`
    * `market`

  """
  @callback get_several_chapters(opts :: keyword) ::
              {:ok, Spotify.ManyChapters.json_resp()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_several_chapters(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids, :market])

    client.request(%{
      args: [],
      call: {Spotify.Chapters, :get_several_chapters},
      url: "/chapters",
      method: :get,
      query: query,
      response: [
        {200, {Spotify.ManyChapters, :json_resp}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end
end
