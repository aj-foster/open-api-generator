defmodule Sentry.Organizations do
  @moduledoc """
  Provides API endpoints related to organizations
  """

  @default_client Sentry.Client

  @doc """
  get `/api/0/organizations/{organization_id_or_slug}/repos/{repo_id}/commits/`

  Return a list of commits for a given repository.
  """
  @spec list_a_repository_s_commits(organization_id_or_slug :: String.t(), repo_id :: String.t()) ::
          {:ok, [Sentry.MinimalCommit.t()]} | :error
  @spec list_a_repository_s_commits(
          organization_id_or_slug :: String.t(),
          repo_id :: String.t(),
          opts :: keyword
        ) :: {:ok, [Sentry.MinimalCommit.t()]} | :error
  def list_a_repository_s_commits(organization_id_or_slug, repo_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug, repo_id: repo_id],
      call: {Sentry.Organizations, :list_a_repository_s_commits},
      url: "/api/0/organizations/#{organization_id_or_slug}/repos/#{repo_id}/commits/",
      method: :get,
      response: [{200, [{Sentry.MinimalCommit, :t}]}, {401, :null}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @type list_an_organization_s_repositories_200_json_resp :: %{
          dateCreated: String.t(),
          id: String.t(),
          name: String.t()
        }

  @doc """
  get `/api/0/organizations/{organization_id_or_slug}/repos/`

  Return a list of version control repositories for a given organization.
  """
  @spec list_an_organization_s_repositories(organization_id_or_slug :: String.t()) ::
          {:ok, [Sentry.Organizations.list_an_organization_s_repositories_200_json_resp()]}
          | :error
  @spec list_an_organization_s_repositories(
          organization_id_or_slug :: String.t(),
          opts :: keyword
        ) ::
          {:ok, [Sentry.Organizations.list_an_organization_s_repositories_200_json_resp()]}
          | :error
  def list_an_organization_s_repositories(organization_id_or_slug, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug],
      call: {Sentry.Organizations, :list_an_organization_s_repositories},
      url: "/api/0/organizations/#{organization_id_or_slug}/repos/",
      method: :get,
      response: [
        {200, [{Sentry.Organizations, :list_an_organization_s_repositories_200_json_resp}]},
        {403, :null},
        {404, :null}
      ],
      opts: opts
    })
  end

  @type resolve_a_short_id_200_json_resp :: %{
          group: Sentry.Organizations.resolve_a_short_id_200_json_resp_group(),
          groupId: String.t(),
          organizationSlug: String.t(),
          projectSlug: String.t(),
          shortId: String.t()
        }

  @type resolve_a_short_id_200_json_resp_group :: %{
          annotations: [String.t()],
          assignedTo:
            Sentry.Organizations.resolve_a_short_id_200_json_resp_group_assigned_to() | nil,
          count: String.t(),
          culprit: String.t() | nil,
          firstSeen: String.t(),
          hasSeen: boolean,
          id: String.t(),
          isBookmarked: boolean,
          isPublic: boolean,
          isSubscribed: boolean,
          lastSeen: String.t(),
          level: String.t(),
          logger: String.t() | nil,
          metadata: Sentry.Organizations.resolve_a_short_id_200_json_resp_group_metadata(),
          numComments: integer,
          permalink: String.t(),
          project: Sentry.Organizations.resolve_a_short_id_200_json_resp_group_project(),
          shareId: String.t() | nil,
          shortId: String.t(),
          status: String.t(),
          statusDetails: map,
          subscriptionDetails:
            Sentry.Organizations.resolve_a_short_id_200_json_resp_group_subscription_details()
            | nil,
          title: String.t(),
          type: String.t(),
          userCount: integer
        }

  @type resolve_a_short_id_200_json_resp_group_assigned_to :: %{
          id: String.t() | nil,
          name: String.t() | nil,
          type: String.t() | nil
        }

  @type resolve_a_short_id_200_json_resp_group_metadata :: %{
          filename: String.t() | nil,
          function: String.t() | nil,
          title: String.t() | nil,
          type: String.t() | nil,
          value: String.t() | nil
        }

  @type resolve_a_short_id_200_json_resp_group_project :: %{
          id: String.t() | nil,
          name: String.t() | nil,
          slug: String.t() | nil
        }

  @type resolve_a_short_id_200_json_resp_group_subscription_details :: %{reason: String.t() | nil}

  @doc """
  get `/api/0/organizations/{organization_id_or_slug}/shortids/{short_id}/`

  This resolves a short ID to the project slug and internal issue ID.
  """
  @spec resolve_a_short_id(organization_id_or_slug :: String.t(), short_id :: String.t()) ::
          {:ok, Sentry.Organizations.resolve_a_short_id_200_json_resp()} | :error
  @spec resolve_a_short_id(
          organization_id_or_slug :: String.t(),
          short_id :: String.t(),
          opts :: keyword
        ) :: {:ok, Sentry.Organizations.resolve_a_short_id_200_json_resp()} | :error
  def resolve_a_short_id(organization_id_or_slug, short_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug, short_id: short_id],
      call: {Sentry.Organizations, :resolve_a_short_id},
      url: "/api/0/organizations/#{organization_id_or_slug}/shortids/#{short_id}/",
      method: :get,
      response: [
        {200, {Sentry.Organizations, :resolve_a_short_id_200_json_resp}},
        {401, :null},
        {403, :null},
        {404, :null}
      ],
      opts: opts
    })
  end

  @type resolve_an_event_id_200_json_resp :: %{
          event: Sentry.OrganizationEvent.t(),
          eventId: String.t(),
          groupId: String.t(),
          organizationSlug: String.t(),
          projectSlug: String.t()
        }

  @doc """
  get `/api/0/organizations/{organization_id_or_slug}/eventids/{event_id}/`

  This resolves an event ID to the project slug and internal issue ID and internal event ID.
  """
  @spec resolve_an_event_id(organization_id_or_slug :: String.t(), event_id :: String.t()) ::
          {:ok, Sentry.Organizations.resolve_an_event_id_200_json_resp()} | :error
  @spec resolve_an_event_id(
          organization_id_or_slug :: String.t(),
          event_id :: String.t(),
          opts :: keyword
        ) :: {:ok, Sentry.Organizations.resolve_an_event_id_200_json_resp()} | :error
  def resolve_an_event_id(organization_id_or_slug, event_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug, event_id: event_id],
      call: {Sentry.Organizations, :resolve_an_event_id},
      url: "/api/0/organizations/#{organization_id_or_slug}/eventids/#{event_id}/",
      method: :get,
      response: [
        {200, {Sentry.Organizations, :resolve_an_event_id_200_json_resp}},
        {401, :null},
        {403, :null},
        {404, :null}
      ],
      opts: opts
    })
  end

  @doc """
  get `/api/0/organizations/{organization_id_or_slug}/`

  Return details on an individual organization including various details such as membership access, features, and teams.
  """
  @spec retrieve_an_organization(organization_id_or_slug :: String.t()) ::
          {:ok, Sentry.OrganizationDetails.t()} | :error
  @spec retrieve_an_organization(organization_id_or_slug :: String.t(), opts :: keyword) ::
          {:ok, Sentry.OrganizationDetails.t()} | :error
  def retrieve_an_organization(organization_id_or_slug, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug],
      call: {Sentry.Organizations, :retrieve_an_organization},
      url: "/api/0/organizations/#{organization_id_or_slug}/",
      method: :get,
      response: [
        {200, {Sentry.OrganizationDetails, :t}},
        {401, :null},
        {403, :null},
        {404, :null}
      ],
      opts: opts
    })
  end

  @doc """
  put `/api/0/organizations/{organization_id_or_slug}/`

  Update various attributes and configurable settings for the given organization.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_an_organization(organization_id_or_slug :: String.t(), body :: map) ::
          {:ok, Sentry.OrganizationDetails.t()} | :error
  @spec update_an_organization(
          organization_id_or_slug :: String.t(),
          body :: map,
          opts :: keyword
        ) :: {:ok, Sentry.OrganizationDetails.t()} | :error
  def update_an_organization(organization_id_or_slug, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug, body: body],
      call: {Sentry.Organizations, :update_an_organization},
      url: "/api/0/organizations/#{organization_id_or_slug}/",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [
        {200, {Sentry.OrganizationDetails, :t}},
        {400, :null},
        {401, :null},
        {403, :null},
        {404, :null}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:list_an_organization_s_repositories_200_json_resp) do
    [dateCreated: :string, id: :string, name: :string]
  end

  def __fields__(:resolve_a_short_id_200_json_resp) do
    [
      group: {Sentry.Organizations, :resolve_a_short_id_200_json_resp_group},
      groupId: :string,
      organizationSlug: :string,
      projectSlug: :string,
      shortId: :string
    ]
  end

  def __fields__(:resolve_a_short_id_200_json_resp_group) do
    [
      annotations: [:string],
      assignedTo: {Sentry.Organizations, :resolve_a_short_id_200_json_resp_group_assigned_to},
      count: :string,
      culprit: :string,
      firstSeen: :string,
      hasSeen: :boolean,
      id: :string,
      isBookmarked: :boolean,
      isPublic: :boolean,
      isSubscribed: :boolean,
      lastSeen: :string,
      level: :string,
      logger: :string,
      metadata: {Sentry.Organizations, :resolve_a_short_id_200_json_resp_group_metadata},
      numComments: :integer,
      permalink: :string,
      project: {Sentry.Organizations, :resolve_a_short_id_200_json_resp_group_project},
      shareId: :string,
      shortId: :string,
      status: {:enum, ["resolved", "unresolved", "ignored"]},
      statusDetails: :map,
      subscriptionDetails:
        {Sentry.Organizations, :resolve_a_short_id_200_json_resp_group_subscription_details},
      title: :string,
      type: :string,
      userCount: :integer
    ]
  end

  def __fields__(:resolve_a_short_id_200_json_resp_group_assigned_to) do
    [id: :string, name: :string, type: :string]
  end

  def __fields__(:resolve_a_short_id_200_json_resp_group_metadata) do
    [filename: :string, function: :string, title: :string, type: :string, value: :string]
  end

  def __fields__(:resolve_a_short_id_200_json_resp_group_project) do
    [id: :string, name: :string, slug: :string]
  end

  def __fields__(:resolve_a_short_id_200_json_resp_group_subscription_details) do
    [reason: :string]
  end

  def __fields__(:resolve_an_event_id_200_json_resp) do
    [
      event: {Sentry.OrganizationEvent, :t},
      eventId: :string,
      groupId: :string,
      organizationSlug: :string,
      projectSlug: :string
    ]
  end
end
