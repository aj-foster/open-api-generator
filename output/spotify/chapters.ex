defmodule Chapters do
  @moduledoc """
  Provides API endpoints related to chapters
  """

  @default_client Client

  @doc """
  Get a Chapter


  Get Spotify catalog information for a single audiobook chapter. Chapters are only available within the US, UK, Canada, Ireland, New Zealand and Australia markets.


  ## Options

    * `market`

  """
  @spec get_a_chapter(String.t(), keyword) ::
          {:ok, ChapterObject.t()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_a_chapter(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:market])

    client.request(%{
      args: [id: id],
      call: {Chapters, :get_a_chapter},
      url: "/chapters/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {ChapterObject, :t}},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
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
      call: {Chapters, :get_audiobook_chapters},
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
  Get Several Chapters


  Get Spotify catalog information for several audiobook chapters identified by their Spotify IDs. Chapters are only available within the US, UK, Canada, Ireland, New Zealand and Australia markets.


  ## Options

    * `ids`
    * `market`

  """
  @spec get_several_chapters(keyword) ::
          {:ok, ManyChapters.json_resp()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_several_chapters(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids, :market])

    client.request(%{
      args: [],
      call: {Chapters, :get_several_chapters},
      url: "/chapters",
      method: :get,
      query: query,
      response: [
        {200, {ManyChapters, :json_resp}},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end
end
