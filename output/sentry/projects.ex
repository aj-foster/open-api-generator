defmodule Projects do
  @moduledoc """
  Provides API endpoints related to projects
  """

  @default_client Client

  @doc """
  delete `/api/0/projects/{organization_id_or_slug}/{project_id_or_slug}/files/dsyms/`

  Delete a debug information file for a given project.

  ## Options

    * `id`: The ID of the DIF to delete.

  """
  @spec delete_a_specific_project_s_debug_information_file(String.t(), String.t(), keyword) ::
          :ok | :error
  def delete_a_specific_project_s_debug_information_file(
        organization_id_or_slug,
        project_id_or_slug,
        opts \\ []
      ) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:id])

    client.request(%{
      args: [
        organization_id_or_slug: organization_id_or_slug,
        project_id_or_slug: project_id_or_slug
      ],
      call: {Projects, :delete_a_specific_project_s_debug_information_file},
      url: "/api/0/projects/#{organization_id_or_slug}/#{project_id_or_slug}/files/dsyms/",
      method: :delete,
      query: query,
      response: [{204, :null}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  delete `/api/0/organizations/{organization_id_or_slug}/spike-protections/`

  Disables Spike Protection feature for some of the projects within the organization.
  """
  @spec disable_spike_protection(String.t(), map, keyword) :: :ok | :error
  def disable_spike_protection(organization_id_or_slug, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug, body: body],
      call: {Projects, :disable_spike_protection},
      url: "/api/0/organizations/#{organization_id_or_slug}/spike-protections/",
      body: body,
      method: :delete,
      request: [{"application/json", :map}],
      response: [{200, :null}, {400, :null}, {403, :null}],
      opts: opts
    })
  end

  @doc """
  post `/api/0/organizations/{organization_id_or_slug}/spike-protections/`

  Enables Spike Protection feature for some of the projects within the organization.
  """
  @spec enable_spike_protection(String.t(), map, keyword) :: :ok | :error
  def enable_spike_protection(organization_id_or_slug, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug, body: body],
      call: {Projects, :enable_spike_protection},
      url: "/api/0/organizations/#{organization_id_or_slug}/spike-protections/",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{201, :null}, {400, :null}, {403, :null}],
      opts: opts
    })
  end

  @doc """
  get `/api/0/projects/{organization_id_or_slug}/{project_id_or_slug}/files/dsyms/`

  Retrieve a list of debug information files for a given project.
  """
  @spec list_a_project_s_debug_information_files(String.t(), String.t(), keyword) ::
          {:ok, any} | :error
  def list_a_project_s_debug_information_files(
        organization_id_or_slug,
        project_id_or_slug,
        opts \\ []
      ) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [
        organization_id_or_slug: organization_id_or_slug,
        project_id_or_slug: project_id_or_slug
      ],
      call: {Projects, :list_a_project_s_debug_information_files},
      url: "/api/0/projects/#{organization_id_or_slug}/#{project_id_or_slug}/files/dsyms/",
      method: :get,
      response: [{200, :unknown}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  get `/api/0/projects/{organization_id_or_slug}/{project_id_or_slug}/hooks/`

  Return a list of service hooks bound to a project.

  ## Options

    * `cursor`: A pointer to the last object fetched and its sort order; used to retrieve the next or previous results.

  """
  @spec list_a_project_s_service_hooks(String.t(), String.t(), keyword) ::
          {:ok, [ServiceHook.t()]} | :error
  def list_a_project_s_service_hooks(organization_id_or_slug, project_id_or_slug, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor])

    client.request(%{
      args: [
        organization_id_or_slug: organization_id_or_slug,
        project_id_or_slug: project_id_or_slug
      ],
      call: {Projects, :list_a_project_s_service_hooks},
      url: "/api/0/projects/#{organization_id_or_slug}/#{project_id_or_slug}/hooks/",
      method: :get,
      query: query,
      response: [{200, [{ServiceHook, :t}]}, {403, :null}],
      opts: opts
    })
  end

  @doc """
  get `/api/0/projects/{organization_id_or_slug}/{project_id_or_slug}/user-feedback/`

  Return a list of user feedback items within this project.
  """
  @spec list_a_project_s_user_feedback(String.t(), String.t(), keyword) ::
          {:ok, [UserFeedback.t()]} | :error
  def list_a_project_s_user_feedback(organization_id_or_slug, project_id_or_slug, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [
        organization_id_or_slug: organization_id_or_slug,
        project_id_or_slug: project_id_or_slug
      ],
      call: {Projects, :list_a_project_s_user_feedback},
      url: "/api/0/projects/#{organization_id_or_slug}/#{project_id_or_slug}/user-feedback/",
      method: :get,
      response: [{200, [{UserFeedback, :t}]}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @type list_a_project_s_users_200_json_resp :: %{
          email: String.t() | nil,
          username: String.t() | nil
        }

  @doc """
  get `/api/0/projects/{organization_id_or_slug}/{project_id_or_slug}/users/`

  Return a list of users seen within this project.

  ## Options

    * `query`: Limit results to users matching the given query. Prefixes should be used to suggest the field to match on: `id`, `email`, `username`, `ip`. For example, `query=email:foo@example.com`

  """
  @spec list_a_project_s_users(String.t(), String.t(), keyword) :: {:ok, [map]} | :error
  def list_a_project_s_users(organization_id_or_slug, project_id_or_slug, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:query])

    client.request(%{
      args: [
        organization_id_or_slug: organization_id_or_slug,
        project_id_or_slug: project_id_or_slug
      ],
      call: {Projects, :list_a_project_s_users},
      url: "/api/0/projects/#{organization_id_or_slug}/#{project_id_or_slug}/users/",
      method: :get,
      query: query,
      response: [{200, [{Projects, :list_a_project_s_users_200_json_resp}]}, {403, :null}],
      opts: opts
    })
  end

  @type list_a_tag_s_values_200_json_resp :: %{name: String.t()}

  @doc """
  get `/api/0/projects/{organization_id_or_slug}/{project_id_or_slug}/tags/{key}/values/`

  Return a list of values associated with this key.  The `query`
  parameter can be used to to perform a "contains" match on
  values. 

  When [paginated](/api/pagination) can return at most 1000 values.
  """
  @spec list_a_tag_s_values(String.t(), String.t(), String.t(), keyword) :: {:ok, [map]} | :error
  def list_a_tag_s_values(organization_id_or_slug, project_id_or_slug, key, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [
        organization_id_or_slug: organization_id_or_slug,
        project_id_or_slug: project_id_or_slug,
        key: key
      ],
      call: {Projects, :list_a_tag_s_values},
      url: "/api/0/projects/#{organization_id_or_slug}/#{project_id_or_slug}/tags/#{key}/values/",
      method: :get,
      response: [{200, [{Projects, :list_a_tag_s_values_200_json_resp}]}, {403, :null}],
      opts: opts
    })
  end

  @type list_your_projects_200_json_resp :: %{
          avatar: Avatar.t(),
          color: String.t(),
          dateCreated: DateTime.t(),
          features: [String.t()],
          firstEvent: String.t() | nil,
          hasAccess: boolean,
          id: String.t(),
          isBookmarked: boolean,
          isInternal: boolean,
          isMember: boolean,
          isPublic: boolean,
          name: String.t(),
          organization: Organization.t(),
          platform: String.t() | nil,
          slug: String.t(),
          status: String.t()
        }

  @doc """
  get `/api/0/projects/`

  Return a list of projects available to the authenticated session.

  ## Options

    * `cursor`: A pointer to the last object fetched and its sort order; used to retrieve the next or previous results.

  """
  @spec list_your_projects(keyword) :: {:ok, [map]} | :error
  def list_your_projects(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor])

    client.request(%{
      args: [],
      call: {Projects, :list_your_projects},
      url: "/api/0/projects/",
      method: :get,
      query: query,
      response: [{200, [{Projects, :list_your_projects_200_json_resp}]}, {403, :null}],
      opts: opts
    })
  end

  @doc """
  post `/api/0/projects/{organization_id_or_slug}/{project_id_or_slug}/hooks/`

  Register a new service hook on a project.

  Events include:

  - event.alert: An alert is generated for an event (via rules).
  - event.created: A new event has been processed.

  This endpoint requires the 'servicehooks' feature to be enabled for your project.
  """
  @spec register_a_new_service_hook(String.t(), String.t(), map, keyword) ::
          {:ok, ServiceHook.t()} | :error
  def register_a_new_service_hook(organization_id_or_slug, project_id_or_slug, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [
        organization_id_or_slug: organization_id_or_slug,
        project_id_or_slug: project_id_or_slug,
        body: body
      ],
      call: {Projects, :register_a_new_service_hook},
      url: "/api/0/projects/#{organization_id_or_slug}/#{project_id_or_slug}/hooks/",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{201, {ServiceHook, :t}}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  delete `/api/0/projects/{organization_id_or_slug}/{project_id_or_slug}/hooks/{hook_id}/`

  Remove a service hook.
  """
  @spec remove_a_service_hook(String.t(), String.t(), String.t(), keyword) :: :ok | :error
  def remove_a_service_hook(organization_id_or_slug, project_id_or_slug, hook_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [
        organization_id_or_slug: organization_id_or_slug,
        project_id_or_slug: project_id_or_slug,
        hook_id: hook_id
      ],
      call: {Projects, :remove_a_service_hook},
      url: "/api/0/projects/#{organization_id_or_slug}/#{project_id_or_slug}/hooks/#{hook_id}/",
      method: :delete,
      response: [{204, :null}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  get `/api/0/projects/{organization_id_or_slug}/{project_id_or_slug}/hooks/{hook_id}/`

  Return a service hook bound to a project.
  """
  @spec retrieve_a_service_hook(String.t(), String.t(), String.t(), keyword) ::
          {:ok, ServiceHook.t()} | :error
  def retrieve_a_service_hook(organization_id_or_slug, project_id_or_slug, hook_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [
        organization_id_or_slug: organization_id_or_slug,
        project_id_or_slug: project_id_or_slug,
        hook_id: hook_id
      ],
      call: {Projects, :retrieve_a_service_hook},
      url: "/api/0/projects/#{organization_id_or_slug}/#{project_id_or_slug}/hooks/#{hook_id}/",
      method: :get,
      response: [{200, {ServiceHook, :t}}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Caution
  This endpoint may change in the future without  notice.

  Return a set of points representing a normalized timestamp and the
  number of events seen in the period.

  Query ranges are limited to Sentry's configured time-series resolutions.

  ## Options

    * `stat`: The name of the stat to query `("received", "rejected", "blacklisted", "generated")`.
    * `since`: A timestamp to set the start of the query in seconds since UNIX epoch.
    * `until`: A timestamp to set the end of the query in seconds since UNIX epoch.
    * `resolution`: An explicit resolution to search for (one of `10s`, `1h`, and `1d`).

  """
  @spec retrieve_event_counts_for_a_project(String.t(), String.t(), keyword) ::
          {:ok, [[integer]]} | :error
  def retrieve_event_counts_for_a_project(organization_id_or_slug, project_id_or_slug, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:resolution, :since, :stat, :until])

    client.request(%{
      args: [
        organization_id_or_slug: organization_id_or_slug,
        project_id_or_slug: project_id_or_slug
      ],
      call: {Projects, :retrieve_event_counts_for_a_project},
      url: "/api/0/projects/#{organization_id_or_slug}/#{project_id_or_slug}/stats/",
      method: :get,
      query: query,
      response: [{200, [[:integer]]}, {403, :null}],
      opts: opts
    })
  end

  @doc """
  post `/api/0/projects/{organization_id_or_slug}/{project_id_or_slug}/user-feedback/`

  Submit and associate user feedback with an issue.

  Feedback must be received by the server no more than 30 minutes after the event was saved.

  Additionally, within 5 minutes of submitting feedback it may also be overwritten. This is useful in situations where you may need to retry sending a request due to network failures.

  If feedback is rejected due to a mutability threshold, a 409 status code will be returned.

  Note: Feedback may be submitted with DSN authentication (see auth documentation).
  """
  @spec submit_user_feedback(String.t(), String.t(), map, keyword) ::
          {:ok, UserFeedback.t()} | :error
  def submit_user_feedback(organization_id_or_slug, project_id_or_slug, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [
        organization_id_or_slug: organization_id_or_slug,
        project_id_or_slug: project_id_or_slug,
        body: body
      ],
      call: {Projects, :submit_user_feedback},
      url: "/api/0/projects/#{organization_id_or_slug}/#{project_id_or_slug}/user-feedback/",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, {UserFeedback, :t}},
        {400, :null},
        {403, :null},
        {404, :null},
        {409, :null}
      ],
      opts: opts
    })
  end

  @doc """
  put `/api/0/projects/{organization_id_or_slug}/{project_id_or_slug}/hooks/{hook_id}/`

  Update a service hook.
  """
  @spec update_a_service_hook(String.t(), String.t(), String.t(), map, keyword) ::
          {:ok, ServiceHook.t()} | :error
  def update_a_service_hook(
        organization_id_or_slug,
        project_id_or_slug,
        hook_id,
        body,
        opts \\ []
      ) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [
        organization_id_or_slug: organization_id_or_slug,
        project_id_or_slug: project_id_or_slug,
        hook_id: hook_id,
        body: body
      ],
      call: {Projects, :update_a_service_hook},
      url: "/api/0/projects/#{organization_id_or_slug}/#{project_id_or_slug}/hooks/#{hook_id}/",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [{200, {ServiceHook, :t}}, {400, :null}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  post `/api/0/projects/{organization_id_or_slug}/{project_id_or_slug}/files/dsyms/`

  Upload a new debug information file for the given release.

  Unlike other API requests, files must be uploaded using the
  traditional multipart/form-data content-type.

  The file uploaded is a zip archive of an Apple .dSYM folder which
  contains the individual debug images.  Uploading through this endpoint
  will create different files for the contained images.
  """
  @spec upload_a_new_file(String.t(), String.t(), map, keyword) :: {:ok, any} | :error
  def upload_a_new_file(organization_id_or_slug, project_id_or_slug, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [
        organization_id_or_slug: organization_id_or_slug,
        project_id_or_slug: project_id_or_slug,
        body: body
      ],
      call: {Projects, :upload_a_new_file},
      url: "/api/0/projects/#{organization_id_or_slug}/#{project_id_or_slug}/files/dsyms/",
      body: body,
      method: :post,
      request: [{"multipart/form-data", :map}],
      response: [{201, :unknown}, {400, :null}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:list_a_project_s_users_200_json_resp) do
    [email: {:string, :generic}, username: {:string, :generic}]
  end

  def __fields__(:list_a_tag_s_values_200_json_resp) do
    [name: {:string, :generic}]
  end

  def __fields__(:list_your_projects_200_json_resp) do
    [
      avatar: {Avatar, :t},
      color: {:string, :generic},
      dateCreated: {:string, :date_time},
      features: [string: :generic],
      firstEvent: {:string, :generic},
      hasAccess: :boolean,
      id: {:string, :generic},
      isBookmarked: :boolean,
      isInternal: :boolean,
      isMember: :boolean,
      isPublic: :boolean,
      name: {:string, :generic},
      organization: {Organization, :t},
      platform: {:string, :generic},
      slug: {:string, :generic},
      status: {:enum, ["active", "disabled", "pending_deletion", "deletion_in_progress"]}
    ]
  end
end
