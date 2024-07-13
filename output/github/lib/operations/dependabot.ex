defmodule GitHub.Dependabot do
  @moduledoc """
  Provides API endpoints related to dependabot
  """

  @default_client GitHub.Client

  @doc """
  Add selected repository to an organization secret

  Adds a repository to an organization secret when the `visibility` for
  repository access is set to `selected`. The visibility is set when you [Create or
  update an organization secret](https://docs.github.com/rest/dependabot/secrets#create-or-update-an-organization-secret).

  OAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/dependabot/secrets#add-selected-repository-to-an-organization-secret)

  """
  @spec add_selected_repo_to_org_secret(String.t(), String.t(), integer, keyword) ::
          :ok | {:error, GitHub.Error.t()}
  def add_selected_repo_to_org_secret(org, secret_name, repository_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, secret_name: secret_name, repository_id: repository_id],
      call: {GitHub.Dependabot, :add_selected_repo_to_org_secret},
      url: "/orgs/#{org}/dependabot/secrets/#{secret_name}/repositories/#{repository_id}",
      method: :put,
      response: [{204, :null}, {409, :null}],
      opts: opts
    })
  end

  @doc """
  Create or update an organization secret

  Creates or updates an organization secret with an encrypted value. Encrypt your secret using
  [LibSodium](https://libsodium.gitbook.io/doc/bindings_for_other_languages). For more information, see "[Encrypting secrets for the REST API](https://docs.github.com/rest/guides/encrypting-secrets-for-the-rest-api)."

  OAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/dependabot/secrets#create-or-update-an-organization-secret)

  """
  @spec create_or_update_org_secret(String.t(), String.t(), map, keyword) ::
          {:ok, GitHub.EmptyObject.t()} | {:error, GitHub.Error.t()}
  def create_or_update_org_secret(org, secret_name, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, secret_name: secret_name, body: body],
      call: {GitHub.Dependabot, :create_or_update_org_secret},
      url: "/orgs/#{org}/dependabot/secrets/#{secret_name}",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [{201, {GitHub.EmptyObject, :t}}, {204, :null}],
      opts: opts
    })
  end

  @doc """
  Create or update a repository secret

  Creates or updates a repository secret with an encrypted value. Encrypt your secret using
  [LibSodium](https://libsodium.gitbook.io/doc/bindings_for_other_languages). For more information, see "[Encrypting secrets for the REST API](https://docs.github.com/rest/guides/encrypting-secrets-for-the-rest-api)."

  OAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/dependabot/secrets#create-or-update-a-repository-secret)

  """
  @spec create_or_update_repo_secret(String.t(), String.t(), String.t(), map, keyword) ::
          {:ok, GitHub.EmptyObject.t()} | {:error, GitHub.Error.t()}
  def create_or_update_repo_secret(owner, repo, secret_name, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, secret_name: secret_name, body: body],
      call: {GitHub.Dependabot, :create_or_update_repo_secret},
      url: "/repos/#{owner}/#{repo}/dependabot/secrets/#{secret_name}",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [{201, {GitHub.EmptyObject, :t}}, {204, :null}],
      opts: opts
    })
  end

  @doc """
  Delete an organization secret

  Deletes a secret in an organization using the secret name.

  OAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/dependabot/secrets#delete-an-organization-secret)

  """
  @spec delete_org_secret(String.t(), String.t(), keyword) :: :ok | {:error, GitHub.Error.t()}
  def delete_org_secret(org, secret_name, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, secret_name: secret_name],
      call: {GitHub.Dependabot, :delete_org_secret},
      url: "/orgs/#{org}/dependabot/secrets/#{secret_name}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Delete a repository secret

  Deletes a secret in a repository using the secret name.

  OAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/dependabot/secrets#delete-a-repository-secret)

  """
  @spec delete_repo_secret(String.t(), String.t(), String.t(), keyword) ::
          :ok | {:error, GitHub.Error.t()}
  def delete_repo_secret(owner, repo, secret_name, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, secret_name: secret_name],
      call: {GitHub.Dependabot, :delete_repo_secret},
      url: "/repos/#{owner}/#{repo}/dependabot/secrets/#{secret_name}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Get a Dependabot alert

  OAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint. If this endpoint is only used with public repositories, the token can use the `public_repo` scope instead.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/dependabot/alerts#get-a-dependabot-alert)

  """
  @spec get_alert(String.t(), String.t(), integer, keyword) ::
          {:ok, GitHub.Dependabot.Alert.t()} | {:error, GitHub.Error.t()}
  def get_alert(owner, repo, alert_number, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, alert_number: alert_number],
      call: {GitHub.Dependabot, :get_alert},
      url: "/repos/#{owner}/#{repo}/dependabot/alerts/#{alert_number}",
      method: :get,
      response: [
        {200, {GitHub.Dependabot.Alert, :t}},
        {304, :null},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get an organization public key

  Gets your public key, which you need to encrypt secrets. You need to
  encrypt a secret before you can create or update secrets.

  OAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/dependabot/secrets#get-an-organization-public-key)

  """
  @spec get_org_public_key(String.t(), keyword) ::
          {:ok, GitHub.Dependabot.PublicKey.t()} | {:error, GitHub.Error.t()}
  def get_org_public_key(org, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org],
      call: {GitHub.Dependabot, :get_org_public_key},
      url: "/orgs/#{org}/dependabot/secrets/public-key",
      method: :get,
      response: [{200, {GitHub.Dependabot.PublicKey, :t}}],
      opts: opts
    })
  end

  @doc """
  Get an organization secret

  Gets a single organization secret without revealing its encrypted value.

  OAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/dependabot/secrets#get-an-organization-secret)

  """
  @spec get_org_secret(String.t(), String.t(), keyword) ::
          {:ok, GitHub.Organization.DependabotSecret.t()} | {:error, GitHub.Error.t()}
  def get_org_secret(org, secret_name, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, secret_name: secret_name],
      call: {GitHub.Dependabot, :get_org_secret},
      url: "/orgs/#{org}/dependabot/secrets/#{secret_name}",
      method: :get,
      response: [{200, {GitHub.Organization.DependabotSecret, :t}}],
      opts: opts
    })
  end

  @doc """
  Get a repository public key

  Gets your public key, which you need to encrypt secrets. You need to
  encrypt a secret before you can create or update secrets. Anyone with read access
  to the repository can use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint if the repository is private.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/dependabot/secrets#get-a-repository-public-key)

  """
  @spec get_repo_public_key(String.t(), String.t(), keyword) ::
          {:ok, GitHub.Dependabot.PublicKey.t()} | {:error, GitHub.Error.t()}
  def get_repo_public_key(owner, repo, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo],
      call: {GitHub.Dependabot, :get_repo_public_key},
      url: "/repos/#{owner}/#{repo}/dependabot/secrets/public-key",
      method: :get,
      response: [{200, {GitHub.Dependabot.PublicKey, :t}}],
      opts: opts
    })
  end

  @doc """
  Get a repository secret

  Gets a single repository secret without revealing its encrypted value.

  OAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/dependabot/secrets#get-a-repository-secret)

  """
  @spec get_repo_secret(String.t(), String.t(), String.t(), keyword) ::
          {:ok, GitHub.Dependabot.Secret.t()} | {:error, GitHub.Error.t()}
  def get_repo_secret(owner, repo, secret_name, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, secret_name: secret_name],
      call: {GitHub.Dependabot, :get_repo_secret},
      url: "/repos/#{owner}/#{repo}/dependabot/secrets/#{secret_name}",
      method: :get,
      response: [{200, {GitHub.Dependabot.Secret, :t}}],
      opts: opts
    })
  end

  @doc """
  List Dependabot alerts for an enterprise

  Lists Dependabot alerts for repositories that are owned by the specified enterprise.

  The authenticated user must be a member of the enterprise to use this endpoint.

  Alerts are only returned for organizations in the enterprise for which you are an organization owner or a security manager. For more information about security managers, see "[Managing security managers in your organization](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/managing-security-managers-in-your-organization)."

  OAuth app tokens and personal access tokens (classic) need the `repo` or `security_events` scope to use this endpoint.

  ## Options

    * `state`: A comma-separated list of states. If specified, only alerts with these states will be returned.
      
      Can be: `auto_dismissed`, `dismissed`, `fixed`, `open`
    * `severity`: A comma-separated list of severities. If specified, only alerts with these severities will be returned.
      
      Can be: `low`, `medium`, `high`, `critical`
    * `ecosystem`: A comma-separated list of ecosystems. If specified, only alerts for these ecosystems will be returned.
      
      Can be: `composer`, `go`, `maven`, `npm`, `nuget`, `pip`, `pub`, `rubygems`, `rust`
    * `package`: A comma-separated list of package names. If specified, only alerts for these packages will be returned.
    * `scope`: The scope of the vulnerable dependency. If specified, only alerts with this scope will be returned.
    * `sort`: The property by which to sort the results.
      `created` means when the alert was created.
      `updated` means when the alert's state last changed.
    * `direction`: The direction to sort the results by.
    * `before`: A cursor, as given in the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers). If specified, the query only searches for results before this cursor. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `after`: A cursor, as given in the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers). If specified, the query only searches for results after this cursor. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `first`: **Deprecated**. The number of results per page (max 100), starting from the first matching result.
      This parameter must not be used in combination with `last`.
      Instead, use `per_page` in combination with `after` to fetch the first page of results.
    * `last`: **Deprecated**. The number of results per page (max 100), starting from the last matching result.
      This parameter must not be used in combination with `first`.
      Instead, use `per_page` in combination with `before` to fetch the last page of results.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/dependabot/alerts#list-dependabot-alerts-for-an-enterprise)

  """
  @spec list_alerts_for_enterprise(String.t(), keyword) ::
          {:ok, [GitHub.Dependabot.Alert.WithRepository.t()]} | {:error, GitHub.Error.t()}
  def list_alerts_for_enterprise(enterprise, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :after,
        :before,
        :direction,
        :ecosystem,
        :first,
        :last,
        :package,
        :per_page,
        :scope,
        :severity,
        :sort,
        :state
      ])

    client.request(%{
      args: [enterprise: enterprise],
      call: {GitHub.Dependabot, :list_alerts_for_enterprise},
      url: "/enterprises/#{enterprise}/dependabot/alerts",
      method: :get,
      query: query,
      response: [
        {200, [{GitHub.Dependabot.Alert.WithRepository, :t}]},
        {304, :null},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :simple}}
      ],
      opts: opts
    })
  end

  @doc """
  List Dependabot alerts for an organization

  Lists Dependabot alerts for an organization.

  The authenticated user must be an owner or security manager for the organization to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint. If this endpoint is only used with public repositories, the token can use the `public_repo` scope instead.

  ## Options

    * `state`: A comma-separated list of states. If specified, only alerts with these states will be returned.
      
      Can be: `auto_dismissed`, `dismissed`, `fixed`, `open`
    * `severity`: A comma-separated list of severities. If specified, only alerts with these severities will be returned.
      
      Can be: `low`, `medium`, `high`, `critical`
    * `ecosystem`: A comma-separated list of ecosystems. If specified, only alerts for these ecosystems will be returned.
      
      Can be: `composer`, `go`, `maven`, `npm`, `nuget`, `pip`, `pub`, `rubygems`, `rust`
    * `package`: A comma-separated list of package names. If specified, only alerts for these packages will be returned.
    * `scope`: The scope of the vulnerable dependency. If specified, only alerts with this scope will be returned.
    * `sort`: The property by which to sort the results.
      `created` means when the alert was created.
      `updated` means when the alert's state last changed.
    * `direction`: The direction to sort the results by.
    * `before`: A cursor, as given in the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers). If specified, the query only searches for results before this cursor. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `after`: A cursor, as given in the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers). If specified, the query only searches for results after this cursor. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `first`: **Deprecated**. The number of results per page (max 100), starting from the first matching result.
      This parameter must not be used in combination with `last`.
      Instead, use `per_page` in combination with `after` to fetch the first page of results.
    * `last`: **Deprecated**. The number of results per page (max 100), starting from the last matching result.
      This parameter must not be used in combination with `first`.
      Instead, use `per_page` in combination with `before` to fetch the last page of results.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/dependabot/alerts#list-dependabot-alerts-for-an-organization)

  """
  @spec list_alerts_for_org(String.t(), keyword) ::
          {:ok, [GitHub.Dependabot.Alert.WithRepository.t()]} | {:error, GitHub.Error.t()}
  def list_alerts_for_org(org, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :after,
        :before,
        :direction,
        :ecosystem,
        :first,
        :last,
        :package,
        :per_page,
        :scope,
        :severity,
        :sort,
        :state
      ])

    client.request(%{
      args: [org: org],
      call: {GitHub.Dependabot, :list_alerts_for_org},
      url: "/orgs/#{org}/dependabot/alerts",
      method: :get,
      query: query,
      response: [
        {200, [{GitHub.Dependabot.Alert.WithRepository, :t}]},
        {304, :null},
        {400, {:union, [{GitHub.BasicError, :t}, {GitHub.SCIM.Error, :t}]}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :simple}}
      ],
      opts: opts
    })
  end

  @doc """
  List Dependabot alerts for a repository

  OAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint. If this endpoint is only used with public repositories, the token can use the `public_repo` scope instead.

  ## Options

    * `state`: A comma-separated list of states. If specified, only alerts with these states will be returned.
      
      Can be: `auto_dismissed`, `dismissed`, `fixed`, `open`
    * `severity`: A comma-separated list of severities. If specified, only alerts with these severities will be returned.
      
      Can be: `low`, `medium`, `high`, `critical`
    * `ecosystem`: A comma-separated list of ecosystems. If specified, only alerts for these ecosystems will be returned.
      
      Can be: `composer`, `go`, `maven`, `npm`, `nuget`, `pip`, `pub`, `rubygems`, `rust`
    * `package`: A comma-separated list of package names. If specified, only alerts for these packages will be returned.
    * `manifest`: A comma-separated list of full manifest paths. If specified, only alerts for these manifests will be returned.
    * `scope`: The scope of the vulnerable dependency. If specified, only alerts with this scope will be returned.
    * `sort`: The property by which to sort the results.
      `created` means when the alert was created.
      `updated` means when the alert's state last changed.
    * `direction`: The direction to sort the results by.
    * `page`: **Deprecated**. Page number of the results to fetch. Use cursor-based pagination with `before` or `after` instead.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `before`: A cursor, as given in the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers). If specified, the query only searches for results before this cursor. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `after`: A cursor, as given in the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers). If specified, the query only searches for results after this cursor. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `first`: **Deprecated**. The number of results per page (max 100), starting from the first matching result.
      This parameter must not be used in combination with `last`.
      Instead, use `per_page` in combination with `after` to fetch the first page of results.
    * `last`: **Deprecated**. The number of results per page (max 100), starting from the last matching result.
      This parameter must not be used in combination with `first`.
      Instead, use `per_page` in combination with `before` to fetch the last page of results.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/dependabot/alerts#list-dependabot-alerts-for-a-repository)

  """
  @spec list_alerts_for_repo(String.t(), String.t(), keyword) ::
          {:ok, [GitHub.Dependabot.Alert.t()]} | {:error, GitHub.Error.t()}
  def list_alerts_for_repo(owner, repo, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :after,
        :before,
        :direction,
        :ecosystem,
        :first,
        :last,
        :manifest,
        :package,
        :page,
        :per_page,
        :scope,
        :severity,
        :sort,
        :state
      ])

    client.request(%{
      args: [owner: owner, repo: repo],
      call: {GitHub.Dependabot, :list_alerts_for_repo},
      url: "/repos/#{owner}/#{repo}/dependabot/alerts",
      method: :get,
      query: query,
      response: [
        {200, [{GitHub.Dependabot.Alert, :t}]},
        {304, :null},
        {400, {:union, [{GitHub.BasicError, :t}, {GitHub.SCIM.Error, :t}]}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :simple}}
      ],
      opts: opts
    })
  end

  @type list_org_secrets_200_json_resp :: %{
          __info__: map,
          secrets: [GitHub.Organization.DependabotSecret.t()],
          total_count: integer
        }

  @doc """
  List organization secrets

  Lists all secrets available in an organization without revealing their
  encrypted values.

  OAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/dependabot/secrets#list-organization-secrets)

  """
  @spec list_org_secrets(String.t(), keyword) :: {:ok, map} | {:error, GitHub.Error.t()}
  def list_org_secrets(org, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [org: org],
      call: {GitHub.Dependabot, :list_org_secrets},
      url: "/orgs/#{org}/dependabot/secrets",
      method: :get,
      query: query,
      response: [{200, {GitHub.Dependabot, :list_org_secrets_200_json_resp}}],
      opts: opts
    })
  end

  @type list_repo_secrets_200_json_resp :: %{
          __info__: map,
          secrets: [GitHub.Dependabot.Secret.t()],
          total_count: integer
        }

  @doc """
  List repository secrets

  Lists all secrets available in a repository without revealing their encrypted
  values.

  OAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/dependabot/secrets#list-repository-secrets)

  """
  @spec list_repo_secrets(String.t(), String.t(), keyword) ::
          {:ok, map} | {:error, GitHub.Error.t()}
  def list_repo_secrets(owner, repo, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [owner: owner, repo: repo],
      call: {GitHub.Dependabot, :list_repo_secrets},
      url: "/repos/#{owner}/#{repo}/dependabot/secrets",
      method: :get,
      query: query,
      response: [{200, {GitHub.Dependabot, :list_repo_secrets_200_json_resp}}],
      opts: opts
    })
  end

  @type list_selected_repos_for_org_secret_200_json_resp :: %{
          __info__: map,
          repositories: [GitHub.Repository.minimal()],
          total_count: integer
        }

  @doc """
  List selected repositories for an organization secret

  Lists all repositories that have been selected when the `visibility`
  for repository access to a secret is set to `selected`.

  OAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint.

  ## Options

    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/dependabot/secrets#list-selected-repositories-for-an-organization-secret)

  """
  @spec list_selected_repos_for_org_secret(String.t(), String.t(), keyword) ::
          {:ok, map} | {:error, GitHub.Error.t()}
  def list_selected_repos_for_org_secret(org, secret_name, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [org: org, secret_name: secret_name],
      call: {GitHub.Dependabot, :list_selected_repos_for_org_secret},
      url: "/orgs/#{org}/dependabot/secrets/#{secret_name}/repositories",
      method: :get,
      query: query,
      response: [{200, {GitHub.Dependabot, :list_selected_repos_for_org_secret_200_json_resp}}],
      opts: opts
    })
  end

  @doc """
  Remove selected repository from an organization secret

  Removes a repository from an organization secret when the `visibility`
  for repository access is set to `selected`. The visibility is set when you [Create
  or update an organization secret](https://docs.github.com/rest/dependabot/secrets#create-or-update-an-organization-secret).

  OAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/dependabot/secrets#remove-selected-repository-from-an-organization-secret)

  """
  @spec remove_selected_repo_from_org_secret(String.t(), String.t(), integer, keyword) ::
          :ok | {:error, GitHub.Error.t()}
  def remove_selected_repo_from_org_secret(org, secret_name, repository_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, secret_name: secret_name, repository_id: repository_id],
      call: {GitHub.Dependabot, :remove_selected_repo_from_org_secret},
      url: "/orgs/#{org}/dependabot/secrets/#{secret_name}/repositories/#{repository_id}",
      method: :delete,
      response: [{204, :null}, {409, :null}],
      opts: opts
    })
  end

  @doc """
  Set selected repositories for an organization secret

  Replaces all repositories for an organization secret when the `visibility`
  for repository access is set to `selected`. The visibility is set when you [Create
  or update an organization secret](https://docs.github.com/rest/dependabot/secrets#create-or-update-an-organization-secret).

  OAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/dependabot/secrets#set-selected-repositories-for-an-organization-secret)

  """
  @spec set_selected_repos_for_org_secret(String.t(), String.t(), map, keyword) ::
          :ok | {:error, GitHub.Error.t()}
  def set_selected_repos_for_org_secret(org, secret_name, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, secret_name: secret_name, body: body],
      call: {GitHub.Dependabot, :set_selected_repos_for_org_secret},
      url: "/orgs/#{org}/dependabot/secrets/#{secret_name}/repositories",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Update a Dependabot alert

  The authenticated user must have access to security alerts for the repository to use this endpoint. For more information, see "[Granting access to security alerts](https://docs.github.com/repositories/managing-your-repositorys-settings-and-features/enabling-features-for-your-repository/managing-security-and-analysis-settings-for-your-repository#granting-access-to-security-alerts)."

  OAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint. If this endpoint is only used with public repositories, the token can use the `public_repo` scope instead.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/dependabot/alerts#update-a-dependabot-alert)

  """
  @spec update_alert(String.t(), String.t(), integer, map, keyword) ::
          {:ok, GitHub.Dependabot.Alert.t()} | {:error, GitHub.Error.t()}
  def update_alert(owner, repo, alert_number, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, alert_number: alert_number, body: body],
      call: {GitHub.Dependabot, :update_alert},
      url: "/repos/#{owner}/#{repo}/dependabot/alerts/#{alert_number}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, {GitHub.Dependabot.Alert, :t}},
        {400, {:union, [{GitHub.BasicError, :t}, {GitHub.SCIM.Error, :t}]}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {409, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :simple}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:list_org_secrets_200_json_resp) do
    [secrets: [{GitHub.Organization.DependabotSecret, :t}], total_count: :integer]
  end

  def __fields__(:list_repo_secrets_200_json_resp) do
    [secrets: [{GitHub.Dependabot.Secret, :t}], total_count: :integer]
  end

  def __fields__(:list_selected_repos_for_org_secret_200_json_resp) do
    [repositories: [{GitHub.Repository, :minimal}], total_count: :integer]
  end
end
