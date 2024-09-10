defmodule GitHub.Teams do
  @moduledoc """
  Provides API endpoints related to teams
  """

  @default_client GitHub.Client

  @doc """
  Add team member (Legacy)

  The "Add team member" endpoint (described below) is deprecated.

  We recommend using the [Add or update team membership for a user](https://docs.github.com/rest/teams/members#add-or-update-team-membership-for-a-user) endpoint instead. It allows you to invite new organization members to your teams.

  Team synchronization is available for organizations using GitHub Enterprise Cloud. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.

  To add someone to a team, the authenticated user must be an organization owner or a team maintainer in the team they're changing. The person being added to the team must be a member of the team's organization.

  **Note:** When you have team synchronization set up for a team with your organization's identity provider (IdP), you will see an error if you attempt to use the API for making changes to the team's membership. If you have access to manage group membership in your IdP, you can manage GitHub team membership through your identity provider, which automatically adds and removes team members in an organization. For more information, see "[Synchronizing teams between your identity provider and GitHub](https://docs.github.com/articles/synchronizing-teams-between-your-identity-provider-and-github/)."

  Note that you'll need to set `Content-Length` to zero when calling out to this endpoint. For more information, see "[HTTP method](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#http-method)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/members#add-team-member-legacy)

  """
  @spec add_member_legacy(integer, String.t(), keyword) :: :ok | {:error, GitHub.Error.t()}
  def add_member_legacy(team_id, username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [team_id: team_id, username: username],
      call: {GitHub.Teams, :add_member_legacy},
      url: "/teams/#{team_id}/members/#{username}",
      method: :put,
      response: [{204, :null}, {403, {GitHub.BasicError, :t}}, {404, :null}, {422, :null}],
      opts: opts
    })
  end

  @doc """
  Add or update team membership for a user

  Adds an organization member to a team. An authenticated organization owner or team maintainer can add organization members to a team.

  Team synchronization is available for organizations using GitHub Enterprise Cloud. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.

  **Note:** When you have team synchronization set up for a team with your organization's identity provider (IdP), you will see an error if you attempt to use the API for making changes to the team's membership. If you have access to manage group membership in your IdP, you can manage GitHub team membership through your identity provider, which automatically adds and removes team members in an organization. For more information, see "[Synchronizing teams between your identity provider and GitHub](https://docs.github.com/articles/synchronizing-teams-between-your-identity-provider-and-github/)."

  An organization owner can add someone who is not part of the team's organization to a team. When an organization owner adds someone to a team who is not an organization member, this endpoint will send an invitation to the person via email. This newly-created membership will be in the "pending" state until the person accepts the invitation, at which point the membership will transition to the "active" state and the user will be added as a member of the team.

  If the user is already a member of the team, this endpoint will update the role of the team member's role. To update the membership of a team member, the authenticated user must be an organization owner or a team maintainer.

  **Note:** You can also specify a team by `org_id` and `team_id` using the route `PUT /organizations/{org_id}/team/{team_id}/memberships/{username}`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/members#add-or-update-team-membership-for-a-user)

  """
  @spec add_or_update_membership_for_user_in_org(String.t(), String.t(), String.t(), map, keyword) ::
          {:ok, GitHub.Team.Membership.t()} | {:error, GitHub.Error.t()}
  def add_or_update_membership_for_user_in_org(org, team_slug, username, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, team_slug: team_slug, username: username, body: body],
      call: {GitHub.Teams, :add_or_update_membership_for_user_in_org},
      url: "/orgs/#{org}/teams/#{team_slug}/memberships/#{username}",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [{200, {GitHub.Team.Membership, :t}}, {403, :null}, {422, :null}],
      opts: opts
    })
  end

  @doc """
  Add or update team membership for a user (Legacy)

  **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the new [Add or update team membership for a user](https://docs.github.com/rest/teams/members#add-or-update-team-membership-for-a-user) endpoint.

  Team synchronization is available for organizations using GitHub Enterprise Cloud. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.

  If the user is already a member of the team's organization, this endpoint will add the user to the team. To add a membership between an organization member and a team, the authenticated user must be an organization owner or a team maintainer.

  **Note:** When you have team synchronization set up for a team with your organization's identity provider (IdP), you will see an error if you attempt to use the API for making changes to the team's membership. If you have access to manage group membership in your IdP, you can manage GitHub team membership through your identity provider, which automatically adds and removes team members in an organization. For more information, see "[Synchronizing teams between your identity provider and GitHub](https://docs.github.com/articles/synchronizing-teams-between-your-identity-provider-and-github/)."

  If the user is unaffiliated with the team's organization, this endpoint will send an invitation to the user via email. This newly-created membership will be in the "pending" state until the user accepts the invitation, at which point the membership will transition to the "active" state and the user will be added as a member of the team. To add a membership between an unaffiliated user and a team, the authenticated user must be an organization owner.

  If the user is already a member of the team, this endpoint will update the role of the team member's role. To update the membership of a team member, the authenticated user must be an organization owner or a team maintainer.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/members#add-or-update-team-membership-for-a-user-legacy)

  """
  @spec add_or_update_membership_for_user_legacy(integer, String.t(), map, keyword) ::
          {:ok, GitHub.Team.Membership.t()} | {:error, GitHub.Error.t()}
  def add_or_update_membership_for_user_legacy(team_id, username, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [team_id: team_id, username: username, body: body],
      call: {GitHub.Teams, :add_or_update_membership_for_user_legacy},
      url: "/teams/#{team_id}/memberships/#{username}",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [
        {200, {GitHub.Team.Membership, :t}},
        {403, :null},
        {404, {GitHub.BasicError, :t}},
        {422, :null}
      ],
      opts: opts
    })
  end

  @type add_or_update_project_permissions_in_org_403_json_resp :: %{
          __info__: map,
          documentation_url: String.t() | nil,
          message: String.t() | nil
        }

  @doc """
  Add or update team project permissions

  Adds an organization project to a team. To add a project to a team or update the team's permission on a project, the authenticated user must have `admin` permissions for the project. The project and team must be part of the same organization.

  **Note:** You can also specify a team by `org_id` and `team_id` using the route `PUT /organizations/{org_id}/team/{team_id}/projects/{project_id}`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/teams#add-or-update-team-project-permissions)

  """
  @spec add_or_update_project_permissions_in_org(
          String.t(),
          String.t(),
          integer,
          map | nil,
          keyword
        ) :: :ok | {:error, GitHub.Error.t()}
  def add_or_update_project_permissions_in_org(org, team_slug, project_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, team_slug: team_slug, project_id: project_id, body: body],
      call: {GitHub.Teams, :add_or_update_project_permissions_in_org},
      url: "/orgs/#{org}/teams/#{team_slug}/projects/#{project_id}",
      body: body,
      method: :put,
      request: [{"application/json", {:union, [:map, :null]}}],
      response: [
        {204, :null},
        {403, {GitHub.Teams, :add_or_update_project_permissions_in_org_403_json_resp}}
      ],
      opts: opts
    })
  end

  @type add_or_update_project_permissions_legacy_403_json_resp :: %{
          __info__: map,
          documentation_url: String.t() | nil,
          message: String.t() | nil
        }

  @doc """
  Add or update team project permissions (Legacy)

  **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the new [Add or update team project permissions](https://docs.github.com/rest/teams/teams#add-or-update-team-project-permissions) endpoint.

  Adds an organization project to a team. To add a project to a team or update the team's permission on a project, the authenticated user must have `admin` permissions for the project. The project and team must be part of the same organization.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/teams#add-or-update-team-project-permissions-legacy)

  """
  @spec add_or_update_project_permissions_legacy(integer, integer, map, keyword) ::
          :ok | {:error, GitHub.Error.t()}
  def add_or_update_project_permissions_legacy(team_id, project_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [team_id: team_id, project_id: project_id, body: body],
      call: {GitHub.Teams, :add_or_update_project_permissions_legacy},
      url: "/teams/#{team_id}/projects/#{project_id}",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [
        {204, :null},
        {403, {GitHub.Teams, :add_or_update_project_permissions_legacy_403_json_resp}},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Add or update team repository permissions

  To add a repository to a team or update the team's permission on a repository, the authenticated user must have admin access to the repository, and must be able to see the team. The repository must be owned by the organization, or a direct fork of a repository owned by the organization. You will get a `422 Unprocessable Entity` status if you attempt to add a repository to a team that is not owned by the organization. Note that, if you choose not to pass any parameters, you'll need to set `Content-Length` to zero when calling out to this endpoint. For more information, see "[HTTP method](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#http-method)."

  **Note:** You can also specify a team by `org_id` and `team_id` using the route `PUT /organizations/{org_id}/team/{team_id}/repos/{owner}/{repo}`.

  For more information about the permission levels, see "[Repository permission levels for an organization](https://docs.github.com/github/setting-up-and-managing-organizations-and-teams/repository-permission-levels-for-an-organization#permission-levels-for-repositories-owned-by-an-organization)".

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/teams#add-or-update-team-repository-permissions)

  """
  @spec add_or_update_repo_permissions_in_org(
          String.t(),
          String.t(),
          String.t(),
          String.t(),
          map,
          keyword
        ) :: :ok | {:error, GitHub.Error.t()}
  def add_or_update_repo_permissions_in_org(org, team_slug, owner, repo, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, team_slug: team_slug, owner: owner, repo: repo, body: body],
      call: {GitHub.Teams, :add_or_update_repo_permissions_in_org},
      url: "/orgs/#{org}/teams/#{team_slug}/repos/#{owner}/#{repo}",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Add or update team repository permissions (Legacy)

  **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the new "[Add or update team repository permissions](https://docs.github.com/rest/teams/teams#add-or-update-team-repository-permissions)" endpoint.

  To add a repository to a team or update the team's permission on a repository, the authenticated user must have admin access to the repository, and must be able to see the team. The repository must be owned by the organization, or a direct fork of a repository owned by the organization. You will get a `422 Unprocessable Entity` status if you attempt to add a repository to a team that is not owned by the organization.

  Note that, if you choose not to pass any parameters, you'll need to set `Content-Length` to zero when calling out to this endpoint. For more information, see "[HTTP method](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#http-method)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/teams#add-or-update-team-repository-permissions-legacy)

  """
  @spec add_or_update_repo_permissions_legacy(integer, String.t(), String.t(), map, keyword) ::
          :ok | {:error, GitHub.Error.t()}
  def add_or_update_repo_permissions_legacy(team_id, owner, repo, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [team_id: team_id, owner: owner, repo: repo, body: body],
      call: {GitHub.Teams, :add_or_update_repo_permissions_legacy},
      url: "/teams/#{team_id}/repos/#{owner}/#{repo}",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [
        {204, :null},
        {403, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Check team permissions for a project

  Checks whether a team has `read`, `write`, or `admin` permissions for an organization project. The response includes projects inherited from a parent team.

  **Note:** You can also specify a team by `org_id` and `team_id` using the route `GET /organizations/{org_id}/team/{team_id}/projects/{project_id}`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/teams#check-team-permissions-for-a-project)

  """
  @spec check_permissions_for_project_in_org(String.t(), String.t(), integer, keyword) ::
          {:ok, GitHub.Team.Project.t()} | {:error, GitHub.Error.t()}
  def check_permissions_for_project_in_org(org, team_slug, project_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, team_slug: team_slug, project_id: project_id],
      call: {GitHub.Teams, :check_permissions_for_project_in_org},
      url: "/orgs/#{org}/teams/#{team_slug}/projects/#{project_id}",
      method: :get,
      response: [{200, {GitHub.Team.Project, :t}}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Check team permissions for a project (Legacy)

  **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the new [Check team permissions for a project](https://docs.github.com/rest/teams/teams#check-team-permissions-for-a-project) endpoint.

  Checks whether a team has `read`, `write`, or `admin` permissions for an organization project. The response includes projects inherited from a parent team.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/teams#check-team-permissions-for-a-project-legacy)

  """
  @spec check_permissions_for_project_legacy(integer, integer, keyword) ::
          {:ok, GitHub.Team.Project.t()} | {:error, GitHub.Error.t()}
  def check_permissions_for_project_legacy(team_id, project_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [team_id: team_id, project_id: project_id],
      call: {GitHub.Teams, :check_permissions_for_project_legacy},
      url: "/teams/#{team_id}/projects/#{project_id}",
      method: :get,
      response: [{200, {GitHub.Team.Project, :t}}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Check team permissions for a repository

  Checks whether a team has `admin`, `push`, `maintain`, `triage`, or `pull` permission for a repository. Repositories inherited through a parent team will also be checked.

  You can also get information about the specified repository, including what permissions the team grants on it, by passing the following custom [media type](https://docs.github.com/rest/overview/media-types/) via the `application/vnd.github.v3.repository+json` accept header.

  If a team doesn't have permission for the repository, you will receive a `404 Not Found` response status.

  If the repository is private, you must have at least `read` permission for that repository, and your token must have the `repo` or `admin:org` scope. Otherwise, you will receive a `404 Not Found` response status.

  **Note:** You can also specify a team by `org_id` and `team_id` using the route `GET /organizations/{org_id}/team/{team_id}/repos/{owner}/{repo}`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/teams#check-team-permissions-for-a-repository)

  """
  @spec check_permissions_for_repo_in_org(String.t(), String.t(), String.t(), String.t(), keyword) ::
          {:ok, GitHub.Team.Repository.t()} | {:error, GitHub.Error.t()}
  def check_permissions_for_repo_in_org(org, team_slug, owner, repo, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, team_slug: team_slug, owner: owner, repo: repo],
      call: {GitHub.Teams, :check_permissions_for_repo_in_org},
      url: "/orgs/#{org}/teams/#{team_slug}/repos/#{owner}/#{repo}",
      method: :get,
      response: [{200, {GitHub.Team.Repository, :t}}, {204, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Check team permissions for a repository (Legacy)

  **Note**: Repositories inherited through a parent team will also be checked.

  **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the new [Check team permissions for a repository](https://docs.github.com/rest/teams/teams#check-team-permissions-for-a-repository) endpoint.

  You can also get information about the specified repository, including what permissions the team grants on it, by passing the following custom [media type](https://docs.github.com/rest/overview/media-types/) via the `Accept` header:

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/teams#check-team-permissions-for-a-repository-legacy)

  """
  @spec check_permissions_for_repo_legacy(integer, String.t(), String.t(), keyword) ::
          {:ok, GitHub.Team.Repository.t()} | {:error, GitHub.Error.t()}
  def check_permissions_for_repo_legacy(team_id, owner, repo, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [team_id: team_id, owner: owner, repo: repo],
      call: {GitHub.Teams, :check_permissions_for_repo_legacy},
      url: "/teams/#{team_id}/repos/#{owner}/#{repo}",
      method: :get,
      response: [{200, {GitHub.Team.Repository, :t}}, {204, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Create a team

  To create a team, the authenticated user must be a member or owner of `{org}`. By default, organization members can create teams. Organization owners can limit team creation to organization owners. For more information, see "[Setting team creation permissions](https://docs.github.com/articles/setting-team-creation-permissions-in-your-organization)."

  When you create a new team, you automatically become a team maintainer without explicitly adding yourself to the optional array of `maintainers`. For more information, see "[About teams](https://docs.github.com/github/setting-up-and-managing-organizations-and-teams/about-teams)".

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/teams#create-a-team)

  """
  @spec create(String.t(), map, keyword) :: {:ok, GitHub.Team.full()} | {:error, GitHub.Error.t()}
  def create(org, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, body: body],
      call: {GitHub.Teams, :create},
      url: "/orgs/#{org}/teams",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {GitHub.Team, :full}},
        {403, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create a discussion comment

  Creates a new comment on a team discussion.

  This endpoint triggers [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications). Creating content too quickly using this endpoint may result in secondary rate limiting. For more information, see "[Rate limits for the API](https://docs.github.com/rest/overview/rate-limits-for-the-rest-api#about-secondary-rate-limits)" and "[Best practices for using the REST API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."

  **Note:** You can also specify a team by `org_id` and `team_id` using the route `POST /organizations/{org_id}/team/{team_id}/discussions/{discussion_number}/comments`.

  OAuth app tokens and personal access tokens (classic) need the `write:discussion` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/discussion-comments#create-a-discussion-comment)

  """
  @spec create_discussion_comment_in_org(String.t(), String.t(), integer, map, keyword) ::
          {:ok, GitHub.Team.DiscussionComment.t()} | {:error, GitHub.Error.t()}
  def create_discussion_comment_in_org(org, team_slug, discussion_number, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, team_slug: team_slug, discussion_number: discussion_number, body: body],
      call: {GitHub.Teams, :create_discussion_comment_in_org},
      url: "/orgs/#{org}/teams/#{team_slug}/discussions/#{discussion_number}/comments",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{201, {GitHub.Team.DiscussionComment, :t}}],
      opts: opts
    })
  end

  @doc """
  Create a discussion comment (Legacy)

  **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the new [Create a discussion comment](https://docs.github.com/rest/teams/discussion-comments#create-a-discussion-comment) endpoint.

  Creates a new comment on a team discussion.

  This endpoint triggers [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications). Creating content too quickly using this endpoint may result in secondary rate limiting. For more information, see "[Rate limits for the API](https://docs.github.com/rest/overview/rate-limits-for-the-rest-api#about-secondary-rate-limits)" and "[Best practices for using the REST API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."

  OAuth app tokens and personal access tokens (classic) need the `write:discussion` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/discussion-comments#create-a-discussion-comment-legacy)

  """
  @spec create_discussion_comment_legacy(integer, integer, map, keyword) ::
          {:ok, GitHub.Team.DiscussionComment.t()} | {:error, GitHub.Error.t()}
  def create_discussion_comment_legacy(team_id, discussion_number, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [team_id: team_id, discussion_number: discussion_number, body: body],
      call: {GitHub.Teams, :create_discussion_comment_legacy},
      url: "/teams/#{team_id}/discussions/#{discussion_number}/comments",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{201, {GitHub.Team.DiscussionComment, :t}}],
      opts: opts
    })
  end

  @doc """
  Create a discussion

  Creates a new discussion post on a team's page.

  This endpoint triggers [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications). Creating content too quickly using this endpoint may result in secondary rate limiting. For more information, see "[Rate limits for the API](https://docs.github.com/rest/overview/rate-limits-for-the-rest-api#about-secondary-rate-limits)" and "[Best practices for using the REST API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."

  **Note:** You can also specify a team by `org_id` and `team_id` using the route `POST /organizations/{org_id}/team/{team_id}/discussions`.

  OAuth app tokens and personal access tokens (classic) need the `write:discussion` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/discussions#create-a-discussion)

  """
  @spec create_discussion_in_org(String.t(), String.t(), map, keyword) ::
          {:ok, GitHub.Team.Discussion.t()} | {:error, GitHub.Error.t()}
  def create_discussion_in_org(org, team_slug, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, team_slug: team_slug, body: body],
      call: {GitHub.Teams, :create_discussion_in_org},
      url: "/orgs/#{org}/teams/#{team_slug}/discussions",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{201, {GitHub.Team.Discussion, :t}}],
      opts: opts
    })
  end

  @doc """
  Create a discussion (Legacy)

  **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the new [`Create a discussion`](https://docs.github.com/rest/teams/discussions#create-a-discussion) endpoint.

  Creates a new discussion post on a team's page.

  This endpoint triggers [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications). Creating content too quickly using this endpoint may result in secondary rate limiting. For more information, see "[Rate limits for the API](https://docs.github.com/rest/overview/rate-limits-for-the-rest-api#about-secondary-rate-limits)" and "[Best practices for using the REST API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."

  OAuth app tokens and personal access tokens (classic) need the `write:discussion` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/discussions#create-a-discussion-legacy)

  """
  @spec create_discussion_legacy(integer, map, keyword) ::
          {:ok, GitHub.Team.Discussion.t()} | {:error, GitHub.Error.t()}
  def create_discussion_legacy(team_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [team_id: team_id, body: body],
      call: {GitHub.Teams, :create_discussion_legacy},
      url: "/teams/#{team_id}/discussions",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{201, {GitHub.Team.Discussion, :t}}],
      opts: opts
    })
  end

  @doc """
  Delete a discussion comment

  Deletes a comment on a team discussion.

  **Note:** You can also specify a team by `org_id` and `team_id` using the route `DELETE /organizations/{org_id}/team/{team_id}/discussions/{discussion_number}/comments/{comment_number}`.

  OAuth app tokens and personal access tokens (classic) need the `write:discussion` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/discussion-comments#delete-a-discussion-comment)

  """
  @spec delete_discussion_comment_in_org(String.t(), String.t(), integer, integer, keyword) ::
          :ok | {:error, GitHub.Error.t()}
  def delete_discussion_comment_in_org(
        org,
        team_slug,
        discussion_number,
        comment_number,
        opts \\ []
      ) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [
        org: org,
        team_slug: team_slug,
        discussion_number: discussion_number,
        comment_number: comment_number
      ],
      call: {GitHub.Teams, :delete_discussion_comment_in_org},
      url:
        "/orgs/#{org}/teams/#{team_slug}/discussions/#{discussion_number}/comments/#{comment_number}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Delete a discussion comment (Legacy)

  **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the new [Delete a discussion comment](https://docs.github.com/rest/teams/discussion-comments#delete-a-discussion-comment) endpoint.

  Deletes a comment on a team discussion.

  OAuth app tokens and personal access tokens (classic) need the `write:discussion` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/discussion-comments#delete-a-discussion-comment-legacy)

  """
  @spec delete_discussion_comment_legacy(integer, integer, integer, keyword) ::
          :ok | {:error, GitHub.Error.t()}
  def delete_discussion_comment_legacy(team_id, discussion_number, comment_number, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [
        team_id: team_id,
        discussion_number: discussion_number,
        comment_number: comment_number
      ],
      call: {GitHub.Teams, :delete_discussion_comment_legacy},
      url: "/teams/#{team_id}/discussions/#{discussion_number}/comments/#{comment_number}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Delete a discussion

  Delete a discussion from a team's page.

  **Note:** You can also specify a team by `org_id` and `team_id` using the route `DELETE /organizations/{org_id}/team/{team_id}/discussions/{discussion_number}`.

  OAuth app tokens and personal access tokens (classic) need the `write:discussion` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/discussions#delete-a-discussion)

  """
  @spec delete_discussion_in_org(String.t(), String.t(), integer, keyword) ::
          :ok | {:error, GitHub.Error.t()}
  def delete_discussion_in_org(org, team_slug, discussion_number, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, team_slug: team_slug, discussion_number: discussion_number],
      call: {GitHub.Teams, :delete_discussion_in_org},
      url: "/orgs/#{org}/teams/#{team_slug}/discussions/#{discussion_number}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Delete a discussion (Legacy)

  **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the new [`Delete a discussion`](https://docs.github.com/rest/teams/discussions#delete-a-discussion) endpoint.

  Delete a discussion from a team's page.

  OAuth app tokens and personal access tokens (classic) need the `write:discussion` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/discussions#delete-a-discussion-legacy)

  """
  @spec delete_discussion_legacy(integer, integer, keyword) :: :ok | {:error, GitHub.Error.t()}
  def delete_discussion_legacy(team_id, discussion_number, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [team_id: team_id, discussion_number: discussion_number],
      call: {GitHub.Teams, :delete_discussion_legacy},
      url: "/teams/#{team_id}/discussions/#{discussion_number}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Delete a team

  To delete a team, the authenticated user must be an organization owner or team maintainer.

  If you are an organization owner, deleting a parent team will delete all of its child teams as well.

  **Note:** You can also specify a team by `org_id` and `team_id` using the route `DELETE /organizations/{org_id}/team/{team_id}`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/teams#delete-a-team)

  """
  @spec delete_in_org(String.t(), String.t(), keyword) :: :ok | {:error, GitHub.Error.t()}
  def delete_in_org(org, team_slug, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, team_slug: team_slug],
      call: {GitHub.Teams, :delete_in_org},
      url: "/orgs/#{org}/teams/#{team_slug}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Delete a team (Legacy)

  **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the new [Delete a team](https://docs.github.com/rest/teams/teams#delete-a-team) endpoint.

  To delete a team, the authenticated user must be an organization owner or team maintainer.

  If you are an organization owner, deleting a parent team will delete all of its child teams as well.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/teams#delete-a-team-legacy)

  """
  @spec delete_legacy(integer, keyword) :: :ok | {:error, GitHub.Error.t()}
  def delete_legacy(team_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [team_id: team_id],
      call: {GitHub.Teams, :delete_legacy},
      url: "/teams/#{team_id}",
      method: :delete,
      response: [
        {204, :null},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a team by name

  Gets a team using the team's `slug`. To create the `slug`, GitHub replaces special characters in the `name` string, changes all words to lowercase, and replaces spaces with a `-` separator. For example, `"My TEam Näme"` would become `my-team-name`.

  **Note:** You can also specify a team by `org_id` and `team_id` using the route `GET /organizations/{org_id}/team/{team_id}`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/teams#get-a-team-by-name)

  """
  @spec get_by_name(String.t(), String.t(), keyword) ::
          {:ok, GitHub.Team.full()} | {:error, GitHub.Error.t()}
  def get_by_name(org, team_slug, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, team_slug: team_slug],
      call: {GitHub.Teams, :get_by_name},
      url: "/orgs/#{org}/teams/#{team_slug}",
      method: :get,
      response: [{200, {GitHub.Team, :full}}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get a discussion comment

  Get a specific comment on a team discussion.

  **Note:** You can also specify a team by `org_id` and `team_id` using the route `GET /organizations/{org_id}/team/{team_id}/discussions/{discussion_number}/comments/{comment_number}`.

  OAuth app tokens and personal access tokens (classic) need the `read:discussion` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/discussion-comments#get-a-discussion-comment)

  """
  @spec get_discussion_comment_in_org(String.t(), String.t(), integer, integer, keyword) ::
          {:ok, GitHub.Team.DiscussionComment.t()} | {:error, GitHub.Error.t()}
  def get_discussion_comment_in_org(org, team_slug, discussion_number, comment_number, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [
        org: org,
        team_slug: team_slug,
        discussion_number: discussion_number,
        comment_number: comment_number
      ],
      call: {GitHub.Teams, :get_discussion_comment_in_org},
      url:
        "/orgs/#{org}/teams/#{team_slug}/discussions/#{discussion_number}/comments/#{comment_number}",
      method: :get,
      response: [{200, {GitHub.Team.DiscussionComment, :t}}],
      opts: opts
    })
  end

  @doc """
  Get a discussion comment (Legacy)

  **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the new [Get a discussion comment](https://docs.github.com/rest/teams/discussion-comments#get-a-discussion-comment) endpoint.

  Get a specific comment on a team discussion.

  OAuth app tokens and personal access tokens (classic) need the `read:discussion` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/discussion-comments#get-a-discussion-comment-legacy)

  """
  @spec get_discussion_comment_legacy(integer, integer, integer, keyword) ::
          {:ok, GitHub.Team.DiscussionComment.t()} | {:error, GitHub.Error.t()}
  def get_discussion_comment_legacy(team_id, discussion_number, comment_number, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [
        team_id: team_id,
        discussion_number: discussion_number,
        comment_number: comment_number
      ],
      call: {GitHub.Teams, :get_discussion_comment_legacy},
      url: "/teams/#{team_id}/discussions/#{discussion_number}/comments/#{comment_number}",
      method: :get,
      response: [{200, {GitHub.Team.DiscussionComment, :t}}],
      opts: opts
    })
  end

  @doc """
  Get a discussion

  Get a specific discussion on a team's page.

  **Note:** You can also specify a team by `org_id` and `team_id` using the route `GET /organizations/{org_id}/team/{team_id}/discussions/{discussion_number}`.

  OAuth app tokens and personal access tokens (classic) need the `read:discussion` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/discussions#get-a-discussion)

  """
  @spec get_discussion_in_org(String.t(), String.t(), integer, keyword) ::
          {:ok, GitHub.Team.Discussion.t()} | {:error, GitHub.Error.t()}
  def get_discussion_in_org(org, team_slug, discussion_number, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, team_slug: team_slug, discussion_number: discussion_number],
      call: {GitHub.Teams, :get_discussion_in_org},
      url: "/orgs/#{org}/teams/#{team_slug}/discussions/#{discussion_number}",
      method: :get,
      response: [{200, {GitHub.Team.Discussion, :t}}],
      opts: opts
    })
  end

  @doc """
  Get a discussion (Legacy)

  **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the new [Get a discussion](https://docs.github.com/rest/teams/discussions#get-a-discussion) endpoint.

  Get a specific discussion on a team's page.

  OAuth app tokens and personal access tokens (classic) need the `read:discussion` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/discussions#get-a-discussion-legacy)

  """
  @spec get_discussion_legacy(integer, integer, keyword) ::
          {:ok, GitHub.Team.Discussion.t()} | {:error, GitHub.Error.t()}
  def get_discussion_legacy(team_id, discussion_number, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [team_id: team_id, discussion_number: discussion_number],
      call: {GitHub.Teams, :get_discussion_legacy},
      url: "/teams/#{team_id}/discussions/#{discussion_number}",
      method: :get,
      response: [{200, {GitHub.Team.Discussion, :t}}],
      opts: opts
    })
  end

  @doc """
  Get a team (Legacy)

  **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the [Get a team by name](https://docs.github.com/rest/teams/teams#get-a-team-by-name) endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/teams#get-a-team-legacy)

  """
  @spec get_legacy(integer, keyword) :: {:ok, GitHub.Team.full()} | {:error, GitHub.Error.t()}
  def get_legacy(team_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [team_id: team_id],
      call: {GitHub.Teams, :get_legacy},
      url: "/teams/#{team_id}",
      method: :get,
      response: [{200, {GitHub.Team, :full}}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get team member (Legacy)

  The "Get team member" endpoint (described below) is deprecated.

  We recommend using the [Get team membership for a user](https://docs.github.com/rest/teams/members#get-team-membership-for-a-user) endpoint instead. It allows you to get both active and pending memberships.

  To list members in a team, the team must be visible to the authenticated user.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/members#get-team-member-legacy)

  """
  @spec get_member_legacy(integer, String.t(), keyword) :: :ok | {:error, GitHub.Error.t()}
  def get_member_legacy(team_id, username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [team_id: team_id, username: username],
      call: {GitHub.Teams, :get_member_legacy},
      url: "/teams/#{team_id}/members/#{username}",
      method: :get,
      response: [{204, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Get team membership for a user

  Team members will include the members of child teams.

  To get a user's membership with a team, the team must be visible to the authenticated user.

  **Note:** You can also specify a team by `org_id` and `team_id` using the route `GET /organizations/{org_id}/team/{team_id}/memberships/{username}`.

  **Note:**
  The response contains the `state` of the membership and the member's `role`.

  The `role` for organization owners is set to `maintainer`. For more information about `maintainer` roles, see [Create a team](https://docs.github.com/rest/teams/teams#create-a-team).

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/members#get-team-membership-for-a-user)

  """
  @spec get_membership_for_user_in_org(String.t(), String.t(), String.t(), keyword) ::
          {:ok, GitHub.Team.Membership.t()} | {:error, GitHub.Error.t()}
  def get_membership_for_user_in_org(org, team_slug, username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, team_slug: team_slug, username: username],
      call: {GitHub.Teams, :get_membership_for_user_in_org},
      url: "/orgs/#{org}/teams/#{team_slug}/memberships/#{username}",
      method: :get,
      response: [{200, {GitHub.Team.Membership, :t}}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Get team membership for a user (Legacy)

  **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the new [Get team membership for a user](https://docs.github.com/rest/teams/members#get-team-membership-for-a-user) endpoint.

  Team members will include the members of child teams.

  To get a user's membership with a team, the team must be visible to the authenticated user.

  **Note:**
  The response contains the `state` of the membership and the member's `role`.

  The `role` for organization owners is set to `maintainer`. For more information about `maintainer` roles, see [Create a team](https://docs.github.com/rest/teams/teams#create-a-team).

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/members#get-team-membership-for-a-user-legacy)

  """
  @spec get_membership_for_user_legacy(integer, String.t(), keyword) ::
          {:ok, GitHub.Team.Membership.t()} | {:error, GitHub.Error.t()}
  def get_membership_for_user_legacy(team_id, username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [team_id: team_id, username: username],
      call: {GitHub.Teams, :get_membership_for_user_legacy},
      url: "/teams/#{team_id}/memberships/#{username}",
      method: :get,
      response: [{200, {GitHub.Team.Membership, :t}}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  List teams

  Lists all teams in an organization that are visible to the authenticated user.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/teams#list-teams)

  """
  @spec list(String.t(), keyword) :: {:ok, [GitHub.Team.t()]} | {:error, GitHub.Error.t()}
  def list(org, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [org: org],
      call: {GitHub.Teams, :list},
      url: "/orgs/#{org}/teams",
      method: :get,
      query: query,
      response: [{200, [{GitHub.Team, :t}]}, {403, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  List child teams

  Lists the child teams of the team specified by `{team_slug}`.

  **Note:** You can also specify a team by `org_id` and `team_id` using the route `GET /organizations/{org_id}/team/{team_id}/teams`.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/teams#list-child-teams)

  """
  @spec list_child_in_org(String.t(), String.t(), keyword) ::
          {:ok, [GitHub.Team.t()]} | {:error, GitHub.Error.t()}
  def list_child_in_org(org, team_slug, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [org: org, team_slug: team_slug],
      call: {GitHub.Teams, :list_child_in_org},
      url: "/orgs/#{org}/teams/#{team_slug}/teams",
      method: :get,
      query: query,
      response: [{200, [{GitHub.Team, :t}]}],
      opts: opts
    })
  end

  @doc """
  List child teams (Legacy)

  **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the new [`List child teams`](https://docs.github.com/rest/teams/teams#list-child-teams) endpoint.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/teams#list-child-teams-legacy)

  """
  @spec list_child_legacy(integer, keyword) ::
          {:ok, [GitHub.Team.t()]} | {:error, GitHub.Error.t()}
  def list_child_legacy(team_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [team_id: team_id],
      call: {GitHub.Teams, :list_child_legacy},
      url: "/teams/#{team_id}/teams",
      method: :get,
      query: query,
      response: [
        {200, [{GitHub.Team, :t}]},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List discussion comments

  List all comments on a team discussion.

  **Note:** You can also specify a team by `org_id` and `team_id` using the route `GET /organizations/{org_id}/team/{team_id}/discussions/{discussion_number}/comments`.

  OAuth app tokens and personal access tokens (classic) need the `read:discussion` scope to use this endpoint.

  ## Options

    * `direction`: The direction to sort the results by.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/discussion-comments#list-discussion-comments)

  """
  @spec list_discussion_comments_in_org(String.t(), String.t(), integer, keyword) ::
          {:ok, [GitHub.Team.DiscussionComment.t()]} | {:error, GitHub.Error.t()}
  def list_discussion_comments_in_org(org, team_slug, discussion_number, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:direction, :page, :per_page])

    client.request(%{
      args: [org: org, team_slug: team_slug, discussion_number: discussion_number],
      call: {GitHub.Teams, :list_discussion_comments_in_org},
      url: "/orgs/#{org}/teams/#{team_slug}/discussions/#{discussion_number}/comments",
      method: :get,
      query: query,
      response: [{200, [{GitHub.Team.DiscussionComment, :t}]}],
      opts: opts
    })
  end

  @doc """
  List discussion comments (Legacy)

  **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the new [List discussion comments](https://docs.github.com/rest/teams/discussion-comments#list-discussion-comments) endpoint.

  List all comments on a team discussion.

  OAuth app tokens and personal access tokens (classic) need the `read:discussion` scope to use this endpoint.

  ## Options

    * `direction`: The direction to sort the results by.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/discussion-comments#list-discussion-comments-legacy)

  """
  @spec list_discussion_comments_legacy(integer, integer, keyword) ::
          {:ok, [GitHub.Team.DiscussionComment.t()]} | {:error, GitHub.Error.t()}
  def list_discussion_comments_legacy(team_id, discussion_number, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:direction, :page, :per_page])

    client.request(%{
      args: [team_id: team_id, discussion_number: discussion_number],
      call: {GitHub.Teams, :list_discussion_comments_legacy},
      url: "/teams/#{team_id}/discussions/#{discussion_number}/comments",
      method: :get,
      query: query,
      response: [{200, [{GitHub.Team.DiscussionComment, :t}]}],
      opts: opts
    })
  end

  @doc """
  List discussions

  List all discussions on a team's page.

  **Note:** You can also specify a team by `org_id` and `team_id` using the route `GET /organizations/{org_id}/team/{team_id}/discussions`.

  OAuth app tokens and personal access tokens (classic) need the `read:discussion` scope to use this endpoint.

  ## Options

    * `direction`: The direction to sort the results by.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `pinned`: Pinned discussions only filter

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/discussions#list-discussions)

  """
  @spec list_discussions_in_org(String.t(), String.t(), keyword) ::
          {:ok, [GitHub.Team.Discussion.t()]} | {:error, GitHub.Error.t()}
  def list_discussions_in_org(org, team_slug, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:direction, :page, :per_page, :pinned])

    client.request(%{
      args: [org: org, team_slug: team_slug],
      call: {GitHub.Teams, :list_discussions_in_org},
      url: "/orgs/#{org}/teams/#{team_slug}/discussions",
      method: :get,
      query: query,
      response: [{200, [{GitHub.Team.Discussion, :t}]}],
      opts: opts
    })
  end

  @doc """
  List discussions (Legacy)

  **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the new [`List discussions`](https://docs.github.com/rest/teams/discussions#list-discussions) endpoint.

  List all discussions on a team's page.

  OAuth app tokens and personal access tokens (classic) need the `read:discussion` scope to use this endpoint.

  ## Options

    * `direction`: The direction to sort the results by.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/discussions#list-discussions-legacy)

  """
  @spec list_discussions_legacy(integer, keyword) ::
          {:ok, [GitHub.Team.Discussion.t()]} | {:error, GitHub.Error.t()}
  def list_discussions_legacy(team_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:direction, :page, :per_page])

    client.request(%{
      args: [team_id: team_id],
      call: {GitHub.Teams, :list_discussions_legacy},
      url: "/teams/#{team_id}/discussions",
      method: :get,
      query: query,
      response: [{200, [{GitHub.Team.Discussion, :t}]}],
      opts: opts
    })
  end

  @doc """
  List teams for the authenticated user

  List all of the teams across all of the organizations to which the authenticated
  user belongs.

  OAuth app tokens and personal access tokens (classic) need the `user`, `repo`, or `read:org` scope to use this endpoint.

  When using a fine-grained personal access token, the resource owner of the token must be a single organization, and the response will only include the teams from that organization.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/teams#list-teams-for-the-authenticated-user)

  """
  @spec list_for_authenticated_user(keyword) ::
          {:ok, [GitHub.Team.full()]} | {:error, GitHub.Error.t()}
  def list_for_authenticated_user(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {GitHub.Teams, :list_for_authenticated_user},
      url: "/user/teams",
      method: :get,
      query: query,
      response: [
        {200, [{GitHub.Team, :full}]},
        {304, :null},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List team members

  Team members will include the members of child teams.

  To list members in a team, the team must be visible to the authenticated user.

  ## Options

    * `role`: Filters members returned by their role in the team.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/members#list-team-members)

  """
  @spec list_members_in_org(String.t(), String.t(), keyword) ::
          {:ok, [GitHub.User.simple()]} | {:error, GitHub.Error.t()}
  def list_members_in_org(org, team_slug, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page, :role])

    client.request(%{
      args: [org: org, team_slug: team_slug],
      call: {GitHub.Teams, :list_members_in_org},
      url: "/orgs/#{org}/teams/#{team_slug}/members",
      method: :get,
      query: query,
      response: [{200, [{GitHub.User, :simple}]}],
      opts: opts
    })
  end

  @doc """
  List team members (Legacy)

  **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the new [`List team members`](https://docs.github.com/rest/teams/members#list-team-members) endpoint.

  Team members will include the members of child teams.

  ## Options

    * `role`: Filters members returned by their role in the team.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/members#list-team-members-legacy)

  """
  @spec list_members_legacy(integer, keyword) ::
          {:ok, [GitHub.User.simple()]} | {:error, GitHub.Error.t()}
  def list_members_legacy(team_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page, :role])

    client.request(%{
      args: [team_id: team_id],
      call: {GitHub.Teams, :list_members_legacy},
      url: "/teams/#{team_id}/members",
      method: :get,
      query: query,
      response: [{200, [{GitHub.User, :simple}]}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  List pending team invitations

  The return hash contains a `role` field which refers to the Organization Invitation role and will be one of the following values: `direct_member`, `admin`, `billing_manager`, `hiring_manager`, or `reinstate`. If the invitee is not a GitHub member, the `login` field in the return hash will be `null`.

  **Note:** You can also specify a team by `org_id` and `team_id` using the route `GET /organizations/{org_id}/team/{team_id}/invitations`.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/members#list-pending-team-invitations)

  """
  @spec list_pending_invitations_in_org(String.t(), String.t(), keyword) ::
          {:ok, [GitHub.Organization.Invitation.t()]} | {:error, GitHub.Error.t()}
  def list_pending_invitations_in_org(org, team_slug, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [org: org, team_slug: team_slug],
      call: {GitHub.Teams, :list_pending_invitations_in_org},
      url: "/orgs/#{org}/teams/#{team_slug}/invitations",
      method: :get,
      query: query,
      response: [{200, [{GitHub.Organization.Invitation, :t}]}],
      opts: opts
    })
  end

  @doc """
  List pending team invitations (Legacy)

  **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the new [`List pending team invitations`](https://docs.github.com/rest/teams/members#list-pending-team-invitations) endpoint.

  The return hash contains a `role` field which refers to the Organization Invitation role and will be one of the following values: `direct_member`, `admin`, `billing_manager`, `hiring_manager`, or `reinstate`. If the invitee is not a GitHub member, the `login` field in the return hash will be `null`.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/members#list-pending-team-invitations-legacy)

  """
  @spec list_pending_invitations_legacy(integer, keyword) ::
          {:ok, [GitHub.Organization.Invitation.t()]} | {:error, GitHub.Error.t()}
  def list_pending_invitations_legacy(team_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [team_id: team_id],
      call: {GitHub.Teams, :list_pending_invitations_legacy},
      url: "/teams/#{team_id}/invitations",
      method: :get,
      query: query,
      response: [{200, [{GitHub.Organization.Invitation, :t}]}],
      opts: opts
    })
  end

  @doc """
  List team projects

  Lists the organization projects for a team.

  **Note:** You can also specify a team by `org_id` and `team_id` using the route `GET /organizations/{org_id}/team/{team_id}/projects`.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/teams#list-team-projects)

  """
  @spec list_projects_in_org(String.t(), String.t(), keyword) ::
          {:ok, [GitHub.Team.Project.t()]} | {:error, GitHub.Error.t()}
  def list_projects_in_org(org, team_slug, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [org: org, team_slug: team_slug],
      call: {GitHub.Teams, :list_projects_in_org},
      url: "/orgs/#{org}/teams/#{team_slug}/projects",
      method: :get,
      query: query,
      response: [{200, [{GitHub.Team.Project, :t}]}],
      opts: opts
    })
  end

  @doc """
  List team projects (Legacy)

  **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the new [`List team projects`](https://docs.github.com/rest/teams/teams#list-team-projects) endpoint.

  Lists the organization projects for a team.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/teams#list-team-projects-legacy)

  """
  @spec list_projects_legacy(integer, keyword) ::
          {:ok, [GitHub.Team.Project.t()]} | {:error, GitHub.Error.t()}
  def list_projects_legacy(team_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [team_id: team_id],
      call: {GitHub.Teams, :list_projects_legacy},
      url: "/teams/#{team_id}/projects",
      method: :get,
      query: query,
      response: [{200, [{GitHub.Team.Project, :t}]}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  List team repositories

  Lists a team's repositories visible to the authenticated user.

  **Note:** You can also specify a team by `org_id` and `team_id` using the route `GET /organizations/{org_id}/team/{team_id}/repos`.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/teams#list-team-repositories)

  """
  @spec list_repos_in_org(String.t(), String.t(), keyword) ::
          {:ok, [GitHub.Repository.minimal()]} | {:error, GitHub.Error.t()}
  def list_repos_in_org(org, team_slug, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [org: org, team_slug: team_slug],
      call: {GitHub.Teams, :list_repos_in_org},
      url: "/orgs/#{org}/teams/#{team_slug}/repos",
      method: :get,
      query: query,
      response: [{200, [{GitHub.Repository, :minimal}]}],
      opts: opts
    })
  end

  @doc """
  List team repositories (Legacy)

  **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the new [List team repositories](https://docs.github.com/rest/teams/teams#list-team-repositories) endpoint.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/teams#list-team-repositories-legacy)

  """
  @spec list_repos_legacy(integer, keyword) ::
          {:ok, [GitHub.Repository.minimal()]} | {:error, GitHub.Error.t()}
  def list_repos_legacy(team_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [team_id: team_id],
      call: {GitHub.Teams, :list_repos_legacy},
      url: "/teams/#{team_id}/repos",
      method: :get,
      query: query,
      response: [{200, [{GitHub.Repository, :minimal}]}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  Remove team member (Legacy)

  The "Remove team member" endpoint (described below) is deprecated.

  We recommend using the [Remove team membership for a user](https://docs.github.com/rest/teams/members#remove-team-membership-for-a-user) endpoint instead. It allows you to remove both active and pending memberships.

  Team synchronization is available for organizations using GitHub Enterprise Cloud. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.

  To remove a team member, the authenticated user must have 'admin' permissions to the team or be an owner of the org that the team is associated with. Removing a team member does not delete the user, it just removes them from the team.

  **Note:** When you have team synchronization set up for a team with your organization's identity provider (IdP), you will see an error if you attempt to use the API for making changes to the team's membership. If you have access to manage group membership in your IdP, you can manage GitHub team membership through your identity provider, which automatically adds and removes team members in an organization. For more information, see "[Synchronizing teams between your identity provider and GitHub](https://docs.github.com/articles/synchronizing-teams-between-your-identity-provider-and-github/)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/members#remove-team-member-legacy)

  """
  @spec remove_member_legacy(integer, String.t(), keyword) :: :ok | {:error, GitHub.Error.t()}
  def remove_member_legacy(team_id, username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [team_id: team_id, username: username],
      call: {GitHub.Teams, :remove_member_legacy},
      url: "/teams/#{team_id}/members/#{username}",
      method: :delete,
      response: [{204, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Remove team membership for a user

  To remove a membership between a user and a team, the authenticated user must have 'admin' permissions to the team or be an owner of the organization that the team is associated with. Removing team membership does not delete the user, it just removes their membership from the team.

  Team synchronization is available for organizations using GitHub Enterprise Cloud. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.

  **Note:** When you have team synchronization set up for a team with your organization's identity provider (IdP), you will see an error if you attempt to use the API for making changes to the team's membership. If you have access to manage group membership in your IdP, you can manage GitHub team membership through your identity provider, which automatically adds and removes team members in an organization. For more information, see "[Synchronizing teams between your identity provider and GitHub](https://docs.github.com/articles/synchronizing-teams-between-your-identity-provider-and-github/)."

  **Note:** You can also specify a team by `org_id` and `team_id` using the route `DELETE /organizations/{org_id}/team/{team_id}/memberships/{username}`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/members#remove-team-membership-for-a-user)

  """
  @spec remove_membership_for_user_in_org(String.t(), String.t(), String.t(), keyword) ::
          :ok | {:error, GitHub.Error.t()}
  def remove_membership_for_user_in_org(org, team_slug, username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, team_slug: team_slug, username: username],
      call: {GitHub.Teams, :remove_membership_for_user_in_org},
      url: "/orgs/#{org}/teams/#{team_slug}/memberships/#{username}",
      method: :delete,
      response: [{204, :null}, {403, :null}],
      opts: opts
    })
  end

  @doc """
  Remove team membership for a user (Legacy)

  **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the new [Remove team membership for a user](https://docs.github.com/rest/teams/members#remove-team-membership-for-a-user) endpoint.

  Team synchronization is available for organizations using GitHub Enterprise Cloud. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.

  To remove a membership between a user and a team, the authenticated user must have 'admin' permissions to the team or be an owner of the organization that the team is associated with. Removing team membership does not delete the user, it just removes their membership from the team.

  **Note:** When you have team synchronization set up for a team with your organization's identity provider (IdP), you will see an error if you attempt to use the API for making changes to the team's membership. If you have access to manage group membership in your IdP, you can manage GitHub team membership through your identity provider, which automatically adds and removes team members in an organization. For more information, see "[Synchronizing teams between your identity provider and GitHub](https://docs.github.com/articles/synchronizing-teams-between-your-identity-provider-and-github/)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/members#remove-team-membership-for-a-user-legacy)

  """
  @spec remove_membership_for_user_legacy(integer, String.t(), keyword) ::
          :ok | {:error, GitHub.Error.t()}
  def remove_membership_for_user_legacy(team_id, username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [team_id: team_id, username: username],
      call: {GitHub.Teams, :remove_membership_for_user_legacy},
      url: "/teams/#{team_id}/memberships/#{username}",
      method: :delete,
      response: [{204, :null}, {403, :null}],
      opts: opts
    })
  end

  @doc """
  Remove a project from a team

  Removes an organization project from a team. An organization owner or a team maintainer can remove any project from the team. To remove a project from a team as an organization member, the authenticated user must have `read` access to both the team and project, or `admin` access to the team or project. This endpoint removes the project from the team, but does not delete the project.

  **Note:** You can also specify a team by `org_id` and `team_id` using the route `DELETE /organizations/{org_id}/team/{team_id}/projects/{project_id}`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/teams#remove-a-project-from-a-team)

  """
  @spec remove_project_in_org(String.t(), String.t(), integer, keyword) ::
          :ok | {:error, GitHub.Error.t()}
  def remove_project_in_org(org, team_slug, project_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, team_slug: team_slug, project_id: project_id],
      call: {GitHub.Teams, :remove_project_in_org},
      url: "/orgs/#{org}/teams/#{team_slug}/projects/#{project_id}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Remove a project from a team (Legacy)

  **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the new [Remove a project from a team](https://docs.github.com/rest/teams/teams#remove-a-project-from-a-team) endpoint.

  Removes an organization project from a team. An organization owner or a team maintainer can remove any project from the team. To remove a project from a team as an organization member, the authenticated user must have `read` access to both the team and project, or `admin` access to the team or project. **Note:** This endpoint removes the project from the team, but does not delete it.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/teams#remove-a-project-from-a-team-legacy)

  """
  @spec remove_project_legacy(integer, integer, keyword) :: :ok | {:error, GitHub.Error.t()}
  def remove_project_legacy(team_id, project_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [team_id: team_id, project_id: project_id],
      call: {GitHub.Teams, :remove_project_legacy},
      url: "/teams/#{team_id}/projects/#{project_id}",
      method: :delete,
      response: [
        {204, :null},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Remove a repository from a team

  If the authenticated user is an organization owner or a team maintainer, they can remove any repositories from the team. To remove a repository from a team as an organization member, the authenticated user must have admin access to the repository and must be able to see the team. This does not delete the repository, it just removes it from the team.

  **Note:** You can also specify a team by `org_id` and `team_id` using the route `DELETE /organizations/{org_id}/team/{team_id}/repos/{owner}/{repo}`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/teams#remove-a-repository-from-a-team)

  """
  @spec remove_repo_in_org(String.t(), String.t(), String.t(), String.t(), keyword) ::
          :ok | {:error, GitHub.Error.t()}
  def remove_repo_in_org(org, team_slug, owner, repo, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, team_slug: team_slug, owner: owner, repo: repo],
      call: {GitHub.Teams, :remove_repo_in_org},
      url: "/orgs/#{org}/teams/#{team_slug}/repos/#{owner}/#{repo}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Remove a repository from a team (Legacy)

  **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the new [Remove a repository from a team](https://docs.github.com/rest/teams/teams#remove-a-repository-from-a-team) endpoint.

  If the authenticated user is an organization owner or a team maintainer, they can remove any repositories from the team. To remove a repository from a team as an organization member, the authenticated user must have admin access to the repository and must be able to see the team. NOTE: This does not delete the repository, it just removes it from the team.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/teams#remove-a-repository-from-a-team-legacy)

  """
  @spec remove_repo_legacy(integer, String.t(), String.t(), keyword) ::
          :ok | {:error, GitHub.Error.t()}
  def remove_repo_legacy(team_id, owner, repo, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [team_id: team_id, owner: owner, repo: repo],
      call: {GitHub.Teams, :remove_repo_legacy},
      url: "/teams/#{team_id}/repos/#{owner}/#{repo}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Update a discussion comment

  Edits the body text of a discussion comment.

  **Note:** You can also specify a team by `org_id` and `team_id` using the route `PATCH /organizations/{org_id}/team/{team_id}/discussions/{discussion_number}/comments/{comment_number}`.

  OAuth app tokens and personal access tokens (classic) need the `write:discussion` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/discussion-comments#update-a-discussion-comment)

  """
  @spec update_discussion_comment_in_org(String.t(), String.t(), integer, integer, map, keyword) ::
          {:ok, GitHub.Team.DiscussionComment.t()} | {:error, GitHub.Error.t()}
  def update_discussion_comment_in_org(
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
      call: {GitHub.Teams, :update_discussion_comment_in_org},
      url:
        "/orgs/#{org}/teams/#{team_slug}/discussions/#{discussion_number}/comments/#{comment_number}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{200, {GitHub.Team.DiscussionComment, :t}}],
      opts: opts
    })
  end

  @doc """
  Update a discussion comment (Legacy)

  **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the new [Update a discussion comment](https://docs.github.com/rest/teams/discussion-comments#update-a-discussion-comment) endpoint.

  Edits the body text of a discussion comment.

  OAuth app tokens and personal access tokens (classic) need the `write:discussion` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/discussion-comments#update-a-discussion-comment-legacy)

  """
  @spec update_discussion_comment_legacy(integer, integer, integer, map, keyword) ::
          {:ok, GitHub.Team.DiscussionComment.t()} | {:error, GitHub.Error.t()}
  def update_discussion_comment_legacy(
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
      call: {GitHub.Teams, :update_discussion_comment_legacy},
      url: "/teams/#{team_id}/discussions/#{discussion_number}/comments/#{comment_number}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{200, {GitHub.Team.DiscussionComment, :t}}],
      opts: opts
    })
  end

  @doc """
  Update a discussion

  Edits the title and body text of a discussion post. Only the parameters you provide are updated.

  **Note:** You can also specify a team by `org_id` and `team_id` using the route `PATCH /organizations/{org_id}/team/{team_id}/discussions/{discussion_number}`.

  OAuth app tokens and personal access tokens (classic) need the `write:discussion` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/discussions#update-a-discussion)

  """
  @spec update_discussion_in_org(String.t(), String.t(), integer, map, keyword) ::
          {:ok, GitHub.Team.Discussion.t()} | {:error, GitHub.Error.t()}
  def update_discussion_in_org(org, team_slug, discussion_number, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, team_slug: team_slug, discussion_number: discussion_number, body: body],
      call: {GitHub.Teams, :update_discussion_in_org},
      url: "/orgs/#{org}/teams/#{team_slug}/discussions/#{discussion_number}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{200, {GitHub.Team.Discussion, :t}}],
      opts: opts
    })
  end

  @doc """
  Update a discussion (Legacy)

  **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the new [Update a discussion](https://docs.github.com/rest/teams/discussions#update-a-discussion) endpoint.

  Edits the title and body text of a discussion post. Only the parameters you provide are updated.

  OAuth app tokens and personal access tokens (classic) need the `write:discussion` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/discussions#update-a-discussion-legacy)

  """
  @spec update_discussion_legacy(integer, integer, map, keyword) ::
          {:ok, GitHub.Team.Discussion.t()} | {:error, GitHub.Error.t()}
  def update_discussion_legacy(team_id, discussion_number, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [team_id: team_id, discussion_number: discussion_number, body: body],
      call: {GitHub.Teams, :update_discussion_legacy},
      url: "/teams/#{team_id}/discussions/#{discussion_number}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{200, {GitHub.Team.Discussion, :t}}],
      opts: opts
    })
  end

  @doc """
  Update a team

  To edit a team, the authenticated user must either be an organization owner or a team maintainer.

  **Note:** You can also specify a team by `org_id` and `team_id` using the route `PATCH /organizations/{org_id}/team/{team_id}`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/teams#update-a-team)

  """
  @spec update_in_org(String.t(), String.t(), map, keyword) ::
          {:ok, GitHub.Team.full()} | {:error, GitHub.Error.t()}
  def update_in_org(org, team_slug, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, team_slug: team_slug, body: body],
      call: {GitHub.Teams, :update_in_org},
      url: "/orgs/#{org}/teams/#{team_slug}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, {GitHub.Team, :full}},
        {201, {GitHub.Team, :full}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a team (Legacy)

  **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the new [Update a team](https://docs.github.com/rest/teams/teams#update-a-team) endpoint.

  To edit a team, the authenticated user must either be an organization owner or a team maintainer.

  **Note:** With nested teams, the `privacy` for parent teams cannot be `secret`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/teams/teams#update-a-team-legacy)

  """
  @spec update_legacy(integer, map, keyword) ::
          {:ok, GitHub.Team.full()} | {:error, GitHub.Error.t()}
  def update_legacy(team_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [team_id: team_id, body: body],
      call: {GitHub.Teams, :update_legacy},
      url: "/teams/#{team_id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, {GitHub.Team, :full}},
        {201, {GitHub.Team, :full}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:add_or_update_project_permissions_in_org_403_json_resp) do
    [documentation_url: {:string, :generic}, message: {:string, :generic}]
  end

  def __fields__(:add_or_update_project_permissions_legacy_403_json_resp) do
    [documentation_url: {:string, :generic}, message: {:string, :generic}]
  end
end
