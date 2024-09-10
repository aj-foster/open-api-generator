defmodule GitHub.Reactions do
  @moduledoc """
  Provides API endpoints related to reactions
  """

  @default_client GitHub.Client

  @doc """
  Create reaction for a commit comment

  Create a reaction to a [commit comment](https://docs.github.com/rest/commits/comments#get-a-commit-comment). A response with an HTTP `200` status means that you already added the reaction type to this commit comment.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/reactions/reactions#create-reaction-for-a-commit-comment)

  """
  @spec create_for_commit_comment(String.t(), String.t(), integer, map, keyword) ::
          {:ok, GitHub.Reaction.t()} | {:error, GitHub.Error.t()}
  def create_for_commit_comment(owner, repo, comment_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, comment_id: comment_id, body: body],
      call: {GitHub.Reactions, :create_for_commit_comment},
      url: "/repos/#{owner}/#{repo}/comments/#{comment_id}/reactions",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, {GitHub.Reaction, :t}},
        {201, {GitHub.Reaction, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create reaction for an issue

  Create a reaction to an [issue](https://docs.github.com/rest/issues/issues#get-an-issue). A response with an HTTP `200` status means that you already added the reaction type to this issue.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/reactions/reactions#create-reaction-for-an-issue)

  """
  @spec create_for_issue(String.t(), String.t(), integer, map, keyword) ::
          {:ok, GitHub.Reaction.t()} | {:error, GitHub.Error.t()}
  def create_for_issue(owner, repo, issue_number, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, issue_number: issue_number, body: body],
      call: {GitHub.Reactions, :create_for_issue},
      url: "/repos/#{owner}/#{repo}/issues/#{issue_number}/reactions",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, {GitHub.Reaction, :t}},
        {201, {GitHub.Reaction, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create reaction for an issue comment

  Create a reaction to an [issue comment](https://docs.github.com/rest/issues/comments#get-an-issue-comment). A response with an HTTP `200` status means that you already added the reaction type to this issue comment.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/reactions/reactions#create-reaction-for-an-issue-comment)

  """
  @spec create_for_issue_comment(String.t(), String.t(), integer, map, keyword) ::
          {:ok, GitHub.Reaction.t()} | {:error, GitHub.Error.t()}
  def create_for_issue_comment(owner, repo, comment_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, comment_id: comment_id, body: body],
      call: {GitHub.Reactions, :create_for_issue_comment},
      url: "/repos/#{owner}/#{repo}/issues/comments/#{comment_id}/reactions",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, {GitHub.Reaction, :t}},
        {201, {GitHub.Reaction, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create reaction for a pull request review comment

  Create a reaction to a [pull request review comment](https://docs.github.com/rest/pulls/comments#get-a-review-comment-for-a-pull-request). A response with an HTTP `200` status means that you already added the reaction type to this pull request review comment.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/reactions/reactions#create-reaction-for-a-pull-request-review-comment)

  """
  @spec create_for_pull_request_review_comment(String.t(), String.t(), integer, map, keyword) ::
          {:ok, GitHub.Reaction.t()} | {:error, GitHub.Error.t()}
  def create_for_pull_request_review_comment(owner, repo, comment_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, comment_id: comment_id, body: body],
      call: {GitHub.Reactions, :create_for_pull_request_review_comment},
      url: "/repos/#{owner}/#{repo}/pulls/comments/#{comment_id}/reactions",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, {GitHub.Reaction, :t}},
        {201, {GitHub.Reaction, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create reaction for a release

  Create a reaction to a [release](https://docs.github.com/rest/releases/releases#get-a-release). A response with a `Status: 200 OK` means that you already added the reaction type to this release.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/reactions/reactions#create-reaction-for-a-release)

  """
  @spec create_for_release(String.t(), String.t(), integer, map, keyword) ::
          {:ok, GitHub.Reaction.t()} | {:error, GitHub.Error.t()}
  def create_for_release(owner, repo, release_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, release_id: release_id, body: body],
      call: {GitHub.Reactions, :create_for_release},
      url: "/repos/#{owner}/#{repo}/releases/#{release_id}/reactions",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, {GitHub.Reaction, :t}},
        {201, {GitHub.Reaction, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create reaction for a team discussion comment

  Create a reaction to a [team discussion comment](https://docs.github.com/rest/teams/discussion-comments#get-a-discussion-comment).

  A response with an HTTP `200` status means that you already added the reaction type to this team discussion comment.

  **Note:** You can also specify a team by `org_id` and `team_id` using the route `POST /organizations/:org_id/team/:team_id/discussions/:discussion_number/comments/:comment_number/reactions`.

  OAuth app tokens and personal access tokens (classic) need the `write:discussion` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/reactions/reactions#create-reaction-for-a-team-discussion-comment)

  """
  @spec create_for_team_discussion_comment_in_org(
          String.t(),
          String.t(),
          integer,
          integer,
          map,
          keyword
        ) :: {:ok, GitHub.Reaction.t()} | {:error, GitHub.Error.t()}
  def create_for_team_discussion_comment_in_org(
        org,
        team_slug,
        discussion_number,
        comment_number,
        body,
        opts \\ []
      ) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [
        org: org,
        team_slug: team_slug,
        discussion_number: discussion_number,
        comment_number: comment_number,
        body: body
      ],
      call: {GitHub.Reactions, :create_for_team_discussion_comment_in_org},
      url:
        "/orgs/#{org}/teams/#{team_slug}/discussions/#{discussion_number}/comments/#{comment_number}/reactions",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{200, {GitHub.Reaction, :t}}, {201, {GitHub.Reaction, :t}}],
      opts: opts
    })
  end

  @doc """
  Create reaction for a team discussion comment (Legacy)

  **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the new "[Create reaction for a team discussion comment](https://docs.github.com/rest/reactions/reactions#create-reaction-for-a-team-discussion-comment)" endpoint.

  Create a reaction to a [team discussion comment](https://docs.github.com/rest/teams/discussion-comments#get-a-discussion-comment).

  A response with an HTTP `200` status means that you already added the reaction type to this team discussion comment.

  OAuth app tokens and personal access tokens (classic) need the `write:discussion` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/reactions/reactions#create-reaction-for-a-team-discussion-comment-legacy)

  """
  @spec create_for_team_discussion_comment_legacy(integer, integer, integer, map, keyword) ::
          {:ok, GitHub.Reaction.t()} | {:error, GitHub.Error.t()}
  def create_for_team_discussion_comment_legacy(
        team_id,
        discussion_number,
        comment_number,
        body,
        opts \\ []
      ) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [
        team_id: team_id,
        discussion_number: discussion_number,
        comment_number: comment_number,
        body: body
      ],
      call: {GitHub.Reactions, :create_for_team_discussion_comment_legacy},
      url:
        "/teams/#{team_id}/discussions/#{discussion_number}/comments/#{comment_number}/reactions",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{201, {GitHub.Reaction, :t}}],
      opts: opts
    })
  end

  @doc """
  Create reaction for a team discussion

  Create a reaction to a [team discussion](https://docs.github.com/rest/teams/discussions#get-a-discussion).

  A response with an HTTP `200` status means that you already added the reaction type to this team discussion.

  **Note:** You can also specify a team by `org_id` and `team_id` using the route `POST /organizations/:org_id/team/:team_id/discussions/:discussion_number/reactions`.

  OAuth app tokens and personal access tokens (classic) need the `write:discussion` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/reactions/reactions#create-reaction-for-a-team-discussion)

  """
  @spec create_for_team_discussion_in_org(String.t(), String.t(), integer, map, keyword) ::
          {:ok, GitHub.Reaction.t()} | {:error, GitHub.Error.t()}
  def create_for_team_discussion_in_org(org, team_slug, discussion_number, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, team_slug: team_slug, discussion_number: discussion_number, body: body],
      call: {GitHub.Reactions, :create_for_team_discussion_in_org},
      url: "/orgs/#{org}/teams/#{team_slug}/discussions/#{discussion_number}/reactions",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{200, {GitHub.Reaction, :t}}, {201, {GitHub.Reaction, :t}}],
      opts: opts
    })
  end

  @doc """
  Create reaction for a team discussion (Legacy)

  **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the new [`Create reaction for a team discussion`](https://docs.github.com/rest/reactions/reactions#create-reaction-for-a-team-discussion) endpoint.

  Create a reaction to a [team discussion](https://docs.github.com/rest/teams/discussions#get-a-discussion).

  A response with an HTTP `200` status means that you already added the reaction type to this team discussion.

  OAuth app tokens and personal access tokens (classic) need the `write:discussion` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/reactions/reactions#create-reaction-for-a-team-discussion-legacy)

  """
  @spec create_for_team_discussion_legacy(integer, integer, map, keyword) ::
          {:ok, GitHub.Reaction.t()} | {:error, GitHub.Error.t()}
  def create_for_team_discussion_legacy(team_id, discussion_number, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [team_id: team_id, discussion_number: discussion_number, body: body],
      call: {GitHub.Reactions, :create_for_team_discussion_legacy},
      url: "/teams/#{team_id}/discussions/#{discussion_number}/reactions",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{201, {GitHub.Reaction, :t}}],
      opts: opts
    })
  end

  @doc """
  Delete a commit comment reaction

  **Note:** You can also specify a repository by `repository_id` using the route `DELETE /repositories/:repository_id/comments/:comment_id/reactions/:reaction_id`.

  Delete a reaction to a [commit comment](https://docs.github.com/rest/commits/comments#get-a-commit-comment).

  ## Resources

    * [API method documentation](https://docs.github.com/rest/reactions/reactions#delete-a-commit-comment-reaction)

  """
  @spec delete_for_commit_comment(String.t(), String.t(), integer, integer, keyword) ::
          :ok | {:error, GitHub.Error.t()}
  def delete_for_commit_comment(owner, repo, comment_id, reaction_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, comment_id: comment_id, reaction_id: reaction_id],
      call: {GitHub.Reactions, :delete_for_commit_comment},
      url: "/repos/#{owner}/#{repo}/comments/#{comment_id}/reactions/#{reaction_id}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Delete an issue reaction

  **Note:** You can also specify a repository by `repository_id` using the route `DELETE /repositories/:repository_id/issues/:issue_number/reactions/:reaction_id`.

  Delete a reaction to an [issue](https://docs.github.com/rest/issues/issues#get-an-issue).

  ## Resources

    * [API method documentation](https://docs.github.com/rest/reactions/reactions#delete-an-issue-reaction)

  """
  @spec delete_for_issue(String.t(), String.t(), integer, integer, keyword) ::
          :ok | {:error, GitHub.Error.t()}
  def delete_for_issue(owner, repo, issue_number, reaction_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, issue_number: issue_number, reaction_id: reaction_id],
      call: {GitHub.Reactions, :delete_for_issue},
      url: "/repos/#{owner}/#{repo}/issues/#{issue_number}/reactions/#{reaction_id}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Delete an issue comment reaction

  **Note:** You can also specify a repository by `repository_id` using the route `DELETE delete /repositories/:repository_id/issues/comments/:comment_id/reactions/:reaction_id`.

  Delete a reaction to an [issue comment](https://docs.github.com/rest/issues/comments#get-an-issue-comment).

  ## Resources

    * [API method documentation](https://docs.github.com/rest/reactions/reactions#delete-an-issue-comment-reaction)

  """
  @spec delete_for_issue_comment(String.t(), String.t(), integer, integer, keyword) ::
          :ok | {:error, GitHub.Error.t()}
  def delete_for_issue_comment(owner, repo, comment_id, reaction_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, comment_id: comment_id, reaction_id: reaction_id],
      call: {GitHub.Reactions, :delete_for_issue_comment},
      url: "/repos/#{owner}/#{repo}/issues/comments/#{comment_id}/reactions/#{reaction_id}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Delete a pull request comment reaction

  **Note:** You can also specify a repository by `repository_id` using the route `DELETE /repositories/:repository_id/pulls/comments/:comment_id/reactions/:reaction_id.`

  Delete a reaction to a [pull request review comment](https://docs.github.com/rest/pulls/comments#get-a-review-comment-for-a-pull-request).

  ## Resources

    * [API method documentation](https://docs.github.com/rest/reactions/reactions#delete-a-pull-request-comment-reaction)

  """
  @spec delete_for_pull_request_comment(String.t(), String.t(), integer, integer, keyword) ::
          :ok | {:error, GitHub.Error.t()}
  def delete_for_pull_request_comment(owner, repo, comment_id, reaction_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, comment_id: comment_id, reaction_id: reaction_id],
      call: {GitHub.Reactions, :delete_for_pull_request_comment},
      url: "/repos/#{owner}/#{repo}/pulls/comments/#{comment_id}/reactions/#{reaction_id}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Delete a release reaction

  **Note:** You can also specify a repository by `repository_id` using the route `DELETE delete /repositories/:repository_id/releases/:release_id/reactions/:reaction_id`.

  Delete a reaction to a [release](https://docs.github.com/rest/releases/releases#get-a-release).

  ## Resources

    * [API method documentation](https://docs.github.com/rest/reactions/reactions#delete-a-release-reaction)

  """
  @spec delete_for_release(String.t(), String.t(), integer, integer, keyword) ::
          :ok | {:error, GitHub.Error.t()}
  def delete_for_release(owner, repo, release_id, reaction_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, release_id: release_id, reaction_id: reaction_id],
      call: {GitHub.Reactions, :delete_for_release},
      url: "/repos/#{owner}/#{repo}/releases/#{release_id}/reactions/#{reaction_id}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Delete team discussion reaction

  **Note:** You can also specify a team or organization with `team_id` and `org_id` using the route `DELETE /organizations/:org_id/team/:team_id/discussions/:discussion_number/reactions/:reaction_id`.

  Delete a reaction to a [team discussion](https://docs.github.com/rest/teams/discussions#get-a-discussion).

  OAuth app tokens and personal access tokens (classic) need the `write:discussion` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/reactions/reactions#delete-team-discussion-reaction)

  """
  @spec delete_for_team_discussion(String.t(), String.t(), integer, integer, keyword) ::
          :ok | {:error, GitHub.Error.t()}
  def delete_for_team_discussion(org, team_slug, discussion_number, reaction_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [
        org: org,
        team_slug: team_slug,
        discussion_number: discussion_number,
        reaction_id: reaction_id
      ],
      call: {GitHub.Reactions, :delete_for_team_discussion},
      url:
        "/orgs/#{org}/teams/#{team_slug}/discussions/#{discussion_number}/reactions/#{reaction_id}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Delete team discussion comment reaction

  **Note:** You can also specify a team or organization with `team_id` and `org_id` using the route `DELETE /organizations/:org_id/team/:team_id/discussions/:discussion_number/comments/:comment_number/reactions/:reaction_id`.

  Delete a reaction to a [team discussion comment](https://docs.github.com/rest/teams/discussion-comments#get-a-discussion-comment).

  OAuth app tokens and personal access tokens (classic) need the `write:discussion` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/reactions/reactions#delete-team-discussion-comment-reaction)

  """
  @spec delete_for_team_discussion_comment(
          String.t(),
          String.t(),
          integer,
          integer,
          integer,
          keyword
        ) :: :ok | {:error, GitHub.Error.t()}
  def delete_for_team_discussion_comment(
        org,
        team_slug,
        discussion_number,
        comment_number,
        reaction_id,
        opts \\ []
      ) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [
        org: org,
        team_slug: team_slug,
        discussion_number: discussion_number,
        comment_number: comment_number,
        reaction_id: reaction_id
      ],
      call: {GitHub.Reactions, :delete_for_team_discussion_comment},
      url:
        "/orgs/#{org}/teams/#{team_slug}/discussions/#{discussion_number}/comments/#{comment_number}/reactions/#{reaction_id}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  List reactions for a commit comment

  List the reactions to a [commit comment](https://docs.github.com/rest/commits/comments#get-a-commit-comment).

  ## Options

    * `content`: Returns a single [reaction type](https://docs.github.com/rest/reactions/reactions#about-reactions). Omit this parameter to list all reactions to a commit comment.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/reactions/reactions#list-reactions-for-a-commit-comment)

  """
  @spec list_for_commit_comment(String.t(), String.t(), integer, keyword) ::
          {:ok, [GitHub.Reaction.t()]} | {:error, GitHub.Error.t()}
  def list_for_commit_comment(owner, repo, comment_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:content, :page, :per_page])

    client.request(%{
      args: [owner: owner, repo: repo, comment_id: comment_id],
      call: {GitHub.Reactions, :list_for_commit_comment},
      url: "/repos/#{owner}/#{repo}/comments/#{comment_id}/reactions",
      method: :get,
      query: query,
      response: [{200, [{GitHub.Reaction, :t}]}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  List reactions for an issue

  List the reactions to an [issue](https://docs.github.com/rest/issues/issues#get-an-issue).

  ## Options

    * `content`: Returns a single [reaction type](https://docs.github.com/rest/reactions/reactions#about-reactions). Omit this parameter to list all reactions to an issue.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/reactions/reactions#list-reactions-for-an-issue)

  """
  @spec list_for_issue(String.t(), String.t(), integer, keyword) ::
          {:ok, [GitHub.Reaction.t()]} | {:error, GitHub.Error.t()}
  def list_for_issue(owner, repo, issue_number, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:content, :page, :per_page])

    client.request(%{
      args: [owner: owner, repo: repo, issue_number: issue_number],
      call: {GitHub.Reactions, :list_for_issue},
      url: "/repos/#{owner}/#{repo}/issues/#{issue_number}/reactions",
      method: :get,
      query: query,
      response: [
        {200, [{GitHub.Reaction, :t}]},
        {404, {GitHub.BasicError, :t}},
        {410, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List reactions for an issue comment

  List the reactions to an [issue comment](https://docs.github.com/rest/issues/comments#get-an-issue-comment).

  ## Options

    * `content`: Returns a single [reaction type](https://docs.github.com/rest/reactions/reactions#about-reactions). Omit this parameter to list all reactions to an issue comment.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/reactions/reactions#list-reactions-for-an-issue-comment)

  """
  @spec list_for_issue_comment(String.t(), String.t(), integer, keyword) ::
          {:ok, [GitHub.Reaction.t()]} | {:error, GitHub.Error.t()}
  def list_for_issue_comment(owner, repo, comment_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:content, :page, :per_page])

    client.request(%{
      args: [owner: owner, repo: repo, comment_id: comment_id],
      call: {GitHub.Reactions, :list_for_issue_comment},
      url: "/repos/#{owner}/#{repo}/issues/comments/#{comment_id}/reactions",
      method: :get,
      query: query,
      response: [{200, [{GitHub.Reaction, :t}]}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  List reactions for a pull request review comment

  List the reactions to a [pull request review comment](https://docs.github.com/rest/pulls/comments#get-a-review-comment-for-a-pull-request).

  ## Options

    * `content`: Returns a single [reaction type](https://docs.github.com/rest/reactions/reactions#about-reactions). Omit this parameter to list all reactions to a pull request review comment.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/reactions/reactions#list-reactions-for-a-pull-request-review-comment)

  """
  @spec list_for_pull_request_review_comment(String.t(), String.t(), integer, keyword) ::
          {:ok, [GitHub.Reaction.t()]} | {:error, GitHub.Error.t()}
  def list_for_pull_request_review_comment(owner, repo, comment_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:content, :page, :per_page])

    client.request(%{
      args: [owner: owner, repo: repo, comment_id: comment_id],
      call: {GitHub.Reactions, :list_for_pull_request_review_comment},
      url: "/repos/#{owner}/#{repo}/pulls/comments/#{comment_id}/reactions",
      method: :get,
      query: query,
      response: [{200, [{GitHub.Reaction, :t}]}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  List reactions for a release

  List the reactions to a [release](https://docs.github.com/rest/releases/releases#get-a-release).

  ## Options

    * `content`: Returns a single [reaction type](https://docs.github.com/rest/reactions/reactions#about-reactions). Omit this parameter to list all reactions to a release.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/reactions/reactions#list-reactions-for-a-release)

  """
  @spec list_for_release(String.t(), String.t(), integer, keyword) ::
          {:ok, [GitHub.Reaction.t()]} | {:error, GitHub.Error.t()}
  def list_for_release(owner, repo, release_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:content, :page, :per_page])

    client.request(%{
      args: [owner: owner, repo: repo, release_id: release_id],
      call: {GitHub.Reactions, :list_for_release},
      url: "/repos/#{owner}/#{repo}/releases/#{release_id}/reactions",
      method: :get,
      query: query,
      response: [{200, [{GitHub.Reaction, :t}]}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  List reactions for a team discussion comment

  List the reactions to a [team discussion comment](https://docs.github.com/rest/teams/discussion-comments#get-a-discussion-comment).

  **Note:** You can also specify a team by `org_id` and `team_id` using the route `GET /organizations/:org_id/team/:team_id/discussions/:discussion_number/comments/:comment_number/reactions`.

  OAuth app tokens and personal access tokens (classic) need the `read:discussion` scope to use this endpoint.

  ## Options

    * `content`: Returns a single [reaction type](https://docs.github.com/rest/reactions/reactions#about-reactions). Omit this parameter to list all reactions to a team discussion comment.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/reactions/reactions#list-reactions-for-a-team-discussion-comment)

  """
  @spec list_for_team_discussion_comment_in_org(String.t(), String.t(), integer, integer, keyword) ::
          {:ok, [GitHub.Reaction.t()]} | {:error, GitHub.Error.t()}
  def list_for_team_discussion_comment_in_org(
        org,
        team_slug,
        discussion_number,
        comment_number,
        opts \\ []
      ) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:content, :page, :per_page])

    client.request(%{
      args: [
        org: org,
        team_slug: team_slug,
        discussion_number: discussion_number,
        comment_number: comment_number
      ],
      call: {GitHub.Reactions, :list_for_team_discussion_comment_in_org},
      url:
        "/orgs/#{org}/teams/#{team_slug}/discussions/#{discussion_number}/comments/#{comment_number}/reactions",
      method: :get,
      query: query,
      response: [{200, [{GitHub.Reaction, :t}]}],
      opts: opts
    })
  end

  @doc """
  List reactions for a team discussion comment (Legacy)

  **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the new [`List reactions for a team discussion comment`](https://docs.github.com/rest/reactions/reactions#list-reactions-for-a-team-discussion-comment) endpoint.

  List the reactions to a [team discussion comment](https://docs.github.com/rest/teams/discussion-comments#get-a-discussion-comment).

  OAuth app tokens and personal access tokens (classic) need the `read:discussion` scope to use this endpoint.

  ## Options

    * `content`: Returns a single [reaction type](https://docs.github.com/rest/reactions/reactions#about-reactions). Omit this parameter to list all reactions to a team discussion comment.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/reactions/reactions#list-reactions-for-a-team-discussion-comment-legacy)

  """
  @spec list_for_team_discussion_comment_legacy(integer, integer, integer, keyword) ::
          {:ok, [GitHub.Reaction.t()]} | {:error, GitHub.Error.t()}
  def list_for_team_discussion_comment_legacy(
        team_id,
        discussion_number,
        comment_number,
        opts \\ []
      ) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:content, :page, :per_page])

    client.request(%{
      args: [
        team_id: team_id,
        discussion_number: discussion_number,
        comment_number: comment_number
      ],
      call: {GitHub.Reactions, :list_for_team_discussion_comment_legacy},
      url:
        "/teams/#{team_id}/discussions/#{discussion_number}/comments/#{comment_number}/reactions",
      method: :get,
      query: query,
      response: [{200, [{GitHub.Reaction, :t}]}],
      opts: opts
    })
  end

  @doc """
  List reactions for a team discussion

  List the reactions to a [team discussion](https://docs.github.com/rest/teams/discussions#get-a-discussion).

  **Note:** You can also specify a team by `org_id` and `team_id` using the route `GET /organizations/:org_id/team/:team_id/discussions/:discussion_number/reactions`.

  OAuth app tokens and personal access tokens (classic) need the `read:discussion` scope to use this endpoint.

  ## Options

    * `content`: Returns a single [reaction type](https://docs.github.com/rest/reactions/reactions#about-reactions). Omit this parameter to list all reactions to a team discussion.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/reactions/reactions#list-reactions-for-a-team-discussion)

  """
  @spec list_for_team_discussion_in_org(String.t(), String.t(), integer, keyword) ::
          {:ok, [GitHub.Reaction.t()]} | {:error, GitHub.Error.t()}
  def list_for_team_discussion_in_org(org, team_slug, discussion_number, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:content, :page, :per_page])

    client.request(%{
      args: [org: org, team_slug: team_slug, discussion_number: discussion_number],
      call: {GitHub.Reactions, :list_for_team_discussion_in_org},
      url: "/orgs/#{org}/teams/#{team_slug}/discussions/#{discussion_number}/reactions",
      method: :get,
      query: query,
      response: [{200, [{GitHub.Reaction, :t}]}],
      opts: opts
    })
  end

  @doc """
  List reactions for a team discussion (Legacy)

  **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the new [`List reactions for a team discussion`](https://docs.github.com/rest/reactions/reactions#list-reactions-for-a-team-discussion) endpoint.

  List the reactions to a [team discussion](https://docs.github.com/rest/teams/discussions#get-a-discussion).

  OAuth app tokens and personal access tokens (classic) need the `read:discussion` scope to use this endpoint.

  ## Options

    * `content`: Returns a single [reaction type](https://docs.github.com/rest/reactions/reactions#about-reactions). Omit this parameter to list all reactions to a team discussion.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/reactions/reactions#list-reactions-for-a-team-discussion-legacy)

  """
  @spec list_for_team_discussion_legacy(integer, integer, keyword) ::
          {:ok, [GitHub.Reaction.t()]} | {:error, GitHub.Error.t()}
  def list_for_team_discussion_legacy(team_id, discussion_number, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:content, :page, :per_page])

    client.request(%{
      args: [team_id: team_id, discussion_number: discussion_number],
      call: {GitHub.Reactions, :list_for_team_discussion_legacy},
      url: "/teams/#{team_id}/discussions/#{discussion_number}/reactions",
      method: :get,
      query: query,
      response: [{200, [{GitHub.Reaction, :t}]}],
      opts: opts
    })
  end
end
