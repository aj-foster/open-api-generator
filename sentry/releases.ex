defmodule Sentry.Releases do
  @moduledoc """
  Provides API endpoints related to releases
  """

  @default_client Sentry.Client

  @doc """
  post `/api/0/organizations/{organization_id_or_slug}/releases/{version}/deploys/`

  Create a deploy.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_a_new_deploy_for_an_organization(
          organization_id_or_slug :: String.t(),
          version :: String.t(),
          body :: map
        ) :: {:ok, Sentry.Deploy.t()} | :error
  @spec create_a_new_deploy_for_an_organization(
          organization_id_or_slug :: String.t(),
          version :: String.t(),
          body :: map,
          opts :: keyword
        ) :: {:ok, Sentry.Deploy.t()} | :error
  def create_a_new_deploy_for_an_organization(organization_id_or_slug, version, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug, version: version, body: body],
      call: {Sentry.Releases, :create_a_new_deploy_for_an_organization},
      url: "/api/0/organizations/#{organization_id_or_slug}/releases/#{version}/deploys/",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{201, {Sentry.Deploy, :t}}, {208, :null}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  post `/api/0/organizations/{organization_id_or_slug}/releases/`

  Create a new release for the given organization.  Releases are used by
  Sentry to improve its error reporting abilities by correlating
  first seen events with the release that might have introduced the
  problem.
  Releases are also necessary for source maps and other debug features
  that require manual upload for functioning well.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_a_new_release_for_an_organization(
          organization_id_or_slug :: String.t(),
          body :: map
        ) :: {:ok, Sentry.OrganizationRelease.t()} | :error
  @spec create_a_new_release_for_an_organization(
          organization_id_or_slug :: String.t(),
          body :: map,
          opts :: keyword
        ) :: {:ok, Sentry.OrganizationRelease.t()} | :error
  def create_a_new_release_for_an_organization(organization_id_or_slug, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug, body: body],
      call: {Sentry.Releases, :create_a_new_release_for_an_organization},
      url: "/api/0/organizations/#{organization_id_or_slug}/releases/",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{201, {Sentry.OrganizationRelease, :t}}, {400, :null}, {403, :null}],
      opts: opts
    })
  end

  @doc """
  delete `/api/0/projects/{organization_id_or_slug}/{project_id_or_slug}/releases/{version}/files/{file_id}/`

  Delete a file for a given release.
  """
  @spec delete_a_project_release_s_file(
          organization_id_or_slug :: String.t(),
          project_id_or_slug :: String.t(),
          version :: String.t(),
          file_id :: String.t()
        ) :: :ok | :error
  @spec delete_a_project_release_s_file(
          organization_id_or_slug :: String.t(),
          project_id_or_slug :: String.t(),
          version :: String.t(),
          file_id :: String.t(),
          opts :: keyword
        ) :: :ok | :error
  def delete_a_project_release_s_file(
        organization_id_or_slug,
        project_id_or_slug,
        version,
        file_id,
        opts \\ []
      ) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [
        organization_id_or_slug: organization_id_or_slug,
        project_id_or_slug: project_id_or_slug,
        version: version,
        file_id: file_id
      ],
      call: {Sentry.Releases, :delete_a_project_release_s_file},
      url:
        "/api/0/projects/#{organization_id_or_slug}/#{project_id_or_slug}/releases/#{version}/files/#{file_id}/",
      method: :delete,
      response: [{204, :null}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  delete `/api/0/organizations/{organization_id_or_slug}/releases/{version}/files/{file_id}/`

  Delete a file for a given release.
  """
  @spec delete_an_organization_release_s_file(
          organization_id_or_slug :: String.t(),
          version :: String.t(),
          file_id :: String.t()
        ) :: :ok | :error
  @spec delete_an_organization_release_s_file(
          organization_id_or_slug :: String.t(),
          version :: String.t(),
          file_id :: String.t(),
          opts :: keyword
        ) :: :ok | :error
  def delete_an_organization_release_s_file(organization_id_or_slug, version, file_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug, version: version, file_id: file_id],
      call: {Sentry.Releases, :delete_an_organization_release_s_file},
      url:
        "/api/0/organizations/#{organization_id_or_slug}/releases/#{version}/files/#{file_id}/",
      method: :delete,
      response: [{204, :null}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  delete `/api/0/organizations/{organization_id_or_slug}/releases/{version}/`

  Delete a release for a given organization.
  """
  @spec delete_an_organization_s_release(
          organization_id_or_slug :: String.t(),
          version :: String.t()
        ) :: :ok | :error
  @spec delete_an_organization_s_release(
          organization_id_or_slug :: String.t(),
          version :: String.t(),
          opts :: keyword
        ) :: :ok | :error
  def delete_an_organization_s_release(organization_id_or_slug, version, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug, version: version],
      call: {Sentry.Releases, :delete_an_organization_s_release},
      url: "/api/0/organizations/#{organization_id_or_slug}/releases/#{version}/",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  get `/api/0/projects/{organization_id_or_slug}/{project_id_or_slug}/releases/{version}/commits/`

  List a project release's commits.
  """
  @spec list_a_project_release_s_commits(
          organization_id_or_slug :: String.t(),
          project_id_or_slug :: String.t(),
          version :: String.t()
        ) :: {:ok, [Sentry.MinimalCommit.t()]} | :error
  @spec list_a_project_release_s_commits(
          organization_id_or_slug :: String.t(),
          project_id_or_slug :: String.t(),
          version :: String.t(),
          opts :: keyword
        ) :: {:ok, [Sentry.MinimalCommit.t()]} | :error
  def list_a_project_release_s_commits(
        organization_id_or_slug,
        project_id_or_slug,
        version,
        opts \\ []
      ) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [
        organization_id_or_slug: organization_id_or_slug,
        project_id_or_slug: project_id_or_slug,
        version: version
      ],
      call: {Sentry.Releases, :list_a_project_release_s_commits},
      url:
        "/api/0/projects/#{organization_id_or_slug}/#{project_id_or_slug}/releases/#{version}/commits/",
      method: :get,
      response: [{200, [{Sentry.MinimalCommit, :t}]}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  get `/api/0/projects/{organization_id_or_slug}/{project_id_or_slug}/releases/{version}/files/`

  Return a list of files for a given release.
  """
  @spec list_a_project_s_release_files(
          organization_id_or_slug :: String.t(),
          project_id_or_slug :: String.t(),
          version :: String.t()
        ) :: {:ok, [Sentry.ReleaseFile.t()]} | :error
  @spec list_a_project_s_release_files(
          organization_id_or_slug :: String.t(),
          project_id_or_slug :: String.t(),
          version :: String.t(),
          opts :: keyword
        ) :: {:ok, [Sentry.ReleaseFile.t()]} | :error
  def list_a_project_s_release_files(
        organization_id_or_slug,
        project_id_or_slug,
        version,
        opts \\ []
      ) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [
        organization_id_or_slug: organization_id_or_slug,
        project_id_or_slug: project_id_or_slug,
        version: version
      ],
      call: {Sentry.Releases, :list_a_project_s_release_files},
      url:
        "/api/0/projects/#{organization_id_or_slug}/#{project_id_or_slug}/releases/#{version}/files/",
      method: :get,
      response: [{200, [{Sentry.ReleaseFile, :t}]}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  get `/api/0/organizations/{organization_id_or_slug}/releases/{version}/deploys/`

  Return a list of deploys for a given release.
  """
  @spec list_a_release_s_deploys(organization_id_or_slug :: String.t(), version :: String.t()) ::
          {:ok, [Sentry.Deploy.t()]} | :error
  @spec list_a_release_s_deploys(
          organization_id_or_slug :: String.t(),
          version :: String.t(),
          opts :: keyword
        ) :: {:ok, [Sentry.Deploy.t()]} | :error
  def list_a_release_s_deploys(organization_id_or_slug, version, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug, version: version],
      call: {Sentry.Releases, :list_a_release_s_deploys},
      url: "/api/0/organizations/#{organization_id_or_slug}/releases/#{version}/deploys/",
      method: :get,
      response: [{200, [{Sentry.Deploy, :t}]}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  get `/api/0/organizations/{organization_id_or_slug}/releases/{version}/commits/`

  List an organization release's commits.
  """
  @spec list_an_organization_release_s_commits(
          organization_id_or_slug :: String.t(),
          version :: String.t()
        ) :: {:ok, [Sentry.MinimalCommit.t()]} | :error
  @spec list_an_organization_release_s_commits(
          organization_id_or_slug :: String.t(),
          version :: String.t(),
          opts :: keyword
        ) :: {:ok, [Sentry.MinimalCommit.t()]} | :error
  def list_an_organization_release_s_commits(organization_id_or_slug, version, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug, version: version],
      call: {Sentry.Releases, :list_an_organization_release_s_commits},
      url: "/api/0/organizations/#{organization_id_or_slug}/releases/#{version}/commits/",
      method: :get,
      response: [{200, [{Sentry.MinimalCommit, :t}]}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  get `/api/0/organizations/{organization_id_or_slug}/releases/{version}/files/`

  Return a list of files for a given release.
  """
  @spec list_an_organization_s_release_files(
          organization_id_or_slug :: String.t(),
          version :: String.t()
        ) :: {:ok, [Sentry.ReleaseFile.t()]} | :error
  @spec list_an_organization_s_release_files(
          organization_id_or_slug :: String.t(),
          version :: String.t(),
          opts :: keyword
        ) :: {:ok, [Sentry.ReleaseFile.t()]} | :error
  def list_an_organization_s_release_files(organization_id_or_slug, version, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug, version: version],
      call: {Sentry.Releases, :list_an_organization_s_release_files},
      url: "/api/0/organizations/#{organization_id_or_slug}/releases/#{version}/files/",
      method: :get,
      response: [{200, [{Sentry.ReleaseFile, :t}]}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  get `/api/0/organizations/{organization_id_or_slug}/releases/`

  Return a list of releases for a given organization.

  ## Options

    * `query`: This parameter can be used to create a "starts with" filter for the version.

  """
  @spec list_an_organization_s_releases(organization_id_or_slug :: String.t()) ::
          {:ok, [Sentry.OrganizationRelease.t()]} | :error
  @spec list_an_organization_s_releases(organization_id_or_slug :: String.t(), opts :: keyword) ::
          {:ok, [Sentry.OrganizationRelease.t()]} | :error
  def list_an_organization_s_releases(organization_id_or_slug, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:query])

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug],
      call: {Sentry.Releases, :list_an_organization_s_releases},
      url: "/api/0/organizations/#{organization_id_or_slug}/releases/",
      method: :get,
      query: query,
      response: [
        {200, [{Sentry.OrganizationRelease, :t}]},
        {401, :null},
        {403, :null},
        {404, :null}
      ],
      opts: opts
    })
  end

  @doc """
  get `/api/0/projects/{organization_id_or_slug}/{project_id_or_slug}/releases/{version}/files/{file_id}/`

  Retrieve a file for a given release.

  ## Options

    * `download`: If this is set to true, then the response payload will be the raw file contents. Otherwise, the response will be the file metadata as JSON.

  """
  @spec retrieve_a_project_release_s_file(
          organization_id_or_slug :: String.t(),
          project_id_or_slug :: String.t(),
          version :: String.t(),
          file_id :: String.t()
        ) :: {:ok, Sentry.ReleaseFile.t()} | :error
  @spec retrieve_a_project_release_s_file(
          organization_id_or_slug :: String.t(),
          project_id_or_slug :: String.t(),
          version :: String.t(),
          file_id :: String.t(),
          opts :: keyword
        ) :: {:ok, Sentry.ReleaseFile.t()} | :error
  def retrieve_a_project_release_s_file(
        organization_id_or_slug,
        project_id_or_slug,
        version,
        file_id,
        opts \\ []
      ) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:download])

    client.request(%{
      args: [
        organization_id_or_slug: organization_id_or_slug,
        project_id_or_slug: project_id_or_slug,
        version: version,
        file_id: file_id
      ],
      call: {Sentry.Releases, :retrieve_a_project_release_s_file},
      url:
        "/api/0/projects/#{organization_id_or_slug}/#{project_id_or_slug}/releases/#{version}/files/#{file_id}/",
      method: :get,
      query: query,
      response: [{200, {Sentry.ReleaseFile, :t}}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  get `/api/0/organizations/{organization_id_or_slug}/releases/{version}/files/{file_id}/`

  Retrieve a file for a given release.

  ## Options

    * `download`: If this is set to true, then the response payload will be the raw file contents. Otherwise, the response will be the file metadata as JSON.

  """
  @spec retrieve_an_organization_release_s_file(
          organization_id_or_slug :: String.t(),
          version :: String.t(),
          file_id :: String.t()
        ) :: {:ok, Sentry.ReleaseFile.t()} | :error
  @spec retrieve_an_organization_release_s_file(
          organization_id_or_slug :: String.t(),
          version :: String.t(),
          file_id :: String.t(),
          opts :: keyword
        ) :: {:ok, Sentry.ReleaseFile.t()} | :error
  def retrieve_an_organization_release_s_file(
        organization_id_or_slug,
        version,
        file_id,
        opts \\ []
      ) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:download])

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug, version: version, file_id: file_id],
      call: {Sentry.Releases, :retrieve_an_organization_release_s_file},
      url:
        "/api/0/organizations/#{organization_id_or_slug}/releases/#{version}/files/#{file_id}/",
      method: :get,
      query: query,
      response: [{200, {Sentry.ReleaseFile, :t}}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  get `/api/0/organizations/{organization_id_or_slug}/releases/{version}/`

  Return a release for a given organization.
  """
  @spec retrieve_an_organization_s_releases(
          organization_id_or_slug :: String.t(),
          version :: String.t()
        ) :: {:ok, Sentry.OrganizationRelease.t()} | :error
  @spec retrieve_an_organization_s_releases(
          organization_id_or_slug :: String.t(),
          version :: String.t(),
          opts :: keyword
        ) :: {:ok, Sentry.OrganizationRelease.t()} | :error
  def retrieve_an_organization_s_releases(organization_id_or_slug, version, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug, version: version],
      call: {Sentry.Releases, :retrieve_an_organization_s_releases},
      url: "/api/0/organizations/#{organization_id_or_slug}/releases/#{version}/",
      method: :get,
      response: [{200, {Sentry.OrganizationRelease, :t}}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  get `/api/0/organizations/{organization_id_or_slug}/releases/{version}/commitfiles/`

  Retrieve files changed in a release's commits
  """
  @spec retrieve_files_changed_in_a_release_s_commits(
          organization_id_or_slug :: String.t(),
          version :: String.t()
        ) :: :ok | :error
  @spec retrieve_files_changed_in_a_release_s_commits(
          organization_id_or_slug :: String.t(),
          version :: String.t(),
          opts :: keyword
        ) :: :ok | :error
  def retrieve_files_changed_in_a_release_s_commits(organization_id_or_slug, version, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug, version: version],
      call: {Sentry.Releases, :retrieve_files_changed_in_a_release_s_commits},
      url: "/api/0/organizations/#{organization_id_or_slug}/releases/#{version}/commitfiles/",
      method: :get,
      response: [{200, :null}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  put `/api/0/projects/{organization_id_or_slug}/{project_id_or_slug}/releases/{version}/files/{file_id}/`

  Update a project release file.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_a_project_release_file(
          organization_id_or_slug :: String.t(),
          project_id_or_slug :: String.t(),
          version :: String.t(),
          file_id :: String.t(),
          body :: map
        ) :: {:ok, Sentry.ReleaseFile.t()} | :error
  @spec update_a_project_release_file(
          organization_id_or_slug :: String.t(),
          project_id_or_slug :: String.t(),
          version :: String.t(),
          file_id :: String.t(),
          body :: map,
          opts :: keyword
        ) :: {:ok, Sentry.ReleaseFile.t()} | :error
  def update_a_project_release_file(
        organization_id_or_slug,
        project_id_or_slug,
        version,
        file_id,
        body,
        opts \\ []
      ) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [
        organization_id_or_slug: organization_id_or_slug,
        project_id_or_slug: project_id_or_slug,
        version: version,
        file_id: file_id,
        body: body
      ],
      call: {Sentry.Releases, :update_a_project_release_file},
      url:
        "/api/0/projects/#{organization_id_or_slug}/#{project_id_or_slug}/releases/#{version}/files/#{file_id}/",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [{200, {Sentry.ReleaseFile, :t}}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  put `/api/0/organizations/{organization_id_or_slug}/releases/{version}/files/{file_id}/`

  Update an organization release file.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_an_organization_release_file(
          organization_id_or_slug :: String.t(),
          version :: String.t(),
          file_id :: String.t(),
          body :: map
        ) :: {:ok, Sentry.ReleaseFile.t()} | :error
  @spec update_an_organization_release_file(
          organization_id_or_slug :: String.t(),
          version :: String.t(),
          file_id :: String.t(),
          body :: map,
          opts :: keyword
        ) :: {:ok, Sentry.ReleaseFile.t()} | :error
  def update_an_organization_release_file(
        organization_id_or_slug,
        version,
        file_id,
        body,
        opts \\ []
      ) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [
        organization_id_or_slug: organization_id_or_slug,
        version: version,
        file_id: file_id,
        body: body
      ],
      call: {Sentry.Releases, :update_an_organization_release_file},
      url:
        "/api/0/organizations/#{organization_id_or_slug}/releases/#{version}/files/#{file_id}/",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [{200, {Sentry.ReleaseFile, :t}}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  put `/api/0/organizations/{organization_id_or_slug}/releases/{version}/`

  Update a release for a given organization.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_an_organization_s_release(
          organization_id_or_slug :: String.t(),
          version :: String.t(),
          body :: map
        ) :: {:ok, Sentry.OrganizationRelease.t()} | :error
  @spec update_an_organization_s_release(
          organization_id_or_slug :: String.t(),
          version :: String.t(),
          body :: map,
          opts :: keyword
        ) :: {:ok, Sentry.OrganizationRelease.t()} | :error
  def update_an_organization_s_release(organization_id_or_slug, version, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug, version: version, body: body],
      call: {Sentry.Releases, :update_an_organization_s_release},
      url: "/api/0/organizations/#{organization_id_or_slug}/releases/#{version}/",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [{200, {Sentry.OrganizationRelease, :t}}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  post `/api/0/organizations/{organization_id_or_slug}/releases/{version}/files/`

  Upload a new organization release file.

  ## Request Body

  **Content Types**: `multipart/form-data`
  """
  @spec upload_a_new_organization_release_file(
          organization_id_or_slug :: String.t(),
          version :: String.t(),
          body :: map
        ) :: :ok | :error
  @spec upload_a_new_organization_release_file(
          organization_id_or_slug :: String.t(),
          version :: String.t(),
          body :: map,
          opts :: keyword
        ) :: :ok | :error
  def upload_a_new_organization_release_file(organization_id_or_slug, version, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug, version: version, body: body],
      call: {Sentry.Releases, :upload_a_new_organization_release_file},
      url: "/api/0/organizations/#{organization_id_or_slug}/releases/#{version}/files/",
      body: body,
      method: :post,
      request: [{"multipart/form-data", :map}],
      response: [{201, :null}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  post `/api/0/projects/{organization_id_or_slug}/{project_id_or_slug}/releases/{version}/files/`

  Upload a new project release file.

  ## Request Body

  **Content Types**: `multipart/form-data`
  """
  @spec upload_a_new_project_release_file(
          organization_id_or_slug :: String.t(),
          project_id_or_slug :: String.t(),
          version :: String.t(),
          body :: map
        ) :: {:ok, Sentry.ReleaseFile.t()} | :error
  @spec upload_a_new_project_release_file(
          organization_id_or_slug :: String.t(),
          project_id_or_slug :: String.t(),
          version :: String.t(),
          body :: map,
          opts :: keyword
        ) :: {:ok, Sentry.ReleaseFile.t()} | :error
  def upload_a_new_project_release_file(
        organization_id_or_slug,
        project_id_or_slug,
        version,
        body,
        opts \\ []
      ) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [
        organization_id_or_slug: organization_id_or_slug,
        project_id_or_slug: project_id_or_slug,
        version: version,
        body: body
      ],
      call: {Sentry.Releases, :upload_a_new_project_release_file},
      url:
        "/api/0/projects/#{organization_id_or_slug}/#{project_id_or_slug}/releases/#{version}/files/",
      body: body,
      method: :post,
      request: [{"multipart/form-data", :map}],
      response: [{201, {Sentry.ReleaseFile, :t}}, {403, :null}, {404, :null}],
      opts: opts
    })
  end
end
