defmodule Projects do
  @moduledoc """
  Provides API endpoints related to projects
  """

  @default_client Client

  @doc """
  Archives a project in the organization. Archived projects cannot be used or updated.
  """
  @spec archive_project(project_id :: String.t(), opts :: keyword) :: {:ok, Project.t()} | :error
  def archive_project(project_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [project_id: project_id],
      call: {Projects, :archive_project},
      url: "/organization/projects/#{project_id}/archive",
      method: :post,
      response: [{200, {Project, :t}}],
      opts: opts
    })
  end

  @doc """
  Create a new project in the organization. Projects can be created and archived, but cannot be deleted.

  ## Request Body

  **Content Types**: `application/json`

  The project create request payload.
  """
  @spec create_project(body :: ProjectCreateRequest.t(), opts :: keyword) ::
          {:ok, Project.t()} | :error
  def create_project(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Projects, :create_project},
      url: "/organization/projects",
      body: body,
      method: :post,
      request: [{"application/json", {ProjectCreateRequest, :t}}],
      response: [{200, {Project, :t}}],
      opts: opts
    })
  end

  @doc """
  Creates a new service account in the project. This also returns an unredacted API key for the service account.

  ## Request Body

  **Content Types**: `application/json`

  The project service account create request payload.
  """
  @spec create_project_service_account(
          project_id :: String.t(),
          body :: ProjectServiceAccountCreateRequest.t(),
          opts :: keyword
        ) :: {:ok, ProjectServiceAccountCreateResponse.t()} | {:error, ErrorResponse.t()}
  def create_project_service_account(project_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [project_id: project_id, body: body],
      call: {Projects, :create_project_service_account},
      url: "/organization/projects/#{project_id}/service_accounts",
      body: body,
      method: :post,
      request: [{"application/json", {ProjectServiceAccountCreateRequest, :t}}],
      response: [{200, {ProjectServiceAccountCreateResponse, :t}}, {400, {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Adds a user to the project. Users must already be members of the organization to be added to a project.

  ## Request Body

  **Content Types**: `application/json`

  The project user create request payload.
  """
  @spec create_project_user(
          project_id :: String.t(),
          body :: ProjectUserCreateRequest.t(),
          opts :: keyword
        ) :: {:ok, ProjectUser.t()} | {:error, ErrorResponse.t()}
  def create_project_user(project_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [project_id: project_id, body: body],
      call: {Projects, :create_project_user},
      url: "/organization/projects/#{project_id}/users",
      body: body,
      method: :post,
      request: [{"application/json", {ProjectUserCreateRequest, :t}}],
      response: [{200, {ProjectUser, :t}}, {400, {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Deletes an API key from the project.
  """
  @spec delete_project_api_key(project_id :: String.t(), key_id :: String.t(), opts :: keyword) ::
          {:ok, ProjectApiKeyDeleteResponse.t()} | {:error, ErrorResponse.t()}
  def delete_project_api_key(project_id, key_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [project_id: project_id, key_id: key_id],
      call: {Projects, :delete_project_api_key},
      url: "/organization/projects/#{project_id}/api_keys/#{key_id}",
      method: :delete,
      response: [{200, {ProjectApiKeyDeleteResponse, :t}}, {400, {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Deletes a service account from the project.
  """
  @spec delete_project_service_account(
          project_id :: String.t(),
          service_account_id :: String.t(),
          opts :: keyword
        ) :: {:ok, ProjectServiceAccountDeleteResponse.t()} | :error
  def delete_project_service_account(project_id, service_account_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [project_id: project_id, service_account_id: service_account_id],
      call: {Projects, :delete_project_service_account},
      url: "/organization/projects/#{project_id}/service_accounts/#{service_account_id}",
      method: :delete,
      response: [{200, {ProjectServiceAccountDeleteResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Deletes a user from the project.
  """
  @spec delete_project_user(project_id :: String.t(), user_id :: String.t(), opts :: keyword) ::
          {:ok, ProjectUserDeleteResponse.t()} | {:error, ErrorResponse.t()}
  def delete_project_user(project_id, user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [project_id: project_id, user_id: user_id],
      call: {Projects, :delete_project_user},
      url: "/organization/projects/#{project_id}/users/#{user_id}",
      method: :delete,
      response: [{200, {ProjectUserDeleteResponse, :t}}, {400, {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Returns a list of API keys in the project.

  ## Options

    * `limit`: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
      
    * `after`: A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.
      

  """
  @spec list_project_api_keys(project_id :: String.t(), opts :: keyword) ::
          {:ok, ProjectApiKeyListResponse.t()} | :error
  def list_project_api_keys(project_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :limit])

    client.request(%{
      args: [project_id: project_id],
      call: {Projects, :list_project_api_keys},
      url: "/organization/projects/#{project_id}/api_keys",
      method: :get,
      query: query,
      response: [{200, {ProjectApiKeyListResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Returns the rate limits per model for a project.

  ## Options

    * `limit`: A limit on the number of objects to be returned. The default is 100.
      
    * `after`: A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.
      
    * `before`: A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, beginning with obj_foo, your subsequent call can include before=obj_foo in order to fetch the previous page of the list.
      

  """
  @spec list_project_rate_limits(project_id :: String.t(), opts :: keyword) ::
          {:ok, ProjectRateLimitListResponse.t()} | :error
  def list_project_rate_limits(project_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :before, :limit])

    client.request(%{
      args: [project_id: project_id],
      call: {Projects, :list_project_rate_limits},
      url: "/organization/projects/#{project_id}/rate_limits",
      method: :get,
      query: query,
      response: [{200, {ProjectRateLimitListResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Returns a list of service accounts in the project.

  ## Options

    * `limit`: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
      
    * `after`: A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.
      

  """
  @spec list_project_service_accounts(project_id :: String.t(), opts :: keyword) ::
          {:ok, ProjectServiceAccountListResponse.t()} | {:error, ErrorResponse.t()}
  def list_project_service_accounts(project_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :limit])

    client.request(%{
      args: [project_id: project_id],
      call: {Projects, :list_project_service_accounts},
      url: "/organization/projects/#{project_id}/service_accounts",
      method: :get,
      query: query,
      response: [{200, {ProjectServiceAccountListResponse, :t}}, {400, {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Returns a list of users in the project.

  ## Options

    * `limit`: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
      
    * `after`: A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.
      

  """
  @spec list_project_users(project_id :: String.t(), opts :: keyword) ::
          {:ok, ProjectUserListResponse.t()} | {:error, ErrorResponse.t()}
  def list_project_users(project_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :limit])

    client.request(%{
      args: [project_id: project_id],
      call: {Projects, :list_project_users},
      url: "/organization/projects/#{project_id}/users",
      method: :get,
      query: query,
      response: [{200, {ProjectUserListResponse, :t}}, {400, {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Returns a list of projects.

  ## Options

    * `limit`: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
      
    * `after`: A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.
      
    * `include_archived`: If `true` returns all projects including those that have been `archived`. Archived projects are not included by default.

  """
  @spec list_projects(opts :: keyword) :: {:ok, ProjectListResponse.t()} | :error
  def list_projects(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :include_archived, :limit])

    client.request(%{
      args: [],
      call: {Projects, :list_projects},
      url: "/organization/projects",
      method: :get,
      query: query,
      response: [{200, {ProjectListResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Modifies a project in the organization.

  ## Request Body

  **Content Types**: `application/json`

  The project update request payload.
  """
  @spec modify_project(
          project_id :: String.t(),
          body :: ProjectUpdateRequest.t(),
          opts :: keyword
        ) :: {:ok, Project.t()} | {:error, ErrorResponse.t()}
  def modify_project(project_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [project_id: project_id, body: body],
      call: {Projects, :modify_project},
      url: "/organization/projects/#{project_id}",
      body: body,
      method: :post,
      request: [{"application/json", {ProjectUpdateRequest, :t}}],
      response: [{200, {Project, :t}}, {400, {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Modifies a user's role in the project.

  ## Request Body

  **Content Types**: `application/json`

  The project user update request payload.
  """
  @spec modify_project_user(
          project_id :: String.t(),
          user_id :: String.t(),
          body :: ProjectUserUpdateRequest.t(),
          opts :: keyword
        ) :: {:ok, ProjectUser.t()} | {:error, ErrorResponse.t()}
  def modify_project_user(project_id, user_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [project_id: project_id, user_id: user_id, body: body],
      call: {Projects, :modify_project_user},
      url: "/organization/projects/#{project_id}/users/#{user_id}",
      body: body,
      method: :post,
      request: [{"application/json", {ProjectUserUpdateRequest, :t}}],
      response: [{200, {ProjectUser, :t}}, {400, {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieves a project.
  """
  @spec retrieve_project(project_id :: String.t(), opts :: keyword) :: {:ok, Project.t()} | :error
  def retrieve_project(project_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [project_id: project_id],
      call: {Projects, :retrieve_project},
      url: "/organization/projects/#{project_id}",
      method: :get,
      response: [{200, {Project, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieves an API key in the project.
  """
  @spec retrieve_project_api_key(project_id :: String.t(), key_id :: String.t(), opts :: keyword) ::
          {:ok, ProjectApiKey.t()} | :error
  def retrieve_project_api_key(project_id, key_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [project_id: project_id, key_id: key_id],
      call: {Projects, :retrieve_project_api_key},
      url: "/organization/projects/#{project_id}/api_keys/#{key_id}",
      method: :get,
      response: [{200, {ProjectApiKey, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieves a service account in the project.
  """
  @spec retrieve_project_service_account(
          project_id :: String.t(),
          service_account_id :: String.t(),
          opts :: keyword
        ) :: {:ok, ProjectServiceAccount.t()} | :error
  def retrieve_project_service_account(project_id, service_account_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [project_id: project_id, service_account_id: service_account_id],
      call: {Projects, :retrieve_project_service_account},
      url: "/organization/projects/#{project_id}/service_accounts/#{service_account_id}",
      method: :get,
      response: [{200, {ProjectServiceAccount, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieves a user in the project.
  """
  @spec retrieve_project_user(project_id :: String.t(), user_id :: String.t(), opts :: keyword) ::
          {:ok, ProjectUser.t()} | :error
  def retrieve_project_user(project_id, user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [project_id: project_id, user_id: user_id],
      call: {Projects, :retrieve_project_user},
      url: "/organization/projects/#{project_id}/users/#{user_id}",
      method: :get,
      response: [{200, {ProjectUser, :t}}],
      opts: opts
    })
  end

  @doc """
  Updates a project rate limit.

  ## Request Body

  **Content Types**: `application/json`

  The project rate limit update request payload.
  """
  @spec update_project_rate_limits(
          project_id :: String.t(),
          rate_limit_id :: String.t(),
          body :: ProjectRateLimitUpdateRequest.t(),
          opts :: keyword
        ) :: {:ok, ProjectRateLimit.t()} | {:error, ErrorResponse.t()}
  def update_project_rate_limits(project_id, rate_limit_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [project_id: project_id, rate_limit_id: rate_limit_id, body: body],
      call: {Projects, :update_project_rate_limits},
      url: "/organization/projects/#{project_id}/rate_limits/#{rate_limit_id}",
      body: body,
      method: :post,
      request: [{"application/json", {ProjectRateLimitUpdateRequest, :t}}],
      response: [{200, {ProjectRateLimit, :t}}, {400, {ErrorResponse, :t}}],
      opts: opts
    })
  end
end
