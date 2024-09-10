defmodule GitHub.Gists do
  @moduledoc """
  Provides API endpoints related to gists
  """

  @default_client GitHub.Client

  @type check_is_starred_404_json_resp :: %{__info__: map}

  @doc """
  Check if a gist is starred

  ## Resources

    * [API method documentation](https://docs.github.com/rest/gists/gists#check-if-a-gist-is-starred)

  """
  @spec check_is_starred(String.t(), keyword) :: :ok | {:error, GitHub.Error.t()}
  def check_is_starred(gist_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [gist_id: gist_id],
      call: {GitHub.Gists, :check_is_starred},
      url: "/gists/#{gist_id}/star",
      method: :get,
      response: [
        {204, :null},
        {304, :null},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.Gists, :check_is_starred_404_json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Create a gist

  Allows you to add a new gist with one or more files.

  **Note:** Don't name your files "gistfile" with a numerical suffix. This is the format of the automatic naming scheme that Gist uses internally.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/gists/gists#create-a-gist)

  """
  @spec create(map, keyword) :: {:ok, GitHub.Gist.simple()} | {:error, GitHub.Error.t()}
  def create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {GitHub.Gists, :create},
      url: "/gists",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {GitHub.Gist, :simple}},
        {304, :null},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create a gist comment

  Creates a comment on a gist.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github.raw+json`**: Returns the raw markdown. This is the default if you do not pass any specific media type.
  - **`application/vnd.github.base64+json`**: Returns the base64-encoded contents. This can be useful if your gist contains any invalid UTF-8 sequences.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/gists/comments#create-a-gist-comment)

  """
  @spec create_comment(String.t(), map, keyword) ::
          {:ok, GitHub.Gist.Comment.t()} | {:error, GitHub.Error.t()}
  def create_comment(gist_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [gist_id: gist_id, body: body],
      call: {GitHub.Gists, :create_comment},
      url: "/gists/#{gist_id}/comments",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {GitHub.Gist.Comment, :t}},
        {304, :null},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a gist

  ## Resources

    * [API method documentation](https://docs.github.com/rest/gists/gists#delete-a-gist)

  """
  @spec delete(String.t(), keyword) :: :ok | {:error, GitHub.Error.t()}
  def delete(gist_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [gist_id: gist_id],
      call: {GitHub.Gists, :delete},
      url: "/gists/#{gist_id}",
      method: :delete,
      response: [
        {204, :null},
        {304, :null},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a gist comment

  ## Resources

    * [API method documentation](https://docs.github.com/rest/gists/comments#delete-a-gist-comment)

  """
  @spec delete_comment(String.t(), integer, keyword) :: :ok | {:error, GitHub.Error.t()}
  def delete_comment(gist_id, comment_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [gist_id: gist_id, comment_id: comment_id],
      call: {GitHub.Gists, :delete_comment},
      url: "/gists/#{gist_id}/comments/#{comment_id}",
      method: :delete,
      response: [
        {204, :null},
        {304, :null},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Fork a gist

  ## Resources

    * [API method documentation](https://docs.github.com/rest/gists/gists#fork-a-gist)

  """
  @spec fork(String.t(), keyword) :: {:ok, GitHub.BaseGist.t()} | {:error, GitHub.Error.t()}
  def fork(gist_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [gist_id: gist_id],
      call: {GitHub.Gists, :fork},
      url: "/gists/#{gist_id}/forks",
      method: :post,
      response: [
        {201, {GitHub.BaseGist, :t}},
        {304, :null},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a gist

  Gets a specified gist.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github.raw+json`**: Returns the raw markdown. This is the default if you do not pass any specific media type.
  - **`application/vnd.github.base64+json`**: Returns the base64-encoded contents. This can be useful if your gist contains any invalid UTF-8 sequences.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/gists/gists#get-a-gist)

  """
  @spec get(String.t(), keyword) :: {:ok, GitHub.Gist.simple()} | {:error, GitHub.Error.t()}
  def get(gist_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [gist_id: gist_id],
      call: {GitHub.Gists, :get},
      url: "/gists/#{gist_id}",
      method: :get,
      response: [
        {200, {GitHub.Gist, :simple}},
        {304, :null},
        {403, {GitHub.ForbiddenGist, :json_resp}},
        {404, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a gist comment

  Gets a comment on a gist.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github.raw+json`**: Returns the raw markdown. This is the default if you do not pass any specific media type.
  - **`application/vnd.github.base64+json`**: Returns the base64-encoded contents. This can be useful if your gist contains any invalid UTF-8 sequences.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/gists/comments#get-a-gist-comment)

  """
  @spec get_comment(String.t(), integer, keyword) ::
          {:ok, GitHub.Gist.Comment.t()} | {:error, GitHub.Error.t()}
  def get_comment(gist_id, comment_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [gist_id: gist_id, comment_id: comment_id],
      call: {GitHub.Gists, :get_comment},
      url: "/gists/#{gist_id}/comments/#{comment_id}",
      method: :get,
      response: [
        {200, {GitHub.Gist.Comment, :t}},
        {304, :null},
        {403, {GitHub.ForbiddenGist, :json_resp}},
        {404, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a gist revision

  Gets a specified gist revision.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github.raw+json`**: Returns the raw markdown. This is the default if you do not pass any specific media type.
  - **`application/vnd.github.base64+json`**: Returns the base64-encoded contents. This can be useful if your gist contains any invalid UTF-8 sequences.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/gists/gists#get-a-gist-revision)

  """
  @spec get_revision(String.t(), String.t(), keyword) ::
          {:ok, GitHub.Gist.simple()} | {:error, GitHub.Error.t()}
  def get_revision(gist_id, sha, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [gist_id: gist_id, sha: sha],
      call: {GitHub.Gists, :get_revision},
      url: "/gists/#{gist_id}/#{sha}",
      method: :get,
      response: [
        {200, {GitHub.Gist, :simple}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List gists for the authenticated user

  Lists the authenticated user's gists or if called anonymously, this endpoint returns all public gists:

  ## Options

    * `since`: Only show results that were last updated after the given time. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/gists/gists#list-gists-for-the-authenticated-user)

  """
  @spec list(keyword) :: {:ok, [GitHub.BaseGist.t()]} | {:error, GitHub.Error.t()}
  def list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page, :since])

    client.request(%{
      args: [],
      call: {GitHub.Gists, :list},
      url: "/gists",
      method: :get,
      query: query,
      response: [{200, [{GitHub.BaseGist, :t}]}, {304, :null}, {403, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  List gist comments

  Lists the comments on a gist.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github.raw+json`**: Returns the raw markdown. This is the default if you do not pass any specific media type.
  - **`application/vnd.github.base64+json`**: Returns the base64-encoded contents. This can be useful if your gist contains any invalid UTF-8 sequences.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/gists/comments#list-gist-comments)

  """
  @spec list_comments(String.t(), keyword) ::
          {:ok, [GitHub.Gist.Comment.t()]} | {:error, GitHub.Error.t()}
  def list_comments(gist_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [gist_id: gist_id],
      call: {GitHub.Gists, :list_comments},
      url: "/gists/#{gist_id}/comments",
      method: :get,
      query: query,
      response: [
        {200, [{GitHub.Gist.Comment, :t}]},
        {304, :null},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List gist commits

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/gists/gists#list-gist-commits)

  """
  @spec list_commits(String.t(), keyword) ::
          {:ok, [GitHub.Gist.Commit.t()]} | {:error, GitHub.Error.t()}
  def list_commits(gist_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [gist_id: gist_id],
      call: {GitHub.Gists, :list_commits},
      url: "/gists/#{gist_id}/commits",
      method: :get,
      query: query,
      response: [
        {200, [{GitHub.Gist.Commit, :t}]},
        {304, :null},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List gists for a user

  Lists public gists for the specified user:

  ## Options

    * `since`: Only show results that were last updated after the given time. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/gists/gists#list-gists-for-a-user)

  """
  @spec list_for_user(String.t(), keyword) ::
          {:ok, [GitHub.BaseGist.t()]} | {:error, GitHub.Error.t()}
  def list_for_user(username, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page, :since])

    client.request(%{
      args: [username: username],
      call: {GitHub.Gists, :list_for_user},
      url: "/users/#{username}/gists",
      method: :get,
      query: query,
      response: [{200, [{GitHub.BaseGist, :t}]}, {422, {GitHub.ValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  List gist forks

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/gists/gists#list-gist-forks)

  """
  @spec list_forks(String.t(), keyword) ::
          {:ok, [GitHub.Gist.simple()]} | {:error, GitHub.Error.t()}
  def list_forks(gist_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [gist_id: gist_id],
      call: {GitHub.Gists, :list_forks},
      url: "/gists/#{gist_id}/forks",
      method: :get,
      query: query,
      response: [
        {200, [{GitHub.Gist, :simple}]},
        {304, :null},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List public gists

  List public gists sorted by most recently updated to least recently updated.

  Note: With [pagination](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api), you can fetch up to 3000 gists. For example, you can fetch 100 pages with 30 gists per page or 30 pages with 100 gists per page.

  ## Options

    * `since`: Only show results that were last updated after the given time. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/gists/gists#list-public-gists)

  """
  @spec list_public(keyword) :: {:ok, [GitHub.BaseGist.t()]} | {:error, GitHub.Error.t()}
  def list_public(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page, :since])

    client.request(%{
      args: [],
      call: {GitHub.Gists, :list_public},
      url: "/gists/public",
      method: :get,
      query: query,
      response: [
        {200, [{GitHub.BaseGist, :t}]},
        {304, :null},
        {403, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List starred gists

  List the authenticated user's starred gists:

  ## Options

    * `since`: Only show results that were last updated after the given time. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/gists/gists#list-starred-gists)

  """
  @spec list_starred(keyword) :: {:ok, [GitHub.BaseGist.t()]} | {:error, GitHub.Error.t()}
  def list_starred(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page, :since])

    client.request(%{
      args: [],
      call: {GitHub.Gists, :list_starred},
      url: "/gists/starred",
      method: :get,
      query: query,
      response: [
        {200, [{GitHub.BaseGist, :t}]},
        {304, :null},
        {401, {GitHub.BasicError, :t}},
        {403, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Star a gist

  Note that you'll need to set `Content-Length` to zero when calling out to this endpoint. For more information, see "[HTTP method](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#http-method)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/gists/gists#star-a-gist)

  """
  @spec star(String.t(), keyword) :: :ok | {:error, GitHub.Error.t()}
  def star(gist_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [gist_id: gist_id],
      call: {GitHub.Gists, :star},
      url: "/gists/#{gist_id}/star",
      method: :put,
      response: [
        {204, :null},
        {304, :null},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Unstar a gist

  ## Resources

    * [API method documentation](https://docs.github.com/rest/gists/gists#unstar-a-gist)

  """
  @spec unstar(String.t(), keyword) :: :ok | {:error, GitHub.Error.t()}
  def unstar(gist_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [gist_id: gist_id],
      call: {GitHub.Gists, :unstar},
      url: "/gists/#{gist_id}/star",
      method: :delete,
      response: [
        {204, :null},
        {304, :null},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a gist

  Allows you to update a gist's description and to update, delete, or rename gist files. Files
  from the previous version of the gist that aren't explicitly changed during an edit
  are unchanged.

  At least one of `description` or `files` is required.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github.raw+json`**: Returns the raw markdown. This is the default if you do not pass any specific media type.
  - **`application/vnd.github.base64+json`**: Returns the base64-encoded contents. This can be useful if your gist contains any invalid UTF-8 sequences.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/gists/gists#update-a-gist)

  """
  @spec update(String.t(), map | nil, keyword) ::
          {:ok, GitHub.Gist.simple()} | {:error, GitHub.Error.t()}
  def update(gist_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [gist_id: gist_id, body: body],
      call: {GitHub.Gists, :update},
      url: "/gists/#{gist_id}",
      body: body,
      method: :patch,
      request: [{"application/json", {:union, [:map, :null]}}],
      response: [
        {200, {GitHub.Gist, :simple}},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a gist comment

  Updates a comment on a gist.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github.raw+json`**: Returns the raw markdown. This is the default if you do not pass any specific media type.
  - **`application/vnd.github.base64+json`**: Returns the base64-encoded contents. This can be useful if your gist contains any invalid UTF-8 sequences.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/gists/comments#update-a-gist-comment)

  """
  @spec update_comment(String.t(), integer, map, keyword) ::
          {:ok, GitHub.Gist.Comment.t()} | {:error, GitHub.Error.t()}
  def update_comment(gist_id, comment_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [gist_id: gist_id, comment_id: comment_id, body: body],
      call: {GitHub.Gists, :update_comment},
      url: "/gists/#{gist_id}/comments/#{comment_id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{200, {GitHub.Gist.Comment, :t}}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:check_is_starred_404_json_resp) do
    []
  end
end
