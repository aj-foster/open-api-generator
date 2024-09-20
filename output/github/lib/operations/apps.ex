defmodule GitHub.Apps do
  @moduledoc """
  Provides API endpoints related to apps
  """

  @default_client GitHub.Client

  @doc """
  Add a repository to an app installation

  Add a single repository to an installation. The authenticated user must have admin access to the repository.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/installations#add-a-repository-to-an-app-installation)

  """
  @spec add_repo_to_installation_for_authenticated_user(integer, integer, keyword) ::
          :ok | {:error, GitHub.Error.t()}
  def add_repo_to_installation_for_authenticated_user(installation_id, repository_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [installation_id: installation_id, repository_id: repository_id],
      call: {GitHub.Apps, :add_repo_to_installation_for_authenticated_user},
      url: "/user/installations/#{installation_id}/repositories/#{repository_id}",
      method: :put,
      response: [
        {204, :null},
        {304, :null},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Check a token

  OAuth applications and GitHub applications with OAuth authorizations can use this API method for checking OAuth token validity without exceeding the normal rate limits for failed login attempts. Authentication works differently with this particular endpoint. You must use [Basic Authentication](https://docs.github.com/rest/overview/other-authentication-methods#basic-authentication) to use this endpoint, where the username is the application `client_id` and the password is its `client_secret`. Invalid tokens will return `404 NOT FOUND`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/oauth-applications#check-a-token)

  """
  @spec check_token(String.t(), map, keyword) ::
          {:ok, GitHub.Authorization.t()} | {:error, GitHub.Error.t()}
  def check_token(client_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [client_id: client_id, body: body],
      call: {GitHub.Apps, :check_token},
      url: "/applications/#{client_id}/token",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, {GitHub.Authorization, :t}},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @type create_from_manifest_201_json_resp :: %{
          __info__: map,
          client_id: String.t() | nil,
          client_secret: String.t() | nil,
          created_at: DateTime.t() | nil,
          description: String.t() | nil,
          events: [String.t()] | nil,
          external_url: String.t() | nil,
          html_url: String.t() | nil,
          id: integer | nil,
          installations_count: integer | nil,
          name: String.t() | nil,
          node_id: String.t() | nil,
          owner: GitHub.User.simple() | nil,
          pem: String.t() | nil,
          permissions: map | nil,
          slug: String.t() | nil,
          updated_at: DateTime.t() | nil,
          webhook_secret: String.t() | nil
        }

  @doc """
  Create a GitHub App from a manifest

  Use this endpoint to complete the handshake necessary when implementing the [GitHub App Manifest flow](https://docs.github.com/apps/building-github-apps/creating-github-apps-from-a-manifest/). When you create a GitHub App with the manifest flow, you receive a temporary `code` used to retrieve the GitHub App's `id`, `pem` (private key), and `webhook_secret`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/apps#create-a-github-app-from-a-manifest)

  """
  @spec create_from_manifest(String.t(), keyword) :: {:ok, map} | {:error, GitHub.Error.t()}
  def create_from_manifest(code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code],
      call: {GitHub.Apps, :create_from_manifest},
      url: "/app-manifests/#{code}/conversions",
      method: :post,
      response: [
        {201, {GitHub.Apps, :create_from_manifest_201_json_resp}},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :simple}}
      ],
      opts: opts
    })
  end

  @doc """
  Create an installation access token for an app

  Creates an installation access token that enables a GitHub App to make authenticated API requests for the app's installation on an organization or individual account. Installation tokens expire one hour from the time you create them. Using an expired token produces a status code of `401 - Unauthorized`, and requires creating a new installation token. By default the installation token has access to all repositories that the installation can access.

  Optionally, you can use the `repositories` or `repository_ids` body parameters to specify individual repositories that the installation access token can access. If you don't use `repositories` or `repository_ids` to grant access to specific repositories, the installation access token will have access to all repositories that the installation was granted access to. The installation access token cannot be granted access to repositories that the installation was not granted access to. Up to 500 repositories can be listed in this manner.

  Optionally, use the `permissions` body parameter to specify the permissions that the installation access token should have. If `permissions` is not specified, the installation access token will have all of the permissions that were granted to the app. The installation access token cannot be granted permissions that the app was not granted.

  When using the repository or permission parameters to reduce the access of the token, the complexity of the token is increased due to both the number of permissions in the request and the number of repositories the token will have access to. If the complexity is too large, the token will fail to be issued. If this occurs, the error message will indicate the maximum number of repositories that should be requested. For the average application requesting 8 permissions, this limit is around 5000 repositories. With fewer permissions requested, more repositories are supported.

  You must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/apps#create-an-installation-access-token-for-an-app)

  """
  @spec create_installation_access_token(integer, map, keyword) ::
          {:ok, GitHub.Installation.Token.t()} | {:error, GitHub.Error.t()}
  def create_installation_access_token(installation_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [installation_id: installation_id, body: body],
      call: {GitHub.Apps, :create_installation_access_token},
      url: "/app/installations/#{installation_id}/access_tokens",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {GitHub.Installation.Token, :t}},
        {401, {GitHub.BasicError, :t}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete an app authorization

  OAuth and GitHub application owners can revoke a grant for their application and a specific user. You must use [Basic Authentication](https://docs.github.com/rest/overview/other-authentication-methods#basic-authentication) when accessing this endpoint, using the OAuth application's `client_id` and `client_secret` as the username and password. You must also provide a valid OAuth `access_token` as an input parameter and the grant for the token's owner will be deleted.
  Deleting an application's grant will also delete all OAuth tokens associated with the application for the user. Once deleted, the application will have no access to the user's account and will no longer be listed on [the application authorizations settings screen within GitHub](https://github.com/settings/applications#authorized).

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/oauth-applications#delete-an-app-authorization)

  """
  @spec delete_authorization(String.t(), map, keyword) :: :ok | {:error, GitHub.Error.t()}
  def delete_authorization(client_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [client_id: client_id, body: body],
      call: {GitHub.Apps, :delete_authorization},
      url: "/applications/#{client_id}/grant",
      body: body,
      method: :delete,
      request: [{"application/json", :map}],
      response: [{204, :null}, {422, {GitHub.ValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Delete an installation for the authenticated app

  Uninstalls a GitHub App on a user, organization, or business account. If you prefer to temporarily suspend an app's access to your account's resources, then we recommend the "[Suspend an app installation](https://docs.github.com/rest/apps/apps#suspend-an-app-installation)" endpoint.

  You must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/apps#delete-an-installation-for-the-authenticated-app)

  """
  @spec delete_installation(integer, keyword) :: :ok | {:error, GitHub.Error.t()}
  def delete_installation(installation_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [installation_id: installation_id],
      call: {GitHub.Apps, :delete_installation},
      url: "/app/installations/#{installation_id}",
      method: :delete,
      response: [{204, :null}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  Delete an app token

  OAuth  or GitHub application owners can revoke a single token for an OAuth application or a GitHub application with an OAuth authorization. You must use [Basic Authentication](https://docs.github.com/rest/overview/other-authentication-methods#basic-authentication) when accessing this endpoint, using the application's `client_id` and `client_secret` as the username and password.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/oauth-applications#delete-an-app-token)

  """
  @spec delete_token(String.t(), map, keyword) :: :ok | {:error, GitHub.Error.t()}
  def delete_token(client_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [client_id: client_id, body: body],
      call: {GitHub.Apps, :delete_token},
      url: "/applications/#{client_id}/token",
      body: body,
      method: :delete,
      request: [{"application/json", :map}],
      response: [{204, :null}, {422, {GitHub.ValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get the authenticated app

  Returns the GitHub App associated with the authentication credentials used. To see how many app installations are associated with this GitHub App, see the `installations_count` in the response. For more details about your app's installations, see the "[List installations for the authenticated app](https://docs.github.com/rest/apps/apps#list-installations-for-the-authenticated-app)" endpoint.

  You must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/apps#get-the-authenticated-app)

  """
  @spec get_authenticated(keyword) :: {:ok, GitHub.App.t() | nil} | {:error, GitHub.Error.t()}
  def get_authenticated(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {GitHub.Apps, :get_authenticated},
      url: "/app",
      method: :get,
      response: [{200, {:union, [{GitHub.App, :t}, :null]}}],
      opts: opts
    })
  end

  @doc """
  Get an app

  **Note**: The `:app_slug` is just the URL-friendly name of your GitHub App. You can find this on the settings page for your GitHub App (e.g., `https://github.com/settings/apps/:app_slug`).

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/apps#get-an-app)

  """
  @spec get_by_slug(String.t(), keyword) ::
          {:ok, GitHub.App.t() | nil} | {:error, GitHub.Error.t()}
  def get_by_slug(app_slug, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [app_slug: app_slug],
      call: {GitHub.Apps, :get_by_slug},
      url: "/apps/#{app_slug}",
      method: :get,
      response: [
        {200, {:union, [{GitHub.App, :t}, :null]}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get an installation for the authenticated app

  Enables an authenticated GitHub App to find an installation's information using the installation id.

  You must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/apps#get-an-installation-for-the-authenticated-app)

  """
  @spec get_installation(integer, keyword) ::
          {:ok, GitHub.Installation.t()} | {:error, GitHub.Error.t()}
  def get_installation(installation_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [installation_id: installation_id],
      call: {GitHub.Apps, :get_installation},
      url: "/app/installations/#{installation_id}",
      method: :get,
      response: [{200, {GitHub.Installation, :t}}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get an organization installation for the authenticated app

  Enables an authenticated GitHub App to find the organization's installation information.

  You must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/apps#get-an-organization-installation-for-the-authenticated-app)

  """
  @spec get_org_installation(String.t(), keyword) ::
          {:ok, GitHub.Installation.t()} | {:error, GitHub.Error.t()}
  def get_org_installation(org, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org],
      call: {GitHub.Apps, :get_org_installation},
      url: "/orgs/#{org}/installation",
      method: :get,
      response: [{200, {GitHub.Installation, :t}}],
      opts: opts
    })
  end

  @doc """
  Get a repository installation for the authenticated app

  Enables an authenticated GitHub App to find the repository's installation information. The installation's account type will be either an organization or a user account, depending which account the repository belongs to.

  You must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/apps#get-a-repository-installation-for-the-authenticated-app)

  """
  @spec get_repo_installation(String.t(), String.t(), keyword) ::
          {:ok, GitHub.Installation.t()} | {:error, GitHub.Error.t()}
  def get_repo_installation(owner, repo, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo],
      call: {GitHub.Apps, :get_repo_installation},
      url: "/repos/#{owner}/#{repo}/installation",
      method: :get,
      response: [
        {200, {GitHub.Installation, :t}},
        {301, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a subscription plan for an account

  Shows whether the user or organization account actively subscribes to a plan listed by the authenticated GitHub App. When someone submits a plan change that won't be processed until the end of their billing cycle, you will also see the upcoming pending change.

  GitHub Apps must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint. OAuth apps must use [basic authentication](https://docs.github.com/rest/overview/other-authentication-methods#basic-authentication) with their client ID and client secret to access this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/marketplace#get-a-subscription-plan-for-an-account)

  """
  @spec get_subscription_plan_for_account(integer, keyword) ::
          {:ok, GitHub.Marketplace.Purchase.t()} | {:error, GitHub.Error.t()}
  def get_subscription_plan_for_account(account_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [account_id: account_id],
      call: {GitHub.Apps, :get_subscription_plan_for_account},
      url: "/marketplace_listing/accounts/#{account_id}",
      method: :get,
      response: [
        {200, {GitHub.Marketplace.Purchase, :t}},
        {401, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a subscription plan for an account (stubbed)

  Shows whether the user or organization account actively subscribes to a plan listed by the authenticated GitHub App. When someone submits a plan change that won't be processed until the end of their billing cycle, you will also see the upcoming pending change.

  GitHub Apps must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint. OAuth apps must use [basic authentication](https://docs.github.com/rest/overview/other-authentication-methods#basic-authentication) with their client ID and client secret to access this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/marketplace#get-a-subscription-plan-for-an-account-stubbed)

  """
  @spec get_subscription_plan_for_account_stubbed(integer, keyword) ::
          {:ok, GitHub.Marketplace.Purchase.t()} | {:error, GitHub.Error.t()}
  def get_subscription_plan_for_account_stubbed(account_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [account_id: account_id],
      call: {GitHub.Apps, :get_subscription_plan_for_account_stubbed},
      url: "/marketplace_listing/stubbed/accounts/#{account_id}",
      method: :get,
      response: [
        {200, {GitHub.Marketplace.Purchase, :t}},
        {401, {GitHub.BasicError, :t}},
        {404, :null}
      ],
      opts: opts
    })
  end

  @doc """
  Get a user installation for the authenticated app

  Enables an authenticated GitHub App to find the user’s installation information.

  You must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/apps#get-a-user-installation-for-the-authenticated-app)

  """
  @spec get_user_installation(String.t(), keyword) ::
          {:ok, GitHub.Installation.t()} | {:error, GitHub.Error.t()}
  def get_user_installation(username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [username: username],
      call: {GitHub.Apps, :get_user_installation},
      url: "/users/#{username}/installation",
      method: :get,
      response: [{200, {GitHub.Installation, :t}}],
      opts: opts
    })
  end

  @doc """
  Get a webhook configuration for an app

  Returns the webhook configuration for a GitHub App. For more information about configuring a webhook for your app, see "[Creating a GitHub App](/developers/apps/creating-a-github-app)."

  You must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/webhooks#get-a-webhook-configuration-for-an-app)

  """
  @spec get_webhook_config_for_app(keyword) ::
          {:ok, GitHub.Webhook.Config.t()} | {:error, GitHub.Error.t()}
  def get_webhook_config_for_app(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {GitHub.Apps, :get_webhook_config_for_app},
      url: "/app/hook/config",
      method: :get,
      response: [{200, {GitHub.Webhook.Config, :t}}],
      opts: opts
    })
  end

  @doc """
  Get a delivery for an app webhook

  Returns a delivery for the webhook configured for a GitHub App.

  You must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/webhooks#get-a-delivery-for-an-app-webhook)

  """
  @spec get_webhook_delivery(integer, keyword) ::
          {:ok, GitHub.Hook.Delivery.t()} | {:error, GitHub.Error.t()}
  def get_webhook_delivery(delivery_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [delivery_id: delivery_id],
      call: {GitHub.Apps, :get_webhook_delivery},
      url: "/app/hook/deliveries/#{delivery_id}",
      method: :get,
      response: [
        {200, {GitHub.Hook.Delivery, :t}},
        {400, {:union, [{GitHub.BasicError, :t}, {GitHub.SCIM.Error, :t}]}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List accounts for a plan

  Returns user and organization accounts associated with the specified plan, including free plans. For per-seat pricing, you see the list of accounts that have purchased the plan, including the number of seats purchased. When someone submits a plan change that won't be processed until the end of their billing cycle, you will also see the upcoming pending change.

  GitHub Apps must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint. OAuth apps must use [basic authentication](https://docs.github.com/rest/overview/other-authentication-methods#basic-authentication) with their client ID and client secret to access this endpoint.

  ## Options

    * `sort`: The property to sort the results by.
    * `direction`: To return the oldest accounts first, set to `asc`. Ignored without the `sort` parameter.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/marketplace#list-accounts-for-a-plan)

  """
  @spec list_accounts_for_plan(integer, keyword) ::
          {:ok, [GitHub.Marketplace.Purchase.t()]} | {:error, GitHub.Error.t()}
  def list_accounts_for_plan(plan_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:direction, :page, :per_page, :sort])

    client.request(%{
      args: [plan_id: plan_id],
      call: {GitHub.Apps, :list_accounts_for_plan},
      url: "/marketplace_listing/plans/#{plan_id}/accounts",
      method: :get,
      query: query,
      response: [
        {200, [{GitHub.Marketplace.Purchase, :t}]},
        {401, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List accounts for a plan (stubbed)

  Returns repository and organization accounts associated with the specified plan, including free plans. For per-seat pricing, you see the list of accounts that have purchased the plan, including the number of seats purchased. When someone submits a plan change that won't be processed until the end of their billing cycle, you will also see the upcoming pending change.

  GitHub Apps must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint. OAuth apps must use [basic authentication](https://docs.github.com/rest/overview/other-authentication-methods#basic-authentication) with their client ID and client secret to access this endpoint.

  ## Options

    * `sort`: The property to sort the results by.
    * `direction`: To return the oldest accounts first, set to `asc`. Ignored without the `sort` parameter.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/marketplace#list-accounts-for-a-plan-stubbed)

  """
  @spec list_accounts_for_plan_stubbed(integer, keyword) ::
          {:ok, [GitHub.Marketplace.Purchase.t()]} | {:error, GitHub.Error.t()}
  def list_accounts_for_plan_stubbed(plan_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:direction, :page, :per_page, :sort])

    client.request(%{
      args: [plan_id: plan_id],
      call: {GitHub.Apps, :list_accounts_for_plan_stubbed},
      url: "/marketplace_listing/stubbed/plans/#{plan_id}/accounts",
      method: :get,
      query: query,
      response: [{200, [{GitHub.Marketplace.Purchase, :t}]}, {401, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @type list_installation_repos_for_authenticated_user_200_json_resp :: %{
          __info__: map,
          repositories: [GitHub.Repository.t()],
          repository_selection: String.t() | nil,
          total_count: integer
        }

  @doc """
  List repositories accessible to the user access token

  List repositories that the authenticated user has explicit permission (`:read`, `:write`, or `:admin`) to access for an installation.

  The authenticated user has explicit permission to access repositories they own, repositories where they are a collaborator, and repositories that they can access through an organization membership.

  The access the user has to each repository is included in the hash under the `permissions` key.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/installations#list-repositories-accessible-to-the-user-access-token)

  """
  @spec list_installation_repos_for_authenticated_user(integer, keyword) ::
          {:ok, map} | {:error, GitHub.Error.t()}
  def list_installation_repos_for_authenticated_user(installation_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [installation_id: installation_id],
      call: {GitHub.Apps, :list_installation_repos_for_authenticated_user},
      url: "/user/installations/#{installation_id}/repositories",
      method: :get,
      query: query,
      response: [
        {200, {GitHub.Apps, :list_installation_repos_for_authenticated_user_200_json_resp}},
        {304, :null},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List installation requests for the authenticated app

  Lists all the pending installation requests for the authenticated GitHub App.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/apps#list-installation-requests-for-the-authenticated-app)

  """
  @spec list_installation_requests_for_authenticated_app(keyword) ::
          {:ok, [GitHub.App.InstallationRequest.t()]} | {:error, GitHub.Error.t()}
  def list_installation_requests_for_authenticated_app(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {GitHub.Apps, :list_installation_requests_for_authenticated_app},
      url: "/app/installation-requests",
      method: :get,
      query: query,
      response: [
        {200, [{GitHub.App.InstallationRequest, :t}]},
        {304, :null},
        {401, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List installations for the authenticated app

  The permissions the installation has are included under the `permissions` key.

  You must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `since`: Only show results that were last updated after the given time. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    * `outdated`

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/apps#list-installations-for-the-authenticated-app)

  """
  @spec list_installations(keyword) ::
          {:ok, [GitHub.Installation.t()]} | {:error, GitHub.Error.t()}
  def list_installations(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:outdated, :page, :per_page, :since])

    client.request(%{
      args: [],
      call: {GitHub.Apps, :list_installations},
      url: "/app/installations",
      method: :get,
      query: query,
      response: [{200, [{GitHub.Installation, :t}]}],
      opts: opts
    })
  end

  @type list_installations_for_authenticated_user_200_json_resp :: %{
          __info__: map,
          installations: [GitHub.Installation.t()],
          total_count: integer
        }

  @doc """
  List app installations accessible to the user access token

  Lists installations of your GitHub App that the authenticated user has explicit permission (`:read`, `:write`, or `:admin`) to access.

  The authenticated user has explicit permission to access repositories they own, repositories where they are a collaborator, and repositories that they can access through an organization membership.

  You can find the permissions for the installation under the `permissions` key.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/installations#list-app-installations-accessible-to-the-user-access-token)

  """
  @spec list_installations_for_authenticated_user(keyword) ::
          {:ok, map} | {:error, GitHub.Error.t()}
  def list_installations_for_authenticated_user(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {GitHub.Apps, :list_installations_for_authenticated_user},
      url: "/user/installations",
      method: :get,
      query: query,
      response: [
        {200, {GitHub.Apps, :list_installations_for_authenticated_user_200_json_resp}},
        {304, :null},
        {401, {GitHub.BasicError, :t}},
        {403, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List plans

  Lists all plans that are part of your GitHub Marketplace listing.

  GitHub Apps must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint. OAuth apps must use [basic authentication](https://docs.github.com/rest/overview/other-authentication-methods#basic-authentication) with their client ID and client secret to access this endpoint.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/marketplace#list-plans)

  """
  @spec list_plans(keyword) ::
          {:ok, [GitHub.Marketplace.ListingPlan.t()]} | {:error, GitHub.Error.t()}
  def list_plans(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {GitHub.Apps, :list_plans},
      url: "/marketplace_listing/plans",
      method: :get,
      query: query,
      response: [
        {200, [{GitHub.Marketplace.ListingPlan, :t}]},
        {401, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List plans (stubbed)

  Lists all plans that are part of your GitHub Marketplace listing.

  GitHub Apps must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint. OAuth apps must use [basic authentication](https://docs.github.com/rest/overview/other-authentication-methods#basic-authentication) with their client ID and client secret to access this endpoint.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/marketplace#list-plans-stubbed)

  """
  @spec list_plans_stubbed(keyword) ::
          {:ok, [GitHub.Marketplace.ListingPlan.t()]} | {:error, GitHub.Error.t()}
  def list_plans_stubbed(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {GitHub.Apps, :list_plans_stubbed},
      url: "/marketplace_listing/stubbed/plans",
      method: :get,
      query: query,
      response: [{200, [{GitHub.Marketplace.ListingPlan, :t}]}, {401, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @type list_repos_accessible_to_installation_200_json_resp :: %{
          __info__: map,
          repositories: [GitHub.Repository.t()],
          repository_selection: String.t() | nil,
          total_count: integer
        }

  @doc """
  List repositories accessible to the app installation

  List repositories that an app installation can access.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/installations#list-repositories-accessible-to-the-app-installation)

  """
  @spec list_repos_accessible_to_installation(keyword) :: {:ok, map} | {:error, GitHub.Error.t()}
  def list_repos_accessible_to_installation(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {GitHub.Apps, :list_repos_accessible_to_installation},
      url: "/installation/repositories",
      method: :get,
      query: query,
      response: [
        {200, {GitHub.Apps, :list_repos_accessible_to_installation_200_json_resp}},
        {304, :null},
        {401, {GitHub.BasicError, :t}},
        {403, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List subscriptions for the authenticated user

  Lists the active subscriptions for the authenticated user.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/marketplace#list-subscriptions-for-the-authenticated-user)

  """
  @spec list_subscriptions_for_authenticated_user(keyword) ::
          {:ok, [GitHub.User.MarketplacePurchase.t()]} | {:error, GitHub.Error.t()}
  def list_subscriptions_for_authenticated_user(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {GitHub.Apps, :list_subscriptions_for_authenticated_user},
      url: "/user/marketplace_purchases",
      method: :get,
      query: query,
      response: [
        {200, [{GitHub.User.MarketplacePurchase, :t}]},
        {304, :null},
        {401, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List subscriptions for the authenticated user (stubbed)

  Lists the active subscriptions for the authenticated user.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/marketplace#list-subscriptions-for-the-authenticated-user-stubbed)

  """
  @spec list_subscriptions_for_authenticated_user_stubbed(keyword) ::
          {:ok, [GitHub.User.MarketplacePurchase.t()]} | {:error, GitHub.Error.t()}
  def list_subscriptions_for_authenticated_user_stubbed(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {GitHub.Apps, :list_subscriptions_for_authenticated_user_stubbed},
      url: "/user/marketplace_purchases/stubbed",
      method: :get,
      query: query,
      response: [
        {200, [{GitHub.User.MarketplacePurchase, :t}]},
        {304, :null},
        {401, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List deliveries for an app webhook

  Returns a list of webhook deliveries for the webhook configured for a GitHub App.

  You must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `cursor`: Used for pagination: the starting delivery from which the page of deliveries is fetched. Refer to the `link` header for the next and previous page cursors.
    * `redelivery`

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/webhooks#list-deliveries-for-an-app-webhook)

  """
  @spec list_webhook_deliveries(keyword) ::
          {:ok, [GitHub.Hook.DeliveryItem.t()]} | {:error, GitHub.Error.t()}
  def list_webhook_deliveries(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :per_page, :redelivery])

    client.request(%{
      args: [],
      call: {GitHub.Apps, :list_webhook_deliveries},
      url: "/app/hook/deliveries",
      method: :get,
      query: query,
      response: [
        {200, [{GitHub.Hook.DeliveryItem, :t}]},
        {400, {:union, [{GitHub.BasicError, :t}, {GitHub.SCIM.Error, :t}]}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Redeliver a delivery for an app webhook

  Redeliver a delivery for the webhook configured for a GitHub App.

  You must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/webhooks#redeliver-a-delivery-for-an-app-webhook)

  """
  @spec redeliver_webhook_delivery(integer, keyword) :: {:ok, map} | {:error, GitHub.Error.t()}
  def redeliver_webhook_delivery(delivery_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [delivery_id: delivery_id],
      call: {GitHub.Apps, :redeliver_webhook_delivery},
      url: "/app/hook/deliveries/#{delivery_id}/attempts",
      method: :post,
      response: [
        {202, :map},
        {400, {:union, [{GitHub.BasicError, :t}, {GitHub.SCIM.Error, :t}]}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Remove a repository from an app installation

  Remove a single repository from an installation. The authenticated user must have admin access to the repository. The installation must have the `repository_selection` of `selected`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/installations#remove-a-repository-from-an-app-installation)

  """
  @spec remove_repo_from_installation_for_authenticated_user(integer, integer, keyword) ::
          :ok | {:error, GitHub.Error.t()}
  def remove_repo_from_installation_for_authenticated_user(
        installation_id,
        repository_id,
        opts \\ []
      ) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [installation_id: installation_id, repository_id: repository_id],
      call: {GitHub.Apps, :remove_repo_from_installation_for_authenticated_user},
      url: "/user/installations/#{installation_id}/repositories/#{repository_id}",
      method: :delete,
      response: [
        {204, :null},
        {304, :null},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {422, :null}
      ],
      opts: opts
    })
  end

  @doc """
  Reset a token

  OAuth applications and GitHub applications with OAuth authorizations can use this API method to reset a valid OAuth token without end-user involvement. Applications must save the "token" property in the response because changes take effect immediately. You must use [Basic Authentication](https://docs.github.com/rest/overview/other-authentication-methods#basic-authentication) when accessing this endpoint, using the application's `client_id` and `client_secret` as the username and password. Invalid tokens will return `404 NOT FOUND`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/oauth-applications#reset-a-token)

  """
  @spec reset_token(String.t(), map, keyword) ::
          {:ok, GitHub.Authorization.t()} | {:error, GitHub.Error.t()}
  def reset_token(client_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [client_id: client_id, body: body],
      call: {GitHub.Apps, :reset_token},
      url: "/applications/#{client_id}/token",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{200, {GitHub.Authorization, :t}}, {422, {GitHub.ValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Revoke an installation access token

  Revokes the installation token you're using to authenticate as an installation and access this endpoint.

  Once an installation token is revoked, the token is invalidated and cannot be used. Other endpoints that require the revoked installation token must have a new installation token to work. You can create a new token using the "[Create an installation access token for an app](https://docs.github.com/rest/apps/apps#create-an-installation-access-token-for-an-app)" endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/installations#revoke-an-installation-access-token)

  """
  @spec revoke_installation_access_token(keyword) :: :ok | {:error, GitHub.Error.t()}
  def revoke_installation_access_token(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {GitHub.Apps, :revoke_installation_access_token},
      url: "/installation/token",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Create a scoped access token

  Use a non-scoped user access token to create a repository-scoped and/or permission-scoped user access token. You can specify
  which repositories the token can access and which permissions are granted to the
  token.

  Invalid tokens will return `404 NOT FOUND`.

  You must use [Basic Authentication](https://docs.github.com/rest/overview/other-authentication-methods#basic-authentication)
  when accessing this endpoint, using the `client_id` and `client_secret` of the GitHub App
  as the username and password.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/apps#create-a-scoped-access-token)

  """
  @spec scope_token(String.t(), map, keyword) ::
          {:ok, GitHub.Authorization.t()} | {:error, GitHub.Error.t()}
  def scope_token(client_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [client_id: client_id, body: body],
      call: {GitHub.Apps, :scope_token},
      url: "/applications/#{client_id}/token/scoped",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, {GitHub.Authorization, :t}},
        {401, {GitHub.BasicError, :t}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Suspend an app installation

  Suspends a GitHub App on a user, organization, or business account, which blocks the app from accessing the account's resources. When a GitHub App is suspended, the app's access to the GitHub API or webhook events is blocked for that account.

  You must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/apps#suspend-an-app-installation)

  """
  @spec suspend_installation(integer, keyword) :: :ok | {:error, GitHub.Error.t()}
  def suspend_installation(installation_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [installation_id: installation_id],
      call: {GitHub.Apps, :suspend_installation},
      url: "/app/installations/#{installation_id}/suspended",
      method: :put,
      response: [{204, :null}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  Unsuspend an app installation

  Removes a GitHub App installation suspension.

  You must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/apps#unsuspend-an-app-installation)

  """
  @spec unsuspend_installation(integer, keyword) :: :ok | {:error, GitHub.Error.t()}
  def unsuspend_installation(installation_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [installation_id: installation_id],
      call: {GitHub.Apps, :unsuspend_installation},
      url: "/app/installations/#{installation_id}/suspended",
      method: :delete,
      response: [{204, :null}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  Update a webhook configuration for an app

  Updates the webhook configuration for a GitHub App. For more information about configuring a webhook for your app, see "[Creating a GitHub App](/developers/apps/creating-a-github-app)."

  You must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/apps/webhooks#update-a-webhook-configuration-for-an-app)

  """
  @spec update_webhook_config_for_app(map, keyword) ::
          {:ok, GitHub.Webhook.Config.t()} | {:error, GitHub.Error.t()}
  def update_webhook_config_for_app(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {GitHub.Apps, :update_webhook_config_for_app},
      url: "/app/hook/config",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{200, {GitHub.Webhook.Config, :t}}],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:create_from_manifest_201_json_resp) do
    [
      client_id: {:string, :generic},
      client_secret: {:string, :generic},
      created_at: {:string, :date_time},
      description: {:union, [{:string, :generic}, :null]},
      events: [string: :generic],
      external_url: {:string, :uri},
      html_url: {:string, :uri},
      id: :integer,
      installations_count: :integer,
      name: {:string, :generic},
      node_id: {:string, :generic},
      owner: {:union, [{GitHub.User, :simple}, :null]},
      pem: {:string, :generic},
      permissions: :map,
      slug: {:string, :generic},
      updated_at: {:string, :date_time},
      webhook_secret: {:union, [{:string, :generic}, :null]}
    ]
  end

  def __fields__(:list_installation_repos_for_authenticated_user_200_json_resp) do
    [
      repositories: [{GitHub.Repository, :t}],
      repository_selection: {:string, :generic},
      total_count: :integer
    ]
  end

  def __fields__(:list_installations_for_authenticated_user_200_json_resp) do
    [installations: [{GitHub.Installation, :t}], total_count: :integer]
  end

  def __fields__(:list_repos_accessible_to_installation_200_json_resp) do
    [
      repositories: [{GitHub.Repository, :t}],
      repository_selection: {:string, :generic},
      total_count: :integer
    ]
  end
end
