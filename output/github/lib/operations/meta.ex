defmodule GitHub.Meta do
  @moduledoc """
  Provides API endpoints related to meta
  """

  @default_client GitHub.Client

  @doc """
  Get GitHub meta information

  Returns meta information about GitHub, including a list of GitHub's IP addresses. For more information, see "[About GitHub's IP addresses](https://docs.github.com/articles/about-github-s-ip-addresses/)."

  The API's response also includes a list of GitHub's domain names.

  The values shown in the documentation's response are example values. You must always query the API directly to get the latest values.

  **Note:** This endpoint returns both IPv4 and IPv6 addresses. However, not all features support IPv6. You should refer to the specific documentation for each feature to determine if IPv6 is supported.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/meta/meta#get-apiname-meta-information)

  """
  @spec get(keyword) :: {:ok, GitHub.ApiOverview.t()} | {:error, GitHub.Error.t()}
  def get(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {GitHub.Meta, :get},
      url: "/meta",
      method: :get,
      response: [{200, {GitHub.ApiOverview, :t}}, {304, :null}],
      opts: opts
    })
  end

  @doc """
  Get all API versions

  Get all supported GitHub API versions.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/meta/meta#get-all-api-versions)

  """
  @spec get_all_versions(keyword) :: {:ok, [Date.t()]} | {:error, GitHub.Error.t()}
  def get_all_versions(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {GitHub.Meta, :get_all_versions},
      url: "/versions",
      method: :get,
      response: [{200, [string: :date]}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get Octocat

  Get the octocat as ASCII art

  ## Options

    * `s`: The words to show in Octocat's speech bubble

  ## Resources

    * [API method documentation](https://docs.github.com/rest/meta/meta#get-octocat)

  """
  @spec get_octocat(keyword) :: {:ok, String.t()} | {:error, GitHub.Error.t()}
  def get_octocat(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:s])

    client.request(%{
      args: [],
      call: {GitHub.Meta, :get_octocat},
      url: "/octocat",
      method: :get,
      query: query,
      response: [{200, {:string, :generic}}],
      opts: opts
    })
  end

  @doc """
  Get the Zen of GitHub

  Get a random sentence from the Zen of GitHub

  ## Resources

    * [API method documentation](https://docs.github.com/rest/meta/meta#get-the-zen-of-github)

  """
  @spec get_zen(keyword) :: {:ok, String.t()} | {:error, GitHub.Error.t()}
  def get_zen(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {GitHub.Meta, :get_zen},
      url: "/zen",
      method: :get,
      response: [{200, {:string, :generic}}],
      opts: opts
    })
  end

  @doc """
  GitHub API Root

  Get Hypermedia links to resources accessible in GitHub's REST API

  ## Resources

    * [API method documentation](https://docs.github.com/rest/meta/meta#github-api-root)

  """
  @spec root(keyword) :: {:ok, GitHub.Root.t()} | {:error, GitHub.Error.t()}
  def root(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {GitHub.Meta, :root},
      url: "/",
      method: :get,
      response: [{200, {GitHub.Root, :t}}],
      opts: opts
    })
  end
end
