defmodule GitHub.Search do
  @moduledoc """
  Provides API endpoints related to search
  """

  @default_client GitHub.Client

  @type code_200_json_resp :: %{
          __info__: map,
          incomplete_results: boolean,
          items: [GitHub.CodeSearchResultItem.t()],
          total_count: integer
        }

  @doc """
  Search code

  Searches for query terms inside of a file. This method returns up to 100 results [per page](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api).

  When searching for code, you can get text match metadata for the file **content** and file **path** fields when you pass the `text-match` media type. For more details about how to receive highlighted search results, see [Text match metadata](https://docs.github.com/rest/search/search#text-match-metadata).

  For example, if you want to find the definition of the `addClass` function inside [jQuery](https://github.com/jquery/jquery) repository, your query would look something like this:

  `q=addClass+in:file+language:js+repo:jquery/jquery`

  This query searches for the keyword `addClass` within a file's contents. The query limits the search to files where the language is JavaScript in the `jquery/jquery` repository.

  Considerations for code search:

  Due to the complexity of searching code, there are a few restrictions on how searches are performed:

  *   Only the _default branch_ is considered. In most cases, this will be the `master` branch.
  *   Only files smaller than 384 KB are searchable.
  *   You must always include at least one search term when searching source code. For example, searching for [`language:go`](https://github.com/search?utf8=%E2%9C%93&q=language%3Ago&type=Code) is not valid, while [`amazing
  language:go`](https://github.com/search?utf8=%E2%9C%93&q=amazing+language%3Ago&type=Code) is.

  This endpoint requires you to authenticate and limits you to 10 requests per minute.

  ## Options

    * `q`: The query contains one or more search keywords and qualifiers. Qualifiers allow you to limit your search to specific areas of GitHub. The REST API supports the same qualifiers as the web interface for GitHub. To learn more about the format of the query, see [Constructing a search query](https://docs.github.com/rest/search/search#constructing-a-search-query). See "[Searching code](https://docs.github.com/search-github/searching-on-github/searching-code)" for a detailed list of qualifiers.
    * `sort`: **This field is deprecated.** Sorts the results of your query. Can only be `indexed`, which indicates how recently a file has been indexed by the GitHub search infrastructure. Default: [best match](https://docs.github.com/rest/search/search#ranking-search-results)
    * `order`: **This field is deprecated.** Determines whether the first search result returned is the highest number of matches (`desc`) or lowest number of matches (`asc`). This parameter is ignored unless you provide `sort`. 
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/search/search#search-code)

  """
  @spec code(keyword) :: {:ok, map} | {:error, GitHub.Error.t()}
  def code(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:order, :page, :per_page, :q, :sort])

    client.request(%{
      args: [],
      call: {GitHub.Search, :code},
      url: "/search/code",
      method: :get,
      query: query,
      response: [
        {200, {GitHub.Search, :code_200_json_resp}},
        {304, :null},
        {403, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}},
        {503, {GitHub.ServiceUnavailable, :json_resp}}
      ],
      opts: opts
    })
  end

  @type commits_200_json_resp :: %{
          __info__: map,
          incomplete_results: boolean,
          items: [GitHub.Commit.SearchResultItem.t()],
          total_count: integer
        }

  @doc """
  Search commits

  Find commits via various criteria on the default branch (usually `main`). This method returns up to 100 results [per page](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api).

  When searching for commits, you can get text match metadata for the **message** field when you provide the `text-match` media type. For more details about how to receive highlighted search results, see [Text match
  metadata](https://docs.github.com/rest/search/search#text-match-metadata).

  For example, if you want to find commits related to CSS in the [octocat/Spoon-Knife](https://github.com/octocat/Spoon-Knife) repository. Your query would look something like this:

  `q=repo:octocat/Spoon-Knife+css`

  ## Options

    * `q`: The query contains one or more search keywords and qualifiers. Qualifiers allow you to limit your search to specific areas of GitHub. The REST API supports the same qualifiers as the web interface for GitHub. To learn more about the format of the query, see [Constructing a search query](https://docs.github.com/rest/search/search#constructing-a-search-query). See "[Searching commits](https://docs.github.com/search-github/searching-on-github/searching-commits)" for a detailed list of qualifiers.
    * `sort`: Sorts the results of your query by `author-date` or `committer-date`. Default: [best match](https://docs.github.com/rest/search/search#ranking-search-results)
    * `order`: Determines whether the first search result returned is the highest number of matches (`desc`) or lowest number of matches (`asc`). This parameter is ignored unless you provide `sort`.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/search/search#search-commits)

  """
  @spec commits(keyword) :: {:ok, map} | {:error, GitHub.Error.t()}
  def commits(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:order, :page, :per_page, :q, :sort])

    client.request(%{
      args: [],
      call: {GitHub.Search, :commits},
      url: "/search/commits",
      method: :get,
      query: query,
      response: [{200, {GitHub.Search, :commits_200_json_resp}}, {304, :null}],
      opts: opts
    })
  end

  @type issues_and_pull_requests_200_json_resp :: %{
          __info__: map,
          incomplete_results: boolean,
          items: [GitHub.Issue.SearchResultItem.t()],
          total_count: integer
        }

  @doc """
  Search issues and pull requests

  Find issues by state and keyword. This method returns up to 100 results [per page](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api).

  When searching for issues, you can get text match metadata for the issue **title**, issue **body**, and issue **comment body** fields when you pass the `text-match` media type. For more details about how to receive highlighted
  search results, see [Text match metadata](https://docs.github.com/rest/search/search#text-match-metadata).

  For example, if you want to find the oldest unresolved Python bugs on Windows. Your query might look something like this.

  `q=windows+label:bug+language:python+state:open&sort=created&order=asc`

  This query searches for the keyword `windows`, within any open issue that is labeled as `bug`. The search runs across repositories whose primary language is Python. The results are sorted by creation date in ascending order, which means the oldest issues appear first in the search results.

  **Note:** For requests made by GitHub Apps with a user access token, you can't retrieve a combination of issues and pull requests in a single query. Requests that don't include the `is:issue` or `is:pull-request` qualifier will receive an HTTP `422 Unprocessable Entity` response. To get results for both issues and pull requests, you must send separate queries for issues and pull requests. For more information about the `is` qualifier, see "[Searching only issues or pull requests](https://docs.github.com/github/searching-for-information-on-github/searching-issues-and-pull-requests#search-only-issues-or-pull-requests)."

  ## Options

    * `q`: The query contains one or more search keywords and qualifiers. Qualifiers allow you to limit your search to specific areas of GitHub. The REST API supports the same qualifiers as the web interface for GitHub. To learn more about the format of the query, see [Constructing a search query](https://docs.github.com/rest/search/search#constructing-a-search-query). See "[Searching issues and pull requests](https://docs.github.com/search-github/searching-on-github/searching-issues-and-pull-requests)" for a detailed list of qualifiers.
    * `sort`: Sorts the results of your query by the number of `comments`, `reactions`, `reactions-+1`, `reactions--1`, `reactions-smile`, `reactions-thinking_face`, `reactions-heart`, `reactions-tada`, or `interactions`. You can also sort results by how recently the items were `created` or `updated`, Default: [best match](https://docs.github.com/rest/search/search#ranking-search-results)
    * `order`: Determines whether the first search result returned is the highest number of matches (`desc`) or lowest number of matches (`asc`). This parameter is ignored unless you provide `sort`.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/search/search#search-issues-and-pull-requests)

  """
  @spec issues_and_pull_requests(keyword) :: {:ok, map} | {:error, GitHub.Error.t()}
  def issues_and_pull_requests(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:order, :page, :per_page, :q, :sort])

    client.request(%{
      args: [],
      call: {GitHub.Search, :issues_and_pull_requests},
      url: "/search/issues",
      method: :get,
      query: query,
      response: [
        {200, {GitHub.Search, :issues_and_pull_requests_200_json_resp}},
        {304, :null},
        {403, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}},
        {503, {GitHub.ServiceUnavailable, :json_resp}}
      ],
      opts: opts
    })
  end

  @type labels_200_json_resp :: %{
          __info__: map,
          incomplete_results: boolean,
          items: [GitHub.LabelSearchResultItem.t()],
          total_count: integer
        }

  @doc """
  Search labels

  Find labels in a repository with names or descriptions that match search keywords. Returns up to 100 results [per page](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api).

  When searching for labels, you can get text match metadata for the label **name** and **description** fields when you pass the `text-match` media type. For more details about how to receive highlighted search results, see [Text match metadata](https://docs.github.com/rest/search/search#text-match-metadata).

  For example, if you want to find labels in the `linguist` repository that match `bug`, `defect`, or `enhancement`. Your query might look like this:

  `q=bug+defect+enhancement&repository_id=64778136`

  The labels that best match the query appear first in the search results.

  ## Options

    * `repository_id`: The id of the repository.
    * `q`: The search keywords. This endpoint does not accept qualifiers in the query. To learn more about the format of the query, see [Constructing a search query](https://docs.github.com/rest/search/search#constructing-a-search-query).
    * `sort`: Sorts the results of your query by when the label was `created` or `updated`. Default: [best match](https://docs.github.com/rest/search/search#ranking-search-results)
    * `order`: Determines whether the first search result returned is the highest number of matches (`desc`) or lowest number of matches (`asc`). This parameter is ignored unless you provide `sort`.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/search/search#search-labels)

  """
  @spec labels(keyword) :: {:ok, map} | {:error, GitHub.Error.t()}
  def labels(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:order, :page, :per_page, :q, :repository_id, :sort])

    client.request(%{
      args: [],
      call: {GitHub.Search, :labels},
      url: "/search/labels",
      method: :get,
      query: query,
      response: [
        {200, {GitHub.Search, :labels_200_json_resp}},
        {304, :null},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @type repos_200_json_resp :: %{
          __info__: map,
          incomplete_results: boolean,
          items: [GitHub.RepoSearchResultItem.t()],
          total_count: integer
        }

  @doc """
  Search repositories

  Find repositories via various criteria. This method returns up to 100 results [per page](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api).

  When searching for repositories, you can get text match metadata for the **name** and **description** fields when you pass the `text-match` media type. For more details about how to receive highlighted search results, see [Text match metadata](https://docs.github.com/rest/search/search#text-match-metadata).

  For example, if you want to search for popular Tetris repositories written in assembly code, your query might look like this:

  `q=tetris+language:assembly&sort=stars&order=desc`

  This query searches for repositories with the word `tetris` in the name, the description, or the README. The results are limited to repositories where the primary language is assembly. The results are sorted by stars in descending order, so that the most popular repositories appear first in the search results.

  ## Options

    * `q`: The query contains one or more search keywords and qualifiers. Qualifiers allow you to limit your search to specific areas of GitHub. The REST API supports the same qualifiers as the web interface for GitHub. To learn more about the format of the query, see [Constructing a search query](https://docs.github.com/rest/search/search#constructing-a-search-query). See "[Searching for repositories](https://docs.github.com/articles/searching-for-repositories/)" for a detailed list of qualifiers.
    * `sort`: Sorts the results of your query by number of `stars`, `forks`, or `help-wanted-issues` or how recently the items were `updated`. Default: [best match](https://docs.github.com/rest/search/search#ranking-search-results)
    * `order`: Determines whether the first search result returned is the highest number of matches (`desc`) or lowest number of matches (`asc`). This parameter is ignored unless you provide `sort`.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/search/search#search-repositories)

  """
  @spec repos(keyword) :: {:ok, map} | {:error, GitHub.Error.t()}
  def repos(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:order, :page, :per_page, :q, :sort])

    client.request(%{
      args: [],
      call: {GitHub.Search, :repos},
      url: "/search/repositories",
      method: :get,
      query: query,
      response: [
        {200, {GitHub.Search, :repos_200_json_resp}},
        {304, :null},
        {422, {GitHub.ValidationError, :t}},
        {503, {GitHub.ServiceUnavailable, :json_resp}}
      ],
      opts: opts
    })
  end

  @type topics_200_json_resp :: %{
          __info__: map,
          incomplete_results: boolean,
          items: [GitHub.TopicSearchResultItem.t()],
          total_count: integer
        }

  @doc """
  Search topics

  Find topics via various criteria. Results are sorted by best match. This method returns up to 100 results [per page](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api). See "[Searching topics](https://docs.github.com/articles/searching-topics/)" for a detailed list of qualifiers.

  When searching for topics, you can get text match metadata for the topic's **short\_description**, **description**, **name**, or **display\_name** field when you pass the `text-match` media type. For more details about how to receive highlighted search results, see [Text match metadata](https://docs.github.com/rest/search/search#text-match-metadata).

  For example, if you want to search for topics related to Ruby that are featured on https://github.com/topics. Your query might look like this:

  `q=ruby+is:featured`

  This query searches for topics with the keyword `ruby` and limits the results to find only topics that are featured. The topics that are the best match for the query appear first in the search results.

  ## Options

    * `q`: The query contains one or more search keywords and qualifiers. Qualifiers allow you to limit your search to specific areas of GitHub. The REST API supports the same qualifiers as the web interface for GitHub. To learn more about the format of the query, see [Constructing a search query](https://docs.github.com/rest/search/search#constructing-a-search-query).
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/search/search#search-topics)

  """
  @spec topics(keyword) :: {:ok, map} | {:error, GitHub.Error.t()}
  def topics(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page, :q])

    client.request(%{
      args: [],
      call: {GitHub.Search, :topics},
      url: "/search/topics",
      method: :get,
      query: query,
      response: [{200, {GitHub.Search, :topics_200_json_resp}}, {304, :null}],
      opts: opts
    })
  end

  @type users_200_json_resp :: %{
          __info__: map,
          incomplete_results: boolean,
          items: [GitHub.User.SearchResultItem.t()],
          total_count: integer
        }

  @doc """
  Search users

  Find users via various criteria. This method returns up to 100 results [per page](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api).

  When searching for users, you can get text match metadata for the issue **login**, public **email**, and **name** fields when you pass the `text-match` media type. For more details about highlighting search results, see [Text match metadata](https://docs.github.com/rest/search/search#text-match-metadata). For more details about how to receive highlighted search results, see [Text match metadata](https://docs.github.com/rest/search/search#text-match-metadata).

  For example, if you're looking for a list of popular users, you might try this query:

  `q=tom+repos:%3E42+followers:%3E1000`

  This query searches for users with the name `tom`. The results are restricted to users with more than 42 repositories and over 1,000 followers.

  This endpoint does not accept authentication and will only include publicly visible users. As an alternative, you can use the GraphQL API. The GraphQL API requires authentication and will return private users, including Enterprise Managed Users (EMUs), that you are authorized to view. For more information, see "[GraphQL Queries](https://docs.github.com/graphql/reference/queries#search)."

  ## Options

    * `q`: The query contains one or more search keywords and qualifiers. Qualifiers allow you to limit your search to specific areas of GitHub. The REST API supports the same qualifiers as the web interface for GitHub. To learn more about the format of the query, see [Constructing a search query](https://docs.github.com/rest/search/search#constructing-a-search-query). See "[Searching users](https://docs.github.com/search-github/searching-on-github/searching-users)" for a detailed list of qualifiers.
    * `sort`: Sorts the results of your query by number of `followers` or `repositories`, or when the person `joined` GitHub. Default: [best match](https://docs.github.com/rest/search/search#ranking-search-results)
    * `order`: Determines whether the first search result returned is the highest number of matches (`desc`) or lowest number of matches (`asc`). This parameter is ignored unless you provide `sort`.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/search/search#search-users)

  """
  @spec users(keyword) :: {:ok, map} | {:error, GitHub.Error.t()}
  def users(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:order, :page, :per_page, :q, :sort])

    client.request(%{
      args: [],
      call: {GitHub.Search, :users},
      url: "/search/users",
      method: :get,
      query: query,
      response: [
        {200, {GitHub.Search, :users_200_json_resp}},
        {304, :null},
        {422, {GitHub.ValidationError, :t}},
        {503, {GitHub.ServiceUnavailable, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:code_200_json_resp) do
    [
      incomplete_results: :boolean,
      items: [{GitHub.CodeSearchResultItem, :t}],
      total_count: :integer
    ]
  end

  def __fields__(:commits_200_json_resp) do
    [
      incomplete_results: :boolean,
      items: [{GitHub.Commit.SearchResultItem, :t}],
      total_count: :integer
    ]
  end

  def __fields__(:issues_and_pull_requests_200_json_resp) do
    [
      incomplete_results: :boolean,
      items: [{GitHub.Issue.SearchResultItem, :t}],
      total_count: :integer
    ]
  end

  def __fields__(:labels_200_json_resp) do
    [
      incomplete_results: :boolean,
      items: [{GitHub.LabelSearchResultItem, :t}],
      total_count: :integer
    ]
  end

  def __fields__(:repos_200_json_resp) do
    [
      incomplete_results: :boolean,
      items: [{GitHub.RepoSearchResultItem, :t}],
      total_count: :integer
    ]
  end

  def __fields__(:topics_200_json_resp) do
    [
      incomplete_results: :boolean,
      items: [{GitHub.TopicSearchResultItem, :t}],
      total_count: :integer
    ]
  end

  def __fields__(:users_200_json_resp) do
    [
      incomplete_results: :boolean,
      items: [{GitHub.User.SearchResultItem, :t}],
      total_count: :integer
    ]
  end
end
