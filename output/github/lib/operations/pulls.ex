defmodule GitHub.Pulls do
  @moduledoc """
  Provides API endpoints related to pulls
  """

  @default_client GitHub.Client

  @doc """
  Check if a pull request has been merged

  Checks if a pull request has been merged into the base branch. The HTTP status of the response indicates whether or not the pull request has been merged; the response body is empty.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/pulls/pulls#check-if-a-pull-request-has-been-merged)

  """
  @spec check_if_merged(String.t(), String.t(), integer, keyword) ::
          :ok | {:error, GitHub.Error.t()}
  def check_if_merged(owner, repo, pull_number, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, pull_number: pull_number],
      call: {GitHub.Pulls, :check_if_merged},
      url: "/repos/#{owner}/#{repo}/pulls/#{pull_number}/merge",
      method: :get,
      response: [{204, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Create a pull request

  Draft pull requests are available in public repositories with GitHub Free and GitHub Free for organizations, GitHub Pro, and legacy per-repository billing plans, and in public and private repositories with GitHub Team and GitHub Enterprise Cloud. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.

  To open or update a pull request in a public repository, you must have write access to the head or the source branch. For organization-owned repositories, you must be a member of the organization that owns the repository to open or update a pull request.

  This endpoint triggers [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications). Creating content too quickly using this endpoint may result in secondary rate limiting. For more information, see "[Rate limits for the API](https://docs.github.com/rest/overview/rate-limits-for-the-rest-api#about-secondary-rate-limits)" and "[Best practices for using the REST API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
  - **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
  - **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
  - **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/pulls/pulls#create-a-pull-request)

  """
  @spec create(String.t(), String.t(), map, keyword) ::
          {:ok, GitHub.PullRequest.t()} | {:error, GitHub.Error.t()}
  def create(owner, repo, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, body: body],
      call: {GitHub.Pulls, :create},
      url: "/repos/#{owner}/#{repo}/pulls",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {GitHub.PullRequest, :t}},
        {403, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create a reply for a review comment

  Creates a reply to a review comment for a pull request. For the `comment_id`, provide the ID of the review comment you are replying to. This must be the ID of a _top-level review comment_, not a reply to that comment. Replies to replies are not supported.

  This endpoint triggers [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications). Creating content too quickly using this endpoint may result in secondary rate limiting. For more information, see "[Rate limits for the API](https://docs.github.com/rest/overview/rate-limits-for-the-rest-api#about-secondary-rate-limits)"
  and "[Best practices for using the REST API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github-commitcomment.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
  - **`application/vnd.github-commitcomment.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
  - **`application/vnd.github-commitcomment.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
  - **`application/vnd.github-commitcomment.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/pulls/comments#create-a-reply-for-a-review-comment)

  """
  @spec create_reply_for_review_comment(String.t(), String.t(), integer, integer, map, keyword) ::
          {:ok, GitHub.PullRequest.ReviewComment.t()} | {:error, GitHub.Error.t()}
  def create_reply_for_review_comment(owner, repo, pull_number, comment_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [
        owner: owner,
        repo: repo,
        pull_number: pull_number,
        comment_id: comment_id,
        body: body
      ],
      call: {GitHub.Pulls, :create_reply_for_review_comment},
      url: "/repos/#{owner}/#{repo}/pulls/#{pull_number}/comments/#{comment_id}/replies",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{201, {GitHub.PullRequest.ReviewComment, :t}}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  Create a review for a pull request

  Creates a review on a specified pull request.

  This endpoint triggers [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications). Creating content too quickly using this endpoint may result in secondary rate limiting. For more information, see "[Rate limits for the API](https://docs.github.com/rest/overview/rate-limits-for-the-rest-api#about-secondary-rate-limits)" and "[Best practices for using the REST API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."

  Pull request reviews created in the `PENDING` state are not submitted and therefore do not include the `submitted_at` property in the response. To create a pending review for a pull request, leave the `event` parameter blank. For more information about submitting a `PENDING` review, see "[Submit a review for a pull request](https://docs.github.com/rest/pulls/reviews#submit-a-review-for-a-pull-request)."

  **Note:** To comment on a specific line in a file, you need to first determine the position of that line in the diff. To see a pull request diff, add the `application/vnd.github.v3.diff` media type to the `Accept` header of a call to the [Get a pull request](https://docs.github.com/rest/pulls/pulls#get-a-pull-request) endpoint.

  The `position` value equals the number of lines down from the first "@@" hunk header in the file you want to add a comment. The line just below the "@@" line is position 1, the next line is position 2, and so on. The position in the diff continues to increase through lines of whitespace and additional hunks until the beginning of a new file.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github-commitcomment.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
  - **`application/vnd.github-commitcomment.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
  - **`application/vnd.github-commitcomment.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
  - **`application/vnd.github-commitcomment.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/pulls/reviews#create-a-review-for-a-pull-request)

  """
  @spec create_review(String.t(), String.t(), integer, map, keyword) ::
          {:ok, GitHub.PullRequest.Review.t()} | {:error, GitHub.Error.t()}
  def create_review(owner, repo, pull_number, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, pull_number: pull_number, body: body],
      call: {GitHub.Pulls, :create_review},
      url: "/repos/#{owner}/#{repo}/pulls/#{pull_number}/reviews",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, {GitHub.PullRequest.Review, :t}},
        {403, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :simple}}
      ],
      opts: opts
    })
  end

  @doc """
  Create a review comment for a pull request

  Creates a review comment on the diff of a specified pull request. To add a regular comment to a pull request timeline, see "[Create an issue comment](https://docs.github.com/rest/issues/comments#create-an-issue-comment)."

  If your comment applies to more than one line in the pull request diff, you should use the parameters `line`, `side`, and optionally `start_line` and `start_side` in your request.

  The `position` parameter is deprecated. If you use `position`, the `line`, `side`, `start_line`, and `start_side` parameters are not required.

  This endpoint triggers [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications). Creating content too quickly using this endpoint may result in secondary rate limiting. For more information, see "[Rate limits for the API](https://docs.github.com/rest/overview/rate-limits-for-the-rest-api#about-secondary-rate-limits)"
  and "[Best practices for using the REST API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github-commitcomment.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
  - **`application/vnd.github-commitcomment.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
  - **`application/vnd.github-commitcomment.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
  - **`application/vnd.github-commitcomment.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/pulls/comments#create-a-review-comment-for-a-pull-request)

  """
  @spec create_review_comment(String.t(), String.t(), integer, map, keyword) ::
          {:ok, GitHub.PullRequest.ReviewComment.t()} | {:error, GitHub.Error.t()}
  def create_review_comment(owner, repo, pull_number, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, pull_number: pull_number, body: body],
      call: {GitHub.Pulls, :create_review_comment},
      url: "/repos/#{owner}/#{repo}/pulls/#{pull_number}/comments",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {GitHub.PullRequest.ReviewComment, :t}},
        {403, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a pending review for a pull request

  Deletes a pull request review that has not been submitted. Submitted reviews cannot be deleted.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github-commitcomment.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
  - **`application/vnd.github-commitcomment.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
  - **`application/vnd.github-commitcomment.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
  - **`application/vnd.github-commitcomment.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/pulls/reviews#delete-a-pending-review-for-a-pull-request)

  """
  @spec delete_pending_review(String.t(), String.t(), integer, integer, keyword) ::
          {:ok, GitHub.PullRequest.Review.t()} | {:error, GitHub.Error.t()}
  def delete_pending_review(owner, repo, pull_number, review_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, pull_number: pull_number, review_id: review_id],
      call: {GitHub.Pulls, :delete_pending_review},
      url: "/repos/#{owner}/#{repo}/pulls/#{pull_number}/reviews/#{review_id}",
      method: :delete,
      response: [
        {200, {GitHub.PullRequest.Review, :t}},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :simple}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a review comment for a pull request

  Deletes a review comment.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/pulls/comments#delete-a-review-comment-for-a-pull-request)

  """
  @spec delete_review_comment(String.t(), String.t(), integer, keyword) ::
          :ok | {:error, GitHub.Error.t()}
  def delete_review_comment(owner, repo, comment_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, comment_id: comment_id],
      call: {GitHub.Pulls, :delete_review_comment},
      url: "/repos/#{owner}/#{repo}/pulls/comments/#{comment_id}",
      method: :delete,
      response: [{204, :null}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  Dismiss a review for a pull request

  Dismisses a specified review on a pull request.

  **Note:** To dismiss a pull request review on a [protected branch](https://docs.github.com/rest/branches/branch-protection),
  you must be a repository administrator or be included in the list of people or teams
  who can dismiss pull request reviews.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github-commitcomment.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
  - **`application/vnd.github-commitcomment.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
  - **`application/vnd.github-commitcomment.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
  - **`application/vnd.github-commitcomment.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/pulls/reviews#dismiss-a-review-for-a-pull-request)

  """
  @spec dismiss_review(String.t(), String.t(), integer, integer, map, keyword) ::
          {:ok, GitHub.PullRequest.Review.t()} | {:error, GitHub.Error.t()}
  def dismiss_review(owner, repo, pull_number, review_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, pull_number: pull_number, review_id: review_id, body: body],
      call: {GitHub.Pulls, :dismiss_review},
      url: "/repos/#{owner}/#{repo}/pulls/#{pull_number}/reviews/#{review_id}/dismissals",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [
        {200, {GitHub.PullRequest.Review, :t}},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :simple}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a pull request

  Draft pull requests are available in public repositories with GitHub Free and GitHub Free for organizations, GitHub Pro, and legacy per-repository billing plans, and in public and private repositories with GitHub Team and GitHub Enterprise Cloud. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.

  Lists details of a pull request by providing its number.

  When you get, [create](https://docs.github.com/rest/pulls/pulls/#create-a-pull-request), or [edit](https://docs.github.com/rest/pulls/pulls#update-a-pull-request) a pull request, GitHub creates a merge commit to test whether the pull request can be automatically merged into the base branch. This test commit is not added to the base branch or the head branch. You can review the status of the test commit using the `mergeable` key. For more information, see "[Checking mergeability of pull requests](https://docs.github.com/rest/guides/getting-started-with-the-git-database-api#checking-mergeability-of-pull-requests)".

  The value of the `mergeable` attribute can be `true`, `false`, or `null`. If the value is `null`, then GitHub has started a background job to compute the mergeability. After giving the job time to complete, resubmit the request. When the job finishes, you will see a non-`null` value for the `mergeable` attribute in the response. If `mergeable` is `true`, then `merge_commit_sha` will be the SHA of the _test_ merge commit.

  The value of the `merge_commit_sha` attribute changes depending on the state of the pull request. Before merging a pull request, the `merge_commit_sha` attribute holds the SHA of the _test_ merge commit. After merging a pull request, the `merge_commit_sha` attribute changes depending on how you merged the pull request:

  *   If merged as a [merge commit](https://docs.github.com/articles/about-merge-methods-on-github/), `merge_commit_sha` represents the SHA of the merge commit.
  *   If merged via a [squash](https://docs.github.com/articles/about-merge-methods-on-github/#squashing-your-merge-commits), `merge_commit_sha` represents the SHA of the squashed commit on the base branch.
  *   If [rebased](https://docs.github.com/articles/about-merge-methods-on-github/#rebasing-and-merging-your-commits), `merge_commit_sha` represents the commit that the base branch was updated to.

  Pass the appropriate [media type](https://docs.github.com/rest/overview/media-types/#commits-commit-comparison-and-pull-requests) to fetch diff and patch formats.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
  - **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
  - **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
  - **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.
  - **`application/vnd.github.diff`**: For more information, see "[git-diff](https://git-scm.com/docs/git-diff)" in the Git documentation. If a diff is corrupt, contact us through the [GitHub Support portal](https://support.github.com/). Include the repository name and pull request ID in your message.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/pulls/pulls#get-a-pull-request)

  """
  @spec get(String.t(), String.t(), integer, keyword) ::
          {:ok, GitHub.PullRequest.t()} | {:error, GitHub.Error.t()}
  def get(owner, repo, pull_number, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, pull_number: pull_number],
      call: {GitHub.Pulls, :get},
      url: "/repos/#{owner}/#{repo}/pulls/#{pull_number}",
      method: :get,
      response: [
        {200, {GitHub.PullRequest, :t}},
        {304, :null},
        {404, {GitHub.BasicError, :t}},
        {406, {GitHub.BasicError, :t}},
        {500, {GitHub.BasicError, :t}},
        {503, {GitHub.ServiceUnavailable, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a review for a pull request

  Retrieves a pull request review by its ID.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github-commitcomment.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
  - **`application/vnd.github-commitcomment.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
  - **`application/vnd.github-commitcomment.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
  - **`application/vnd.github-commitcomment.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/pulls/reviews#get-a-review-for-a-pull-request)

  """
  @spec get_review(String.t(), String.t(), integer, integer, keyword) ::
          {:ok, GitHub.PullRequest.Review.t()} | {:error, GitHub.Error.t()}
  def get_review(owner, repo, pull_number, review_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, pull_number: pull_number, review_id: review_id],
      call: {GitHub.Pulls, :get_review},
      url: "/repos/#{owner}/#{repo}/pulls/#{pull_number}/reviews/#{review_id}",
      method: :get,
      response: [{200, {GitHub.PullRequest.Review, :t}}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get a review comment for a pull request

  Provides details for a specified review comment.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github-commitcomment.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
  - **`application/vnd.github-commitcomment.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
  - **`application/vnd.github-commitcomment.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
  - **`application/vnd.github-commitcomment.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/pulls/comments#get-a-review-comment-for-a-pull-request)

  """
  @spec get_review_comment(String.t(), String.t(), integer, keyword) ::
          {:ok, GitHub.PullRequest.ReviewComment.t()} | {:error, GitHub.Error.t()}
  def get_review_comment(owner, repo, comment_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, comment_id: comment_id],
      call: {GitHub.Pulls, :get_review_comment},
      url: "/repos/#{owner}/#{repo}/pulls/comments/#{comment_id}",
      method: :get,
      response: [{200, {GitHub.PullRequest.ReviewComment, :t}}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  List pull requests

  Lists pull requests in a specified repository.

  Draft pull requests are available in public repositories with GitHub
  Free and GitHub Free for organizations, GitHub Pro, and legacy per-repository billing
  plans, and in public and private repositories with GitHub Team and GitHub Enterprise
  Cloud. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  in the GitHub Help documentation.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
  - **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
  - **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
  - **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.

  ## Options

    * `state`: Either `open`, `closed`, or `all` to filter by state.
    * `head`: Filter pulls by head user or head organization and branch name in the format of `user:ref-name` or `organization:ref-name`. For example: `github:new-script-format` or `octocat:test-branch`.
    * `base`: Filter pulls by base branch name. Example: `gh-pages`.
    * `sort`: What to sort results by. `popularity` will sort by the number of comments. `long-running` will sort by date created and will limit the results to pull requests that have been open for more than a month and have had activity within the past month.
    * `direction`: The direction of the sort. Default: `desc` when sort is `created` or sort is not specified, otherwise `asc`.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/pulls/pulls#list-pull-requests)

  """
  @spec list(String.t(), String.t(), keyword) ::
          {:ok, [GitHub.PullRequest.simple()]} | {:error, GitHub.Error.t()}
  def list(owner, repo, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:base, :direction, :head, :page, :per_page, :sort, :state])

    client.request(%{
      args: [owner: owner, repo: repo],
      call: {GitHub.Pulls, :list},
      url: "/repos/#{owner}/#{repo}/pulls",
      method: :get,
      query: query,
      response: [
        {200, [{GitHub.PullRequest, :simple}]},
        {304, :null},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List comments for a pull request review

  Lists comments for a specific pull request review.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github-commitcomment.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
  - **`application/vnd.github-commitcomment.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
  - **`application/vnd.github-commitcomment.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
  - **`application/vnd.github-commitcomment.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/pulls/reviews#list-comments-for-a-pull-request-review)

  """
  @spec list_comments_for_review(String.t(), String.t(), integer, integer, keyword) ::
          {:ok, [GitHub.ReviewComment.t()]} | {:error, GitHub.Error.t()}
  def list_comments_for_review(owner, repo, pull_number, review_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [owner: owner, repo: repo, pull_number: pull_number, review_id: review_id],
      call: {GitHub.Pulls, :list_comments_for_review},
      url: "/repos/#{owner}/#{repo}/pulls/#{pull_number}/reviews/#{review_id}/comments",
      method: :get,
      query: query,
      response: [{200, [{GitHub.ReviewComment, :t}]}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  List commits on a pull request

  Lists a maximum of 250 commits for a pull request. To receive a complete
  commit list for pull requests with more than 250 commits, use the [List commits](https://docs.github.com/rest/commits/commits#list-commits)
  endpoint.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
  - **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
  - **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
  - **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/pulls/pulls#list-commits-on-a-pull-request)

  """
  @spec list_commits(String.t(), String.t(), integer, keyword) ::
          {:ok, [GitHub.Commit.t()]} | {:error, GitHub.Error.t()}
  def list_commits(owner, repo, pull_number, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [owner: owner, repo: repo, pull_number: pull_number],
      call: {GitHub.Pulls, :list_commits},
      url: "/repos/#{owner}/#{repo}/pulls/#{pull_number}/commits",
      method: :get,
      query: query,
      response: [{200, [{GitHub.Commit, :t}]}],
      opts: opts
    })
  end

  @doc """
  List pull requests files

  Lists the files in a specified pull request.

  **Note:** Responses include a maximum of 3000 files. The paginated response
  returns 30 files per page by default.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
  - **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
  - **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
  - **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/pulls/pulls#list-pull-requests-files)

  """
  @spec list_files(String.t(), String.t(), integer, keyword) ::
          {:ok, [GitHub.DiffEntry.t()]} | {:error, GitHub.Error.t()}
  def list_files(owner, repo, pull_number, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [owner: owner, repo: repo, pull_number: pull_number],
      call: {GitHub.Pulls, :list_files},
      url: "/repos/#{owner}/#{repo}/pulls/#{pull_number}/files",
      method: :get,
      query: query,
      response: [
        {200, [{GitHub.DiffEntry, :t}]},
        {422, {GitHub.ValidationError, :t}},
        {500, {GitHub.BasicError, :t}},
        {503, {GitHub.ServiceUnavailable, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get all requested reviewers for a pull request

  Gets the users or teams whose review is requested for a pull request. Once a requested reviewer submits a review, they are no longer considered a requested reviewer. Their review will instead be returned by the [List reviews for a pull request](https://docs.github.com/rest/pulls/reviews#list-reviews-for-a-pull-request) operation.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/pulls/review-requests#get-all-requested-reviewers-for-a-pull-request)

  """
  @spec list_requested_reviewers(String.t(), String.t(), integer, keyword) ::
          {:ok, GitHub.PullRequest.ReviewRequest.t()} | {:error, GitHub.Error.t()}
  def list_requested_reviewers(owner, repo, pull_number, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, pull_number: pull_number],
      call: {GitHub.Pulls, :list_requested_reviewers},
      url: "/repos/#{owner}/#{repo}/pulls/#{pull_number}/requested_reviewers",
      method: :get,
      response: [{200, {GitHub.PullRequest.ReviewRequest, :t}}],
      opts: opts
    })
  end

  @doc """
  List review comments on a pull request

  Lists all review comments for a specified pull request. By default, review comments
  are in ascending order by ID.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github-commitcomment.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
  - **`application/vnd.github-commitcomment.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
  - **`application/vnd.github-commitcomment.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
  - **`application/vnd.github-commitcomment.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.

  ## Options

    * `sort`: The property to sort the results by.
    * `direction`: The direction to sort results. Ignored without `sort` parameter.
    * `since`: Only show results that were last updated after the given time. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/pulls/comments#list-review-comments-on-a-pull-request)

  """
  @spec list_review_comments(String.t(), String.t(), integer, keyword) ::
          {:ok, [GitHub.PullRequest.ReviewComment.t()]} | {:error, GitHub.Error.t()}
  def list_review_comments(owner, repo, pull_number, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:direction, :page, :per_page, :since, :sort])

    client.request(%{
      args: [owner: owner, repo: repo, pull_number: pull_number],
      call: {GitHub.Pulls, :list_review_comments},
      url: "/repos/#{owner}/#{repo}/pulls/#{pull_number}/comments",
      method: :get,
      query: query,
      response: [{200, [{GitHub.PullRequest.ReviewComment, :t}]}],
      opts: opts
    })
  end

  @doc """
  List review comments in a repository

  Lists review comments for all pull requests in a repository. By default,
  review comments are in ascending order by ID.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github-commitcomment.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
  - **`application/vnd.github-commitcomment.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
  - **`application/vnd.github-commitcomment.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
  - **`application/vnd.github-commitcomment.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.

  ## Options

    * `sort`
    * `direction`: The direction to sort results. Ignored without `sort` parameter.
    * `since`: Only show results that were last updated after the given time. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/pulls/comments#list-review-comments-in-a-repository)

  """
  @spec list_review_comments_for_repo(String.t(), String.t(), keyword) ::
          {:ok, [GitHub.PullRequest.ReviewComment.t()]} | {:error, GitHub.Error.t()}
  def list_review_comments_for_repo(owner, repo, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:direction, :page, :per_page, :since, :sort])

    client.request(%{
      args: [owner: owner, repo: repo],
      call: {GitHub.Pulls, :list_review_comments_for_repo},
      url: "/repos/#{owner}/#{repo}/pulls/comments",
      method: :get,
      query: query,
      response: [{200, [{GitHub.PullRequest.ReviewComment, :t}]}],
      opts: opts
    })
  end

  @doc """
  List reviews for a pull request

  Lists all reviews for a specified pull request. The list of reviews returns in chronological order.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github-commitcomment.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
  - **`application/vnd.github-commitcomment.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
  - **`application/vnd.github-commitcomment.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
  - **`application/vnd.github-commitcomment.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/pulls/reviews#list-reviews-for-a-pull-request)

  """
  @spec list_reviews(String.t(), String.t(), integer, keyword) ::
          {:ok, [GitHub.PullRequest.Review.t()]} | {:error, GitHub.Error.t()}
  def list_reviews(owner, repo, pull_number, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [owner: owner, repo: repo, pull_number: pull_number],
      call: {GitHub.Pulls, :list_reviews},
      url: "/repos/#{owner}/#{repo}/pulls/#{pull_number}/reviews",
      method: :get,
      query: query,
      response: [{200, [{GitHub.PullRequest.Review, :t}]}],
      opts: opts
    })
  end

  @type merge_405_json_resp :: %{
          __info__: map,
          documentation_url: String.t() | nil,
          message: String.t() | nil
        }

  @type merge_409_json_resp :: %{
          __info__: map,
          documentation_url: String.t() | nil,
          message: String.t() | nil
        }

  @doc """
  Merge a pull request

  Merges a pull request into the base branch.
  This endpoint triggers [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications). Creating content too quickly using this endpoint may result in secondary rate limiting. For more information, see "[Rate limits for the API](https://docs.github.com/rest/overview/rate-limits-for-the-rest-api#about-secondary-rate-limits)" and "[Best practices for using the REST API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/pulls/pulls#merge-a-pull-request)

  """
  @spec merge(String.t(), String.t(), integer, map | nil, keyword) ::
          {:ok, GitHub.PullRequest.MergeResult.t()} | {:error, GitHub.Error.t()}
  def merge(owner, repo, pull_number, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, pull_number: pull_number, body: body],
      call: {GitHub.Pulls, :merge},
      url: "/repos/#{owner}/#{repo}/pulls/#{pull_number}/merge",
      body: body,
      method: :put,
      request: [{"application/json", {:union, [:map, :null]}}],
      response: [
        {200, {GitHub.PullRequest.MergeResult, :t}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {405, {GitHub.Pulls, :merge_405_json_resp}},
        {409, {GitHub.Pulls, :merge_409_json_resp}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Remove requested reviewers from a pull request

  Removes review requests from a pull request for a given set of users and/or teams.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/pulls/review-requests#remove-requested-reviewers-from-a-pull-request)

  """
  @spec remove_requested_reviewers(String.t(), String.t(), integer, map, keyword) ::
          {:ok, GitHub.PullRequest.simple()} | {:error, GitHub.Error.t()}
  def remove_requested_reviewers(owner, repo, pull_number, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, pull_number: pull_number, body: body],
      call: {GitHub.Pulls, :remove_requested_reviewers},
      url: "/repos/#{owner}/#{repo}/pulls/#{pull_number}/requested_reviewers",
      body: body,
      method: :delete,
      request: [{"application/json", :map}],
      response: [{200, {GitHub.PullRequest, :simple}}, {422, {GitHub.ValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Request reviewers for a pull request

  Requests reviews for a pull request from a given set of users and/or teams.
  This endpoint triggers [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications). Creating content too quickly using this endpoint may result in secondary rate limiting. For more information, see "[Rate limits for the API](https://docs.github.com/rest/overview/rate-limits-for-the-rest-api#about-secondary-rate-limits)" and "[Best practices for using the REST API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/pulls/review-requests#request-reviewers-for-a-pull-request)

  """
  @spec request_reviewers(String.t(), String.t(), integer, map, keyword) ::
          {:ok, GitHub.PullRequest.simple()} | {:error, GitHub.Error.t()}
  def request_reviewers(owner, repo, pull_number, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, pull_number: pull_number, body: body],
      call: {GitHub.Pulls, :request_reviewers},
      url: "/repos/#{owner}/#{repo}/pulls/#{pull_number}/requested_reviewers",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {GitHub.PullRequest, :simple}},
        {403, {GitHub.BasicError, :t}},
        {422, :null}
      ],
      opts: opts
    })
  end

  @doc """
  Submit a review for a pull request

  Submits a pending review for a pull request. For more information about creating a pending review for a pull request, see "[Create a review for a pull request](https://docs.github.com/rest/pulls/reviews#create-a-review-for-a-pull-request)."

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github-commitcomment.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
  - **`application/vnd.github-commitcomment.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
  - **`application/vnd.github-commitcomment.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
  - **`application/vnd.github-commitcomment.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/pulls/reviews#submit-a-review-for-a-pull-request)

  """
  @spec submit_review(String.t(), String.t(), integer, integer, map, keyword) ::
          {:ok, GitHub.PullRequest.Review.t()} | {:error, GitHub.Error.t()}
  def submit_review(owner, repo, pull_number, review_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, pull_number: pull_number, review_id: review_id, body: body],
      call: {GitHub.Pulls, :submit_review},
      url: "/repos/#{owner}/#{repo}/pulls/#{pull_number}/reviews/#{review_id}/events",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, {GitHub.PullRequest.Review, :t}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :simple}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a pull request

  Draft pull requests are available in public repositories with GitHub Free and GitHub Free for organizations, GitHub Pro, and legacy per-repository billing plans, and in public and private repositories with GitHub Team and GitHub Enterprise Cloud. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.

  To open or update a pull request in a public repository, you must have write access to the head or the source branch. For organization-owned repositories, you must be a member of the organization that owns the repository to open or update a pull request.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
  - **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
  - **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
  - **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/pulls/pulls#update-a-pull-request)

  """
  @spec update(String.t(), String.t(), integer, map, keyword) ::
          {:ok, GitHub.PullRequest.t()} | {:error, GitHub.Error.t()}
  def update(owner, repo, pull_number, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, pull_number: pull_number, body: body],
      call: {GitHub.Pulls, :update},
      url: "/repos/#{owner}/#{repo}/pulls/#{pull_number}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, {GitHub.PullRequest, :t}},
        {403, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @type update_branch_202_json_resp :: %{
          __info__: map,
          message: String.t() | nil,
          url: String.t() | nil
        }

  @doc """
  Update a pull request branch

  Updates the pull request branch with the latest upstream changes by merging HEAD from the base branch into the pull request branch.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/pulls/pulls#update-a-pull-request-branch)

  """
  @spec update_branch(String.t(), String.t(), integer, map | nil, keyword) ::
          {:ok, map} | {:error, GitHub.Error.t()}
  def update_branch(owner, repo, pull_number, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, pull_number: pull_number, body: body],
      call: {GitHub.Pulls, :update_branch},
      url: "/repos/#{owner}/#{repo}/pulls/#{pull_number}/update-branch",
      body: body,
      method: :put,
      request: [{"application/json", {:union, [:map, :null]}}],
      response: [
        {202, {GitHub.Pulls, :update_branch_202_json_resp}},
        {403, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a review for a pull request

  Updates the contents of a specified review summary comment.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github-commitcomment.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
  - **`application/vnd.github-commitcomment.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
  - **`application/vnd.github-commitcomment.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
  - **`application/vnd.github-commitcomment.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/pulls/reviews#update-a-review-for-a-pull-request)

  """
  @spec update_review(String.t(), String.t(), integer, integer, map, keyword) ::
          {:ok, GitHub.PullRequest.Review.t()} | {:error, GitHub.Error.t()}
  def update_review(owner, repo, pull_number, review_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, pull_number: pull_number, review_id: review_id, body: body],
      call: {GitHub.Pulls, :update_review},
      url: "/repos/#{owner}/#{repo}/pulls/#{pull_number}/reviews/#{review_id}",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [{200, {GitHub.PullRequest.Review, :t}}, {422, {GitHub.ValidationError, :simple}}],
      opts: opts
    })
  end

  @doc """
  Update a review comment for a pull request

  Edits the content of a specified review comment.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github-commitcomment.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
  - **`application/vnd.github-commitcomment.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
  - **`application/vnd.github-commitcomment.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
  - **`application/vnd.github-commitcomment.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/pulls/comments#update-a-review-comment-for-a-pull-request)

  """
  @spec update_review_comment(String.t(), String.t(), integer, map, keyword) ::
          {:ok, GitHub.PullRequest.ReviewComment.t()} | {:error, GitHub.Error.t()}
  def update_review_comment(owner, repo, comment_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, comment_id: comment_id, body: body],
      call: {GitHub.Pulls, :update_review_comment},
      url: "/repos/#{owner}/#{repo}/pulls/comments/#{comment_id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{200, {GitHub.PullRequest.ReviewComment, :t}}],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:merge_405_json_resp) do
    [documentation_url: {:string, :generic}, message: {:string, :generic}]
  end

  def __fields__(:merge_409_json_resp) do
    [documentation_url: {:string, :generic}, message: {:string, :generic}]
  end

  def __fields__(:update_branch_202_json_resp) do
    [message: {:string, :generic}, url: {:string, :generic}]
  end
end
