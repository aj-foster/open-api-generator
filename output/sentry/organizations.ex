defmodule Organizations do
  @moduledoc """
  Provides API endpoints related to organizations
  """

  @default_client Client

  @doc """
  get `/api/0/organizations/{organization_id_or_slug}/repos/{repo_id}/commits/`

  Return a list of commits for a given repository.
  """
  @spec list_a_repository_s_commits(String.t(), String.t(), keyword) ::
          {:ok, [MinimalCommit.t()]} | :error
  def list_a_repository_s_commits(organization_id_or_slug, repo_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug, repo_id: repo_id],
      call: {Organizations, :list_a_repository_s_commits},
      url: "/api/0/organizations/#{organization_id_or_slug}/repos/#{repo_id}/commits/",
      method: :get,
      response: [{200, [{MinimalCommit, :t}]}, {401, :null}, {403, :null}, {404, :null}],
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
  @spec list_an_organization_s_repositories(String.t(), keyword) :: {:ok, [map]} | :error
  def list_an_organization_s_repositories(organization_id_or_slug, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug],
      call: {Organizations, :list_an_organization_s_repositories},
      url: "/api/0/organizations/#{organization_id_or_slug}/repos/",
      method: :get,
      response: [
        {200, [{Organizations, :list_an_organization_s_repositories_200_json_resp}]},
        {403, :null},
        {404, :null}
      ],
      opts: opts
    })
  end

  @type resolve_a_short_id_200_json_resp :: %{
          group: OrganizationsGroup.resolve_a_short_id_200_json_resp(),
          groupId: String.t(),
          organizationSlug: String.t(),
          projectSlug: String.t(),
          shortId: String.t()
        }

  @doc """
  get `/api/0/organizations/{organization_id_or_slug}/shortids/{short_id}/`

  This resolves a short ID to the project slug and internal issue ID.
  """
  @spec resolve_a_short_id(String.t(), String.t(), keyword) :: {:ok, map} | :error
  def resolve_a_short_id(organization_id_or_slug, short_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug, short_id: short_id],
      call: {Organizations, :resolve_a_short_id},
      url: "/api/0/organizations/#{organization_id_or_slug}/shortids/#{short_id}/",
      method: :get,
      response: [
        {200, {Organizations, :resolve_a_short_id_200_json_resp}},
        {401, :null},
        {403, :null},
        {404, :null}
      ],
      opts: opts
    })
  end

  @type resolve_an_event_id_200_json_resp :: %{
          event: OrganizationEvent.t(),
          eventId: String.t(),
          groupId: String.t(),
          organizationSlug: String.t(),
          projectSlug: String.t()
        }

  @doc """
  get `/api/0/organizations/{organization_id_or_slug}/eventids/{event_id}/`

  This resolves an event ID to the project slug and internal issue ID and internal event ID.
  """
  @spec resolve_an_event_id(String.t(), String.t(), keyword) :: {:ok, map} | :error
  def resolve_an_event_id(organization_id_or_slug, event_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug, event_id: event_id],
      call: {Organizations, :resolve_an_event_id},
      url: "/api/0/organizations/#{organization_id_or_slug}/eventids/#{event_id}/",
      method: :get,
      response: [
        {200, {Organizations, :resolve_an_event_id_200_json_resp}},
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
  @spec retrieve_an_organization(String.t(), keyword) :: {:ok, OrganizationDetails.t()} | :error
  def retrieve_an_organization(organization_id_or_slug, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug],
      call: {Organizations, :retrieve_an_organization},
      url: "/api/0/organizations/#{organization_id_or_slug}/",
      method: :get,
      response: [{200, {OrganizationDetails, :t}}, {401, :null}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  put `/api/0/organizations/{organization_id_or_slug}/`

  Update various attributes and configurable settings for the given organization.
  """
  @spec update_an_organization(String.t(), map, keyword) ::
          {:ok, OrganizationDetails.t()} | :error
  def update_an_organization(organization_id_or_slug, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug, body: body],
      call: {Organizations, :update_an_organization},
      url: "/api/0/organizations/#{organization_id_or_slug}/",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [
        {200, {OrganizationDetails, :t}},
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
    [dateCreated: {:string, :generic}, id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:resolve_a_short_id_200_json_resp) do
    [
      group: {OrganizationsGroup, :resolve_a_short_id_200_json_resp},
      groupId: {:string, :generic},
      organizationSlug: {:string, :generic},
      projectSlug: {:string, :generic},
      shortId: {:string, :generic}
    ]
  end

  def __fields__(:resolve_an_event_id_200_json_resp) do
    [
      event: {OrganizationEvent, :t},
      eventId: {:string, :generic},
      groupId: {:string, :generic},
      organizationSlug: {:string, :generic},
      projectSlug: {:string, :generic}
    ]
  end
end
