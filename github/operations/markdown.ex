defmodule GitHub.Markdown do
  @moduledoc """
  Provides API endpoints related to markdown
  """

  @default_client GitHub.Client

  @doc """
  Render a Markdown document

  ## Request Body

  **Content Types**: `application/json`

  ## Resources

    * [API method documentation](https://docs.github.com/rest/markdown/markdown#render-a-markdown-document)

  """
  @spec render(body :: map, opts :: keyword) :: {:ok, String.t()} | {:error, GitHub.Error.t()}
  def render(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {GitHub.Markdown, :render},
      url: "/markdown",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{200, :string}, {304, :null}],
      opts: opts
    })
  end

  @doc """
  Render a Markdown document in raw mode

  You must send Markdown as plain text (using a `Content-Type` header of `text/plain` or `text/x-markdown`) to this endpoint, rather than using JSON format. In raw mode, [GitHub Flavored Markdown](https://github.github.com/gfm/) is not supported and Markdown will be rendered in plain format like a README.md file. Markdown content must be 400 KB or less.

  ## Request Body

  **Content Types**: `text/plain`, `text/x-markdown`

  ## Resources

    * [API method documentation](https://docs.github.com/rest/markdown/markdown#render-a-markdown-document-in-raw-mode)

  """
  @spec render_raw(body :: String.t(), opts :: keyword) ::
          {:ok, String.t()} | {:error, GitHub.Error.t()}
  def render_raw(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {GitHub.Markdown, :render_raw},
      url: "/markdown/raw",
      body: body,
      method: :post,
      request: [{"text/plain", :string}, {"text/x-markdown", :string}],
      response: [{200, :string}, {304, :null}],
      opts: opts
    })
  end
end
