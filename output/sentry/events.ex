defmodule Events do
  @moduledoc """
  Provides API endpoints related to events
  """

  @default_client Client

  @type bulk_mutate_a_list_of_issues_200_json_resp :: %{
          isPublic: boolean,
          status: String.t(),
          statusDetails: map
        }

  @doc """
  put `/api/0/projects/{organization_id_or_slug}/{project_id_or_slug}/issues/`

  Bulk mutate various attributes on issues.  The list of issues to modify is given through the `id` query parameter.  It is repeated for each issue that should be modified.

  - For non-status updates, the `id` query parameter is required.
  - For status updates, the `id` query parameter may be omitted
  for a batch "update all" query.
  - An optional `status` query parameter may be used to restrict
  mutations to only events with the given status.

  The following attributes can be modified and are supplied as JSON object in the body:

  If any IDs are out of scope this operation will succeed without any data mutation.

  ## Options

    * `id`: A list of IDs of the issues to be mutated. This parameter shall be repeated for each issue. It is optional only if a status is mutated in which case an implicit update all is assumed.
    * `status`: Optionally limits the query to issues of the specified status. Valid values are `"resolved"`, `"reprocessing"`, `"unresolved"`, and `"ignored"`.

  """
  @spec bulk_mutate_a_list_of_issues(String.t(), String.t(), map, keyword) :: {:ok, map} | :error
  def bulk_mutate_a_list_of_issues(organization_id_or_slug, project_id_or_slug, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:id, :status])

    client.request(%{
      args: [
        organization_id_or_slug: organization_id_or_slug,
        project_id_or_slug: project_id_or_slug,
        body: body
      ],
      call: {Events, :bulk_mutate_a_list_of_issues},
      url: "/api/0/projects/#{organization_id_or_slug}/#{project_id_or_slug}/issues/",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Events, :bulk_mutate_a_list_of_issues_200_json_resp}},
        {400, :null},
        {403, :null},
        {404, :null}
      ],
      opts: opts
    })
  end

  @doc """
  delete `/api/0/projects/{organization_id_or_slug}/{project_id_or_slug}/issues/`

  Permanently remove the given issues. The list of issues to modify is given through the `id` query parameter.  It is repeated for each issue that should be removed.

  Only queries by 'id' are accepted.

  If any IDs are out of scope this operation will succeed without any data mutation.

  ## Options

    * `id`: A list of IDs of the issues to be removed. This parameter shall be repeated for each issue, e.g. `?id=1&id=2&id=3`. If this parameter is not provided, it will attempt to remove the first 1000 issues.

  """
  @spec bulk_remove_a_list_of_issues(String.t(), String.t(), keyword) :: :ok | :error
  def bulk_remove_a_list_of_issues(organization_id_or_slug, project_id_or_slug, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:id])

    client.request(%{
      args: [
        organization_id_or_slug: organization_id_or_slug,
        project_id_or_slug: project_id_or_slug
      ],
      call: {Events, :bulk_remove_a_list_of_issues},
      url: "/api/0/projects/#{organization_id_or_slug}/#{project_id_or_slug}/issues/",
      method: :delete,
      query: query,
      response: [{204, :null}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  get `/api/0/projects/{organization_id_or_slug}/{project_id_or_slug}/events/`

  Return a list of error events bound to a project.

  ## Options

    * `full`: If this is set to true then the event payload will include the full event body, including the stacktrace. 
      Set to true to enable.
    * `cursor`: A pointer to the last object fetched and its sort order; used to retrieve the next or previous results.

  """
  @spec list_a_project_s_error_events(String.t(), String.t(), keyword) ::
          {:ok, [Event.t()]} | :error
  def list_a_project_s_error_events(organization_id_or_slug, project_id_or_slug, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :full])

    client.request(%{
      args: [
        organization_id_or_slug: organization_id_or_slug,
        project_id_or_slug: project_id_or_slug
      ],
      call: {Events, :list_a_project_s_error_events},
      url: "/api/0/projects/#{organization_id_or_slug}/#{project_id_or_slug}/events/",
      method: :get,
      query: query,
      response: [{200, [{Event, :t}]}, {403, :null}],
      opts: opts
    })
  end

  @doc """
  get `/api/0/projects/{organization_id_or_slug}/{project_id_or_slug}/issues/`

  Return a list of issues (groups) bound to a project.  All parameters are supplied as query string parameters. 

   A default query of ``is:unresolved`` is applied. To return results with other statuses send an new query value (i.e. ``?query=`` for all results).

  The ``statsPeriod`` parameter can be used to select the timeline stats which should be present. Possible values are: ``""`` (disable),``"24h"``, ``"14d"``

  ## Options

    * `statsPeriod`: An optional stat period (can be one of `"24h"`, `"14d"`, and `""`). If not provided, the API will return the max time period for the project (90 days for paid accounts, 30 days for free).
    * `shortIdLookup`: If this is set to true then short IDs are looked up by this function as well. This can cause the return value of the function to return an event issue of a different project which is why this is an opt-in. Set to 1 to enable.
    * `query`: An optional Sentry structured search query. If not provided an implied `"is:unresolved"` is assumed.
    * `cursor`: A pointer to the last object fetched and its sort order; used to retrieve the next or previous results.

  """
  @spec list_a_project_s_issues(String.t(), String.t(), keyword) :: {:ok, [Issue.t()]} | :error
  def list_a_project_s_issues(organization_id_or_slug, project_id_or_slug, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :query, :shortIdLookup, :statsPeriod])

    client.request(%{
      args: [
        organization_id_or_slug: organization_id_or_slug,
        project_id_or_slug: project_id_or_slug
      ],
      call: {Events, :list_a_project_s_issues},
      url: "/api/0/projects/#{organization_id_or_slug}/#{project_id_or_slug}/issues/",
      method: :get,
      query: query,
      response: [{200, [{Issue, :t}]}, {403, :null}],
      opts: opts
    })
  end

  @type list_a_tag_s_values_related_to_an_issue_200_json_resp :: %{
          key: String.t(),
          value: String.t()
        }

  @doc """
  get `/api/0/organizations/{organization_id_or_slug}/issues/{issue_id}/tags/{key}/values/`

  Returns details for given tag key related to an issue. 

  When [paginated](/api/pagination) can return at most 1000 values.
  """
  @spec list_a_tag_s_values_related_to_an_issue(String.t(), String.t(), String.t(), keyword) ::
          {:ok, [map]} | :error
  def list_a_tag_s_values_related_to_an_issue(organization_id_or_slug, issue_id, key, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug, issue_id: issue_id, key: key],
      call: {Events, :list_a_tag_s_values_related_to_an_issue},
      url:
        "/api/0/organizations/#{organization_id_or_slug}/issues/#{issue_id}/tags/#{key}/values/",
      method: :get,
      response: [
        {200, [{Events, :list_a_tag_s_values_related_to_an_issue_200_json_resp}]},
        {403, :null}
      ],
      opts: opts
    })
  end

  @doc """
  get `/api/0/organizations/{organization_id_or_slug}/issues/{issue_id}/events/`

  This endpoint lists an issue's events.

  ## Options

    * `full`: If this is set to true then the event payload will include the full event body, including the stacktrace. 
      Set to true to enable.

  """
  @spec list_an_issue_s_events(String.t(), String.t(), keyword) :: {:ok, [Event.t()]} | :error
  def list_an_issue_s_events(organization_id_or_slug, issue_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:full])

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug, issue_id: issue_id],
      call: {Events, :list_an_issue_s_events},
      url: "/api/0/organizations/#{organization_id_or_slug}/issues/#{issue_id}/events/",
      method: :get,
      query: query,
      response: [{200, [{Event, :t}]}, {403, :null}],
      opts: opts
    })
  end

  @type list_an_issue_s_hashes_200_json_resp :: %{
          id: String.t() | nil,
          latestEvent: Hash.t() | nil
        }

  @doc """
  get `/api/0/organizations/{organization_id_or_slug}/issues/{issue_id}/hashes/`

  This endpoint lists an issue's hashes, which are the generated checksums used to aggregate individual events.

  ## Options

    * `cursor`: A pointer to the last object fetched and its sort order; used to retrieve the next or previous results.

  """
  @spec list_an_issue_s_hashes(String.t(), String.t(), keyword) :: {:ok, [map]} | :error
  def list_an_issue_s_hashes(organization_id_or_slug, issue_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor])

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug, issue_id: issue_id],
      call: {Events, :list_an_issue_s_hashes},
      url: "/api/0/organizations/#{organization_id_or_slug}/issues/#{issue_id}/hashes/",
      method: :get,
      query: query,
      response: [{200, [{Events, :list_an_issue_s_hashes_200_json_resp}]}, {403, :null}],
      opts: opts
    })
  end

  @doc """
  delete `/api/0/organizations/{organization_id_or_slug}/issues/{issue_id}/`

  Removes an individual issue.
  """
  @spec remove_an_issue(String.t(), String.t(), keyword) :: :ok | :error
  def remove_an_issue(organization_id_or_slug, issue_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug, issue_id: issue_id],
      call: {Events, :remove_an_issue},
      url: "/api/0/organizations/#{organization_id_or_slug}/issues/#{issue_id}/",
      method: :delete,
      response: [{202, :null}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  get `/api/0/projects/{organization_id_or_slug}/{project_id_or_slug}/events/{event_id}/`

  Return details on an individual event.
  """
  @spec retrieve_an_event_for_a_project(String.t(), String.t(), String.t(), keyword) ::
          {:ok, EventDetailed.t()} | :error
  def retrieve_an_event_for_a_project(
        organization_id_or_slug,
        project_id_or_slug,
        event_id,
        opts \\ []
      ) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [
        organization_id_or_slug: organization_id_or_slug,
        project_id_or_slug: project_id_or_slug,
        event_id: event_id
      ],
      call: {Events, :retrieve_an_event_for_a_project},
      url: "/api/0/projects/#{organization_id_or_slug}/#{project_id_or_slug}/events/#{event_id}/",
      method: :get,
      response: [{200, {EventDetailed, :t}}, {403, :null}],
      opts: opts
    })
  end

  @doc """
  get `/api/0/organizations/{organization_id_or_slug}/issues/{issue_id}/`

  Return details on an individual issue. This returns the basic stats for the issue (title, last seen, first seen), some overall numbers (number of comments, user reports) as well as the summarized event data.
  """
  @spec retrieve_an_issue(String.t(), String.t(), keyword) :: {:ok, IssueDetailed.t()} | :error
  def retrieve_an_issue(organization_id_or_slug, issue_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug, issue_id: issue_id],
      call: {Events, :retrieve_an_issue},
      url: "/api/0/organizations/#{organization_id_or_slug}/issues/#{issue_id}/",
      method: :get,
      response: [{200, {IssueDetailed, :t}}, {403, :null}],
      opts: opts
    })
  end

  @type retrieve_tag_details_200_json_resp :: %{key: String.t(), totalValues: integer}

  @doc """
  get `/api/0/organizations/{organization_id_or_slug}/issues/{issue_id}/tags/{key}/`

  Returns details for given tag key related to an issue.
  """
  @spec retrieve_tag_details(String.t(), String.t(), String.t(), keyword) :: {:ok, map} | :error
  def retrieve_tag_details(organization_id_or_slug, issue_id, key, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug, issue_id: issue_id, key: key],
      call: {Events, :retrieve_tag_details},
      url: "/api/0/organizations/#{organization_id_or_slug}/issues/#{issue_id}/tags/#{key}/",
      method: :get,
      response: [{200, {Events, :retrieve_tag_details_200_json_resp}}, {403, :null}],
      opts: opts
    })
  end

  @doc """
  get `/api/0/organizations/{organization_id_or_slug}/issues/{issue_id}/events/latest/`

  Retrieves the details of the latest event for an issue.
  """
  @spec retrieve_the_latest_event_for_an_issue(String.t(), String.t(), keyword) ::
          {:ok, EventDetailed.t()} | :error
  def retrieve_the_latest_event_for_an_issue(organization_id_or_slug, issue_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug, issue_id: issue_id],
      call: {Events, :retrieve_the_latest_event_for_an_issue},
      url: "/api/0/organizations/#{organization_id_or_slug}/issues/#{issue_id}/events/latest/",
      method: :get,
      response: [{200, {EventDetailed, :t}}, {403, :null}],
      opts: opts
    })
  end

  @doc """
  get `/api/0/organizations/{organization_id_or_slug}/issues/{issue_id}/events/oldest/`

  Retrieves the details of the oldest event for an issue.
  """
  @spec retrieve_the_oldest_event_for_an_issue(String.t(), String.t(), keyword) ::
          {:ok, EventDetailed.t()} | :error
  def retrieve_the_oldest_event_for_an_issue(organization_id_or_slug, issue_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug, issue_id: issue_id],
      call: {Events, :retrieve_the_oldest_event_for_an_issue},
      url: "/api/0/organizations/#{organization_id_or_slug}/issues/#{issue_id}/events/oldest/",
      method: :get,
      response: [{200, {EventDetailed, :t}}, {403, :null}],
      opts: opts
    })
  end

  @doc """
  put `/api/0/organizations/{organization_id_or_slug}/issues/{issue_id}/`

  Updates an individual issue's attributes.  Only the attributes submitted are modified.
  """
  @spec update_an_issue(String.t(), String.t(), map, keyword) :: {:ok, IssueNoStats.t()} | :error
  def update_an_issue(organization_id_or_slug, issue_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug, issue_id: issue_id, body: body],
      call: {Events, :update_an_issue},
      url: "/api/0/organizations/#{organization_id_or_slug}/issues/#{issue_id}/",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [{200, {IssueNoStats, :t}}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:bulk_mutate_a_list_of_issues_200_json_resp) do
    [
      isPublic: :boolean,
      status: {:enum, ["resolved", "unresolved", "ignored"]},
      statusDetails: :map
    ]
  end

  def __fields__(:list_a_tag_s_values_related_to_an_issue_200_json_resp) do
    [key: {:string, :generic}, value: {:string, :generic}]
  end

  def __fields__(:list_an_issue_s_hashes_200_json_resp) do
    [id: {:string, :generic}, latestEvent: {Hash, :t}]
  end

  def __fields__(:retrieve_tag_details_200_json_resp) do
    [key: {:string, :generic}, totalValues: :integer]
  end
end
