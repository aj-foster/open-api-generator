defmodule GitHub.Issues do
  @moduledoc """
  Provides API endpoints related to issues
  """

  @default_client GitHub.Client

  @doc """
  Add assignees to an issue

  Adds up to 10 assignees to an issue. Users already assigned to an issue are not replaced.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/assignees#add-assignees-to-an-issue)

  """
  @spec add_assignees(String.t(), String.t(), integer, map, keyword) ::
          {:ok, GitHub.Issue.t()} | {:error, GitHub.Error.t()}
  def add_assignees(owner, repo, issue_number, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, issue_number: issue_number, body: body],
      call: {GitHub.Issues, :add_assignees},
      url: "/repos/#{owner}/#{repo}/issues/#{issue_number}/assignees",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{201, {GitHub.Issue, :t}}],
      opts: opts
    })
  end

  @doc """
  Add labels to an issue

  Adds labels to an issue. If you provide an empty array of labels, all labels are removed from the issue. 

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/labels#add-labels-to-an-issue)

  """
  @spec add_labels(
          String.t(),
          String.t(),
          integer,
          map | String.t() | [map] | [String.t()],
          keyword
        ) :: {:ok, [GitHub.Label.t()]} | {:error, GitHub.Error.t()}
  def add_labels(owner, repo, issue_number, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, issue_number: issue_number, body: body],
      call: {GitHub.Issues, :add_labels},
      url: "/repos/#{owner}/#{repo}/issues/#{issue_number}/labels",
      body: body,
      method: :post,
      request: [
        {"application/json", {:union, [:map, {:string, :generic}, [:map], [string: :generic]]}}
      ],
      response: [
        {200, [{GitHub.Label, :t}]},
        {301, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {410, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Check if a user can be assigned

  Checks if a user has permission to be assigned to an issue in this repository.

  If the `assignee` can be assigned to issues in the repository, a `204` header with no content is returned.

  Otherwise a `404` status code is returned.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/assignees#check-if-a-user-can-be-assigned)

  """
  @spec check_user_can_be_assigned(String.t(), String.t(), String.t(), keyword) ::
          :ok | {:error, GitHub.Error.t()}
  def check_user_can_be_assigned(owner, repo, assignee, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, assignee: assignee],
      call: {GitHub.Issues, :check_user_can_be_assigned},
      url: "/repos/#{owner}/#{repo}/assignees/#{assignee}",
      method: :get,
      response: [{204, :null}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  Check if a user can be assigned to a issue

  Checks if a user has permission to be assigned to a specific issue.

  If the `assignee` can be assigned to this issue, a `204` status code with no content is returned.

  Otherwise a `404` status code is returned.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/assignees#check-if-a-user-can-be-assigned-to-a-issue)

  """
  @spec check_user_can_be_assigned_to_issue(String.t(), String.t(), integer, String.t(), keyword) ::
          :ok | {:error, GitHub.Error.t()}
  def check_user_can_be_assigned_to_issue(owner, repo, issue_number, assignee, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, issue_number: issue_number, assignee: assignee],
      call: {GitHub.Issues, :check_user_can_be_assigned_to_issue},
      url: "/repos/#{owner}/#{repo}/issues/#{issue_number}/assignees/#{assignee}",
      method: :get,
      response: [{204, :null}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  Create an issue

  Any user with pull access to a repository can create an issue. If [issues are disabled in the repository](https://docs.github.com/articles/disabling-issues/), the API returns a `410 Gone` status.

  This endpoint triggers [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications). Creating content too quickly using this endpoint may result in secondary rate limiting. For more information, see "[Rate limits for the API](https://docs.github.com/rest/overview/rate-limits-for-the-rest-api#about-secondary-rate-limits)"
  and "[Best practices for using the REST API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
  - **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
  - **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
  - **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/issues#create-an-issue)

  """
  @spec create(String.t(), String.t(), map, keyword) ::
          {:ok, GitHub.Issue.t()} | {:error, GitHub.Error.t()}
  def create(owner, repo, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, body: body],
      call: {GitHub.Issues, :create},
      url: "/repos/#{owner}/#{repo}/issues",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {GitHub.Issue, :t}},
        {400, {:union, [{GitHub.BasicError, :t}, {GitHub.SCIM.Error, :t}]}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {410, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}},
        {503, {GitHub.ServiceUnavailable, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Create an issue comment

  You can use the REST API to create comments on issues and pull requests. Every pull request is an issue, but not every issue is a pull request.

  This endpoint triggers [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications).
  Creating content too quickly using this endpoint may result in secondary rate limiting.
  For more information, see "[Rate limits for the API](https://docs.github.com/rest/overview/rate-limits-for-the-rest-api#about-secondary-rate-limits)"
  and "[Best practices for using the REST API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
  - **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
  - **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
  - **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/comments#create-an-issue-comment)

  """
  @spec create_comment(String.t(), String.t(), integer, map, keyword) ::
          {:ok, GitHub.Issue.Comment.t()} | {:error, GitHub.Error.t()}
  def create_comment(owner, repo, issue_number, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, issue_number: issue_number, body: body],
      call: {GitHub.Issues, :create_comment},
      url: "/repos/#{owner}/#{repo}/issues/#{issue_number}/comments",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {GitHub.Issue.Comment, :t}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {410, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create a label

  Creates a label for the specified repository with the given name and color. The name and color parameters are required. The color must be a valid [hexadecimal color code](http://www.color-hex.com/).

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/labels#create-a-label)

  """
  @spec create_label(String.t(), String.t(), map, keyword) ::
          {:ok, GitHub.Label.t()} | {:error, GitHub.Error.t()}
  def create_label(owner, repo, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, body: body],
      call: {GitHub.Issues, :create_label},
      url: "/repos/#{owner}/#{repo}/labels",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {GitHub.Label, :t}},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create a milestone

  Creates a milestone.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/milestones#create-a-milestone)

  """
  @spec create_milestone(String.t(), String.t(), map, keyword) ::
          {:ok, GitHub.Milestone.t()} | {:error, GitHub.Error.t()}
  def create_milestone(owner, repo, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, body: body],
      call: {GitHub.Issues, :create_milestone},
      url: "/repos/#{owner}/#{repo}/milestones",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {GitHub.Milestone, :t}},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete an issue comment

  You can use the REST API to delete comments on issues and pull requests. Every pull request is an issue, but not every issue is a pull request.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/comments#delete-an-issue-comment)

  """
  @spec delete_comment(String.t(), String.t(), integer, keyword) ::
          :ok | {:error, GitHub.Error.t()}
  def delete_comment(owner, repo, comment_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, comment_id: comment_id],
      call: {GitHub.Issues, :delete_comment},
      url: "/repos/#{owner}/#{repo}/issues/comments/#{comment_id}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Delete a label

  Deletes a label using the given label name.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/labels#delete-a-label)

  """
  @spec delete_label(String.t(), String.t(), String.t(), keyword) ::
          :ok | {:error, GitHub.Error.t()}
  def delete_label(owner, repo, name, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, name: name],
      call: {GitHub.Issues, :delete_label},
      url: "/repos/#{owner}/#{repo}/labels/#{name}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Delete a milestone

  Deletes a milestone using the given milestone number.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/milestones#delete-a-milestone)

  """
  @spec delete_milestone(String.t(), String.t(), integer, keyword) ::
          :ok | {:error, GitHub.Error.t()}
  def delete_milestone(owner, repo, milestone_number, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, milestone_number: milestone_number],
      call: {GitHub.Issues, :delete_milestone},
      url: "/repos/#{owner}/#{repo}/milestones/#{milestone_number}",
      method: :delete,
      response: [{204, :null}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get an issue

  The API returns a [`301 Moved Permanently` status](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api#follow-redirects) if the issue was
  [transferred](https://docs.github.com/articles/transferring-an-issue-to-another-repository/) to another repository. If
  the issue was transferred to or deleted from a repository where the authenticated user lacks read access, the API
  returns a `404 Not Found` status. If the issue was deleted from a repository where the authenticated user has read
  access, the API returns a `410 Gone` status. To receive webhook events for transferred and deleted issues, subscribe
  to the [`issues`](https://docs.github.com/webhooks/event-payloads/#issues) webhook.

  **Note**: GitHub's REST API considers every pull request an issue, but not every issue is a pull request. For this
  reason, "Issues" endpoints may return both issues and pull requests in the response. You can identify pull requests by
  the `pull_request` key. Be aware that the `id` of a pull request returned from "Issues" endpoints will be an _issue id_. To find out the pull
  request id, use the "[List pull requests](https://docs.github.com/rest/pulls/pulls#list-pull-requests)" endpoint.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
  - **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
  - **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
  - **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/issues#get-an-issue)

  """
  @spec get(String.t(), String.t(), integer, keyword) ::
          {:ok, GitHub.Issue.t()} | {:error, GitHub.Error.t()}
  def get(owner, repo, issue_number, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, issue_number: issue_number],
      call: {GitHub.Issues, :get},
      url: "/repos/#{owner}/#{repo}/issues/#{issue_number}",
      method: :get,
      response: [
        {200, {GitHub.Issue, :t}},
        {301, {GitHub.BasicError, :t}},
        {304, :null},
        {404, {GitHub.BasicError, :t}},
        {410, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get an issue comment

  You can use the REST API to get comments on issues and pull requests. Every pull request is an issue, but not every issue is a pull request.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
  - **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
  - **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
  - **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/comments#get-an-issue-comment)

  """
  @spec get_comment(String.t(), String.t(), integer, keyword) ::
          {:ok, GitHub.Issue.Comment.t()} | {:error, GitHub.Error.t()}
  def get_comment(owner, repo, comment_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, comment_id: comment_id],
      call: {GitHub.Issues, :get_comment},
      url: "/repos/#{owner}/#{repo}/issues/comments/#{comment_id}",
      method: :get,
      response: [{200, {GitHub.Issue.Comment, :t}}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get an issue event

  Gets a single event by the event id.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/events#get-an-issue-event)

  """
  @spec get_event(String.t(), String.t(), integer, keyword) ::
          {:ok, GitHub.Issue.Event.t()} | {:error, GitHub.Error.t()}
  def get_event(owner, repo, event_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, event_id: event_id],
      call: {GitHub.Issues, :get_event},
      url: "/repos/#{owner}/#{repo}/issues/events/#{event_id}",
      method: :get,
      response: [
        {200, {GitHub.Issue.Event, :t}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {410, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a label

  Gets a label using the given name.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/labels#get-a-label)

  """
  @spec get_label(String.t(), String.t(), String.t(), keyword) ::
          {:ok, GitHub.Label.t()} | {:error, GitHub.Error.t()}
  def get_label(owner, repo, name, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, name: name],
      call: {GitHub.Issues, :get_label},
      url: "/repos/#{owner}/#{repo}/labels/#{name}",
      method: :get,
      response: [{200, {GitHub.Label, :t}}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get a milestone

  Gets a milestone using the given milestone number.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/milestones#get-a-milestone)

  """
  @spec get_milestone(String.t(), String.t(), integer, keyword) ::
          {:ok, GitHub.Milestone.t()} | {:error, GitHub.Error.t()}
  def get_milestone(owner, repo, milestone_number, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, milestone_number: milestone_number],
      call: {GitHub.Issues, :get_milestone},
      url: "/repos/#{owner}/#{repo}/milestones/#{milestone_number}",
      method: :get,
      response: [{200, {GitHub.Milestone, :t}}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  List issues assigned to the authenticated user

  List issues assigned to the authenticated user across all visible repositories including owned repositories, member
  repositories, and organization repositories. You can use the `filter` query parameter to fetch issues that are not
  necessarily assigned to you.

  **Note**: GitHub's REST API considers every pull request an issue, but not every issue is a pull request. For this
  reason, "Issues" endpoints may return both issues and pull requests in the response. You can identify pull requests by
  the `pull_request` key. Be aware that the `id` of a pull request returned from "Issues" endpoints will be an _issue id_. To find out the pull
  request id, use the "[List pull requests](https://docs.github.com/rest/pulls/pulls#list-pull-requests)" endpoint.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
  - **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
  - **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
  - **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.

  ## Options

    * `filter`: Indicates which sorts of issues to return. `assigned` means issues assigned to you. `created` means issues created by you. `mentioned` means issues mentioning you. `subscribed` means issues you're subscribed to updates for. `all` or `repos` means all issues you can see, regardless of participation or creation.
    * `state`: Indicates the state of the issues to return.
    * `labels`: A list of comma separated label names. Example: `bug,ui,@high`
    * `sort`: What to sort results by.
    * `direction`: The direction to sort the results by.
    * `since`: Only show results that were last updated after the given time. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    * `collab`
    * `orgs`
    * `owned`
    * `pulls`
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/issues#list-issues-assigned-to-the-authenticated-user)

  """
  @spec list(keyword) :: {:ok, [GitHub.Issue.t()]} | {:error, GitHub.Error.t()}
  def list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :collab,
        :direction,
        :filter,
        :labels,
        :orgs,
        :owned,
        :page,
        :per_page,
        :pulls,
        :since,
        :sort,
        :state
      ])

    client.request(%{
      args: [],
      call: {GitHub.Issues, :list},
      url: "/issues",
      method: :get,
      query: query,
      response: [
        {200, [{GitHub.Issue, :t}]},
        {304, :null},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List assignees

  Lists the [available assignees](https://docs.github.com/articles/assigning-issues-and-pull-requests-to-other-github-users/) for issues in a repository.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/assignees#list-assignees)

  """
  @spec list_assignees(String.t(), String.t(), keyword) ::
          {:ok, [GitHub.User.simple()]} | {:error, GitHub.Error.t()}
  def list_assignees(owner, repo, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [owner: owner, repo: repo],
      call: {GitHub.Issues, :list_assignees},
      url: "/repos/#{owner}/#{repo}/assignees",
      method: :get,
      query: query,
      response: [{200, [{GitHub.User, :simple}]}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  List issue comments

  You can use the REST API to list comments on issues and pull requests. Every pull request is an issue, but not every issue is a pull request.

  Issue comments are ordered by ascending ID.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
  - **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
  - **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
  - **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.

  ## Options

    * `since`: Only show results that were last updated after the given time. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/comments#list-issue-comments)

  """
  @spec list_comments(String.t(), String.t(), integer, keyword) ::
          {:ok, [GitHub.Issue.Comment.t()]} | {:error, GitHub.Error.t()}
  def list_comments(owner, repo, issue_number, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page, :since])

    client.request(%{
      args: [owner: owner, repo: repo, issue_number: issue_number],
      call: {GitHub.Issues, :list_comments},
      url: "/repos/#{owner}/#{repo}/issues/#{issue_number}/comments",
      method: :get,
      query: query,
      response: [
        {200, [{GitHub.Issue.Comment, :t}]},
        {404, {GitHub.BasicError, :t}},
        {410, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List issue comments for a repository

  You can use the REST API to list comments on issues and pull requests for a repository. Every pull request is an issue, but not every issue is a pull request.

  By default, issue comments are ordered by ascending ID.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
  - **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
  - **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
  - **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.

  ## Options

    * `sort`: The property to sort the results by.
    * `direction`: Either `asc` or `desc`. Ignored without the `sort` parameter.
    * `since`: Only show results that were last updated after the given time. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/comments#list-issue-comments-for-a-repository)

  """
  @spec list_comments_for_repo(String.t(), String.t(), keyword) ::
          {:ok, [GitHub.Issue.Comment.t()]} | {:error, GitHub.Error.t()}
  def list_comments_for_repo(owner, repo, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:direction, :page, :per_page, :since, :sort])

    client.request(%{
      args: [owner: owner, repo: repo],
      call: {GitHub.Issues, :list_comments_for_repo},
      url: "/repos/#{owner}/#{repo}/issues/comments",
      method: :get,
      query: query,
      response: [
        {200, [{GitHub.Issue.Comment, :t}]},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List issue events

  Lists all events for an issue.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/events#list-issue-events)

  """
  @spec list_events(String.t(), String.t(), integer, keyword) ::
          {:ok,
           [
             GitHub.Issue.Event.AddedToProject.t()
             | GitHub.Issue.Event.Assigned.t()
             | GitHub.Issue.Event.ConvertedNoteToIssue.t()
             | GitHub.Issue.Event.Demilestoned.t()
             | GitHub.Issue.Event.Labeled.t()
             | GitHub.Issue.Event.Locked.t()
             | GitHub.Issue.Event.Milestoned.t()
             | GitHub.Issue.Event.MovedColumnInProject.t()
             | GitHub.Issue.Event.RemovedFromProject.t()
             | GitHub.Issue.Event.Renamed.t()
             | GitHub.Issue.Event.ReviewDismissed.t()
             | GitHub.Issue.Event.ReviewRequestRemoved.t()
             | GitHub.Issue.Event.ReviewRequested.t()
             | GitHub.Issue.Event.Unassigned.t()
             | GitHub.Issue.Event.Unlabeled.t()
           ]}
          | {:error, GitHub.Error.t()}
  def list_events(owner, repo, issue_number, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [owner: owner, repo: repo, issue_number: issue_number],
      call: {GitHub.Issues, :list_events},
      url: "/repos/#{owner}/#{repo}/issues/#{issue_number}/events",
      method: :get,
      query: query,
      response: [
        {200,
         [
           union: [
             {GitHub.Issue.Event.AddedToProject, :t},
             {GitHub.Issue.Event.Assigned, :t},
             {GitHub.Issue.Event.ConvertedNoteToIssue, :t},
             {GitHub.Issue.Event.Demilestoned, :t},
             {GitHub.Issue.Event.Labeled, :t},
             {GitHub.Issue.Event.Locked, :t},
             {GitHub.Issue.Event.Milestoned, :t},
             {GitHub.Issue.Event.MovedColumnInProject, :t},
             {GitHub.Issue.Event.RemovedFromProject, :t},
             {GitHub.Issue.Event.Renamed, :t},
             {GitHub.Issue.Event.ReviewDismissed, :t},
             {GitHub.Issue.Event.ReviewRequestRemoved, :t},
             {GitHub.Issue.Event.ReviewRequested, :t},
             {GitHub.Issue.Event.Unassigned, :t},
             {GitHub.Issue.Event.Unlabeled, :t}
           ]
         ]},
        {410, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List issue events for a repository

  Lists events for a repository.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/events#list-issue-events-for-a-repository)

  """
  @spec list_events_for_repo(String.t(), String.t(), keyword) ::
          {:ok, [GitHub.Issue.Event.t()]} | {:error, GitHub.Error.t()}
  def list_events_for_repo(owner, repo, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [owner: owner, repo: repo],
      call: {GitHub.Issues, :list_events_for_repo},
      url: "/repos/#{owner}/#{repo}/issues/events",
      method: :get,
      query: query,
      response: [{200, [{GitHub.Issue.Event, :t}]}, {422, {GitHub.ValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  List timeline events for an issue

  List all timeline events for an issue.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/timeline#list-timeline-events-for-an-issue)

  """
  @spec list_events_for_timeline(String.t(), String.t(), integer, keyword) ::
          {:ok,
           [
             GitHub.Issue.Event.AddedToProject.t()
             | GitHub.Issue.Event.ConvertedNoteToIssue.t()
             | GitHub.Issue.Event.Demilestoned.t()
             | GitHub.Issue.Event.Labeled.t()
             | GitHub.Issue.Event.Locked.t()
             | GitHub.Issue.Event.Milestoned.t()
             | GitHub.Issue.Event.MovedColumnInProject.t()
             | GitHub.Issue.Event.RemovedFromProject.t()
             | GitHub.Issue.Event.Renamed.t()
             | GitHub.Issue.Event.ReviewDismissed.t()
             | GitHub.Issue.Event.ReviewRequestRemoved.t()
             | GitHub.Issue.Event.ReviewRequested.t()
             | GitHub.Issue.Event.StateChange.t()
             | GitHub.Issue.Event.Unlabeled.t()
             | GitHub.Timeline.AssignedIssueEvent.t()
             | GitHub.Timeline.CommentEvent.t()
             | GitHub.Timeline.CommitCommentedEvent.t()
             | GitHub.Timeline.CommittedEvent.t()
             | GitHub.Timeline.CrossReferencedEvent.t()
             | GitHub.Timeline.LineCommentedEvent.t()
             | GitHub.Timeline.ReviewedEvent.t()
             | GitHub.Timeline.UnassignedIssueEvent.t()
           ]}
          | {:error, GitHub.Error.t()}
  def list_events_for_timeline(owner, repo, issue_number, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [owner: owner, repo: repo, issue_number: issue_number],
      call: {GitHub.Issues, :list_events_for_timeline},
      url: "/repos/#{owner}/#{repo}/issues/#{issue_number}/timeline",
      method: :get,
      query: query,
      response: [
        {200,
         [
           union: [
             {GitHub.Issue.Event.AddedToProject, :t},
             {GitHub.Issue.Event.ConvertedNoteToIssue, :t},
             {GitHub.Issue.Event.Demilestoned, :t},
             {GitHub.Issue.Event.Labeled, :t},
             {GitHub.Issue.Event.Locked, :t},
             {GitHub.Issue.Event.Milestoned, :t},
             {GitHub.Issue.Event.MovedColumnInProject, :t},
             {GitHub.Issue.Event.RemovedFromProject, :t},
             {GitHub.Issue.Event.Renamed, :t},
             {GitHub.Issue.Event.ReviewDismissed, :t},
             {GitHub.Issue.Event.ReviewRequestRemoved, :t},
             {GitHub.Issue.Event.ReviewRequested, :t},
             {GitHub.Issue.Event.StateChange, :t},
             {GitHub.Issue.Event.Unlabeled, :t},
             {GitHub.Timeline.AssignedIssueEvent, :t},
             {GitHub.Timeline.CommentEvent, :t},
             {GitHub.Timeline.CommitCommentedEvent, :t},
             {GitHub.Timeline.CommittedEvent, :t},
             {GitHub.Timeline.CrossReferencedEvent, :t},
             {GitHub.Timeline.LineCommentedEvent, :t},
             {GitHub.Timeline.ReviewedEvent, :t},
             {GitHub.Timeline.UnassignedIssueEvent, :t}
           ]
         ]},
        {404, {GitHub.BasicError, :t}},
        {410, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List user account issues assigned to the authenticated user

  List issues across owned and member repositories assigned to the authenticated user.

  **Note**: GitHub's REST API considers every pull request an issue, but not every issue is a pull request. For this
  reason, "Issues" endpoints may return both issues and pull requests in the response. You can identify pull requests by
  the `pull_request` key. Be aware that the `id` of a pull request returned from "Issues" endpoints will be an _issue id_. To find out the pull
  request id, use the "[List pull requests](https://docs.github.com/rest/pulls/pulls#list-pull-requests)" endpoint.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
  - **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
  - **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
  - **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.

  ## Options

    * `filter`: Indicates which sorts of issues to return. `assigned` means issues assigned to you. `created` means issues created by you. `mentioned` means issues mentioning you. `subscribed` means issues you're subscribed to updates for. `all` or `repos` means all issues you can see, regardless of participation or creation.
    * `state`: Indicates the state of the issues to return.
    * `labels`: A list of comma separated label names. Example: `bug,ui,@high`
    * `sort`: What to sort results by.
    * `direction`: The direction to sort the results by.
    * `since`: Only show results that were last updated after the given time. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/issues#list-user-account-issues-assigned-to-the-authenticated-user)

  """
  @spec list_for_authenticated_user(keyword) ::
          {:ok, [GitHub.Issue.t()]} | {:error, GitHub.Error.t()}
  def list_for_authenticated_user(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:direction, :filter, :labels, :page, :per_page, :since, :sort, :state])

    client.request(%{
      args: [],
      call: {GitHub.Issues, :list_for_authenticated_user},
      url: "/user/issues",
      method: :get,
      query: query,
      response: [{200, [{GitHub.Issue, :t}]}, {304, :null}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  List organization issues assigned to the authenticated user

  List issues in an organization assigned to the authenticated user.

  **Note**: GitHub's REST API considers every pull request an issue, but not every issue is a pull request. For this
  reason, "Issues" endpoints may return both issues and pull requests in the response. You can identify pull requests by
  the `pull_request` key. Be aware that the `id` of a pull request returned from "Issues" endpoints will be an _issue id_. To find out the pull
  request id, use the "[List pull requests](https://docs.github.com/rest/pulls/pulls#list-pull-requests)" endpoint.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
  - **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
  - **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
  - **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.

  ## Options

    * `filter`: Indicates which sorts of issues to return. `assigned` means issues assigned to you. `created` means issues created by you. `mentioned` means issues mentioning you. `subscribed` means issues you're subscribed to updates for. `all` or `repos` means all issues you can see, regardless of participation or creation.
    * `state`: Indicates the state of the issues to return.
    * `labels`: A list of comma separated label names. Example: `bug,ui,@high`
    * `sort`: What to sort results by.
    * `direction`: The direction to sort the results by.
    * `since`: Only show results that were last updated after the given time. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/issues#list-organization-issues-assigned-to-the-authenticated-user)

  """
  @spec list_for_org(String.t(), keyword) ::
          {:ok, [GitHub.Issue.t()]} | {:error, GitHub.Error.t()}
  def list_for_org(org, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:direction, :filter, :labels, :page, :per_page, :since, :sort, :state])

    client.request(%{
      args: [org: org],
      call: {GitHub.Issues, :list_for_org},
      url: "/orgs/#{org}/issues",
      method: :get,
      query: query,
      response: [{200, [{GitHub.Issue, :t}]}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  List repository issues

  List issues in a repository. Only open issues will be listed.

  **Note**: GitHub's REST API considers every pull request an issue, but not every issue is a pull request. For this
  reason, "Issues" endpoints may return both issues and pull requests in the response. You can identify pull requests by
  the `pull_request` key. Be aware that the `id` of a pull request returned from "Issues" endpoints will be an _issue id_. To find out the pull
  request id, use the "[List pull requests](https://docs.github.com/rest/pulls/pulls#list-pull-requests)" endpoint.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
  - **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
  - **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
  - **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.

  ## Options

    * `milestone`: If an `integer` is passed, it should refer to a milestone by its `number` field. If the string `*` is passed, issues with any milestone are accepted. If the string `none` is passed, issues without milestones are returned.
    * `state`: Indicates the state of the issues to return.
    * `assignee`: Can be the name of a user. Pass in `none` for issues with no assigned user, and `*` for issues assigned to any user.
    * `creator`: The user that created the issue.
    * `mentioned`: A user that's mentioned in the issue.
    * `labels`: A list of comma separated label names. Example: `bug,ui,@high`
    * `sort`: What to sort results by.
    * `direction`: The direction to sort the results by.
    * `since`: Only show results that were last updated after the given time. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/issues#list-repository-issues)

  """
  @spec list_for_repo(String.t(), String.t(), keyword) ::
          {:ok, [GitHub.Issue.t()]} | {:error, GitHub.Error.t()}
  def list_for_repo(owner, repo, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :assignee,
        :creator,
        :direction,
        :labels,
        :mentioned,
        :milestone,
        :page,
        :per_page,
        :since,
        :sort,
        :state
      ])

    client.request(%{
      args: [owner: owner, repo: repo],
      call: {GitHub.Issues, :list_for_repo},
      url: "/repos/#{owner}/#{repo}/issues",
      method: :get,
      query: query,
      response: [
        {200, [{GitHub.Issue, :t}]},
        {301, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List labels for issues in a milestone

  Lists labels for issues in a milestone.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/labels#list-labels-for-issues-in-a-milestone)

  """
  @spec list_labels_for_milestone(String.t(), String.t(), integer, keyword) ::
          {:ok, [GitHub.Label.t()]} | {:error, GitHub.Error.t()}
  def list_labels_for_milestone(owner, repo, milestone_number, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [owner: owner, repo: repo, milestone_number: milestone_number],
      call: {GitHub.Issues, :list_labels_for_milestone},
      url: "/repos/#{owner}/#{repo}/milestones/#{milestone_number}/labels",
      method: :get,
      query: query,
      response: [{200, [{GitHub.Label, :t}]}],
      opts: opts
    })
  end

  @doc """
  List labels for a repository

  Lists all labels for a repository.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/labels#list-labels-for-a-repository)

  """
  @spec list_labels_for_repo(String.t(), String.t(), keyword) ::
          {:ok, [GitHub.Label.t()]} | {:error, GitHub.Error.t()}
  def list_labels_for_repo(owner, repo, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [owner: owner, repo: repo],
      call: {GitHub.Issues, :list_labels_for_repo},
      url: "/repos/#{owner}/#{repo}/labels",
      method: :get,
      query: query,
      response: [{200, [{GitHub.Label, :t}]}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  List labels for an issue

  Lists all labels for an issue.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/labels#list-labels-for-an-issue)

  """
  @spec list_labels_on_issue(String.t(), String.t(), integer, keyword) ::
          {:ok, [GitHub.Label.t()]} | {:error, GitHub.Error.t()}
  def list_labels_on_issue(owner, repo, issue_number, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [owner: owner, repo: repo, issue_number: issue_number],
      call: {GitHub.Issues, :list_labels_on_issue},
      url: "/repos/#{owner}/#{repo}/issues/#{issue_number}/labels",
      method: :get,
      query: query,
      response: [
        {200, [{GitHub.Label, :t}]},
        {301, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {410, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List milestones

  Lists milestones for a repository.

  ## Options

    * `state`: The state of the milestone. Either `open`, `closed`, or `all`.
    * `sort`: What to sort results by. Either `due_on` or `completeness`.
    * `direction`: The direction of the sort. Either `asc` or `desc`.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/milestones#list-milestones)

  """
  @spec list_milestones(String.t(), String.t(), keyword) ::
          {:ok, [GitHub.Milestone.t()]} | {:error, GitHub.Error.t()}
  def list_milestones(owner, repo, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:direction, :page, :per_page, :sort, :state])

    client.request(%{
      args: [owner: owner, repo: repo],
      call: {GitHub.Issues, :list_milestones},
      url: "/repos/#{owner}/#{repo}/milestones",
      method: :get,
      query: query,
      response: [{200, [{GitHub.Milestone, :t}]}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  Lock an issue

  Users with push access can lock an issue or pull request's conversation.

  Note that, if you choose not to pass any parameters, you'll need to set `Content-Length` to zero when calling out to this endpoint. For more information, see "[HTTP method](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#http-method)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/issues#lock-an-issue)

  """
  @spec lock(String.t(), String.t(), integer, map | nil, keyword) ::
          :ok | {:error, GitHub.Error.t()}
  def lock(owner, repo, issue_number, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, issue_number: issue_number, body: body],
      call: {GitHub.Issues, :lock},
      url: "/repos/#{owner}/#{repo}/issues/#{issue_number}/lock",
      body: body,
      method: :put,
      request: [{"application/json", {:union, [:map, :null]}}],
      response: [
        {204, :null},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {410, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Remove all labels from an issue

  Removes all labels from an issue.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/labels#remove-all-labels-from-an-issue)

  """
  @spec remove_all_labels(String.t(), String.t(), integer, keyword) ::
          :ok | {:error, GitHub.Error.t()}
  def remove_all_labels(owner, repo, issue_number, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, issue_number: issue_number],
      call: {GitHub.Issues, :remove_all_labels},
      url: "/repos/#{owner}/#{repo}/issues/#{issue_number}/labels",
      method: :delete,
      response: [
        {204, :null},
        {301, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {410, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Remove assignees from an issue

  Removes one or more assignees from an issue.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/assignees#remove-assignees-from-an-issue)

  """
  @spec remove_assignees(String.t(), String.t(), integer, map, keyword) ::
          {:ok, GitHub.Issue.t()} | {:error, GitHub.Error.t()}
  def remove_assignees(owner, repo, issue_number, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, issue_number: issue_number, body: body],
      call: {GitHub.Issues, :remove_assignees},
      url: "/repos/#{owner}/#{repo}/issues/#{issue_number}/assignees",
      body: body,
      method: :delete,
      request: [{"application/json", :map}],
      response: [{200, {GitHub.Issue, :t}}],
      opts: opts
    })
  end

  @doc """
  Remove a label from an issue

  Removes the specified label from the issue, and returns the remaining labels on the issue. This endpoint returns a `404 Not Found` status if the label does not exist.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/labels#remove-a-label-from-an-issue)

  """
  @spec remove_label(String.t(), String.t(), integer, String.t(), keyword) ::
          {:ok, [GitHub.Label.t()]} | {:error, GitHub.Error.t()}
  def remove_label(owner, repo, issue_number, name, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, issue_number: issue_number, name: name],
      call: {GitHub.Issues, :remove_label},
      url: "/repos/#{owner}/#{repo}/issues/#{issue_number}/labels/#{name}",
      method: :delete,
      response: [
        {200, [{GitHub.Label, :t}]},
        {301, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {410, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Set labels for an issue

  Removes any previous labels and sets the new labels for an issue.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/labels#set-labels-for-an-issue)

  """
  @spec set_labels(
          String.t(),
          String.t(),
          integer,
          map | String.t() | [map] | [String.t()],
          keyword
        ) :: {:ok, [GitHub.Label.t()]} | {:error, GitHub.Error.t()}
  def set_labels(owner, repo, issue_number, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, issue_number: issue_number, body: body],
      call: {GitHub.Issues, :set_labels},
      url: "/repos/#{owner}/#{repo}/issues/#{issue_number}/labels",
      body: body,
      method: :put,
      request: [
        {"application/json", {:union, [:map, {:string, :generic}, [:map], [string: :generic]]}}
      ],
      response: [
        {200, [{GitHub.Label, :t}]},
        {301, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {410, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Unlock an issue

  Users with push access can unlock an issue's conversation.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/issues#unlock-an-issue)

  """
  @spec unlock(String.t(), String.t(), integer, keyword) :: :ok | {:error, GitHub.Error.t()}
  def unlock(owner, repo, issue_number, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, issue_number: issue_number],
      call: {GitHub.Issues, :unlock},
      url: "/repos/#{owner}/#{repo}/issues/#{issue_number}/lock",
      method: :delete,
      response: [{204, :null}, {403, {GitHub.BasicError, :t}}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  Update an issue

  Issue owners and users with push access can edit an issue.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
  - **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
  - **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
  - **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/issues#update-an-issue)

  """
  @spec update(String.t(), String.t(), integer, map, keyword) ::
          {:ok, GitHub.Issue.t()} | {:error, GitHub.Error.t()}
  def update(owner, repo, issue_number, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, issue_number: issue_number, body: body],
      call: {GitHub.Issues, :update},
      url: "/repos/#{owner}/#{repo}/issues/#{issue_number}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, {GitHub.Issue, :t}},
        {301, {GitHub.BasicError, :t}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {410, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}},
        {503, {GitHub.ServiceUnavailable, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Update an issue comment

  You can use the REST API to update comments on issues and pull requests. Every pull request is an issue, but not every issue is a pull request.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
  - **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
  - **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
  - **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/comments#update-an-issue-comment)

  """
  @spec update_comment(String.t(), String.t(), integer, map, keyword) ::
          {:ok, GitHub.Issue.Comment.t()} | {:error, GitHub.Error.t()}
  def update_comment(owner, repo, comment_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, comment_id: comment_id, body: body],
      call: {GitHub.Issues, :update_comment},
      url: "/repos/#{owner}/#{repo}/issues/comments/#{comment_id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{200, {GitHub.Issue.Comment, :t}}, {422, {GitHub.ValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Update a label

  Updates a label using the given label name.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/labels#update-a-label)

  """
  @spec update_label(String.t(), String.t(), String.t(), map, keyword) ::
          {:ok, GitHub.Label.t()} | {:error, GitHub.Error.t()}
  def update_label(owner, repo, name, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, name: name, body: body],
      call: {GitHub.Issues, :update_label},
      url: "/repos/#{owner}/#{repo}/labels/#{name}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{200, {GitHub.Label, :t}}],
      opts: opts
    })
  end

  @doc """
  Update a milestone

  ## Resources

    * [API method documentation](https://docs.github.com/rest/issues/milestones#update-a-milestone)

  """
  @spec update_milestone(String.t(), String.t(), integer, map, keyword) ::
          {:ok, GitHub.Milestone.t()} | {:error, GitHub.Error.t()}
  def update_milestone(owner, repo, milestone_number, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, milestone_number: milestone_number, body: body],
      call: {GitHub.Issues, :update_milestone},
      url: "/repos/#{owner}/#{repo}/milestones/#{milestone_number}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{200, {GitHub.Milestone, :t}}],
      opts: opts
    })
  end
end
