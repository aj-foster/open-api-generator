defmodule GitHub.Billing do
  @moduledoc """
  Provides API endpoints related to billing
  """

  @default_client GitHub.Client

  @doc """
  Get GitHub Actions billing for an organization

  Gets the summary of the free and paid GitHub Actions minutes used.

  Paid minutes only apply to workflows in private repositories that use GitHub-hosted runners. Minutes used is listed for each GitHub-hosted runner operating system. Any job re-runs are also included in the usage. The usage returned includes any minute multipliers for macOS and Windows runners, and is rounded up to the nearest whole minute. For more information, see "[Managing billing for GitHub Actions](https://docs.github.com/github/setting-up-and-managing-billing-and-payments-on-github/managing-billing-for-github-actions)".

  OAuth app tokens and personal access tokens (classic) need the `repo` or `admin:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/billing/billing#get-github-actions-billing-for-an-organization)

  """
  @spec get_github_actions_billing_org(String.t(), keyword) ::
          {:ok, GitHub.Actions.BillingUsage.t()} | {:error, GitHub.Error.t()}
  def get_github_actions_billing_org(org, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org],
      call: {GitHub.Billing, :get_github_actions_billing_org},
      url: "/orgs/#{org}/settings/billing/actions",
      method: :get,
      response: [{200, {GitHub.Actions.BillingUsage, :t}}],
      opts: opts
    })
  end

  @doc """
  Get GitHub Actions billing for a user

  Gets the summary of the free and paid GitHub Actions minutes used.

  Paid minutes only apply to workflows in private repositories that use GitHub-hosted runners. Minutes used is listed for each GitHub-hosted runner operating system. Any job re-runs are also included in the usage. The usage returned includes any minute multipliers for macOS and Windows runners, and is rounded up to the nearest whole minute. For more information, see "[Managing billing for GitHub Actions](https://docs.github.com/github/setting-up-and-managing-billing-and-payments-on-github/managing-billing-for-github-actions)".

  OAuth app tokens and personal access tokens (classic) need the `user` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/billing/billing#get-github-actions-billing-for-a-user)

  """
  @spec get_github_actions_billing_user(String.t(), keyword) ::
          {:ok, GitHub.Actions.BillingUsage.t()} | {:error, GitHub.Error.t()}
  def get_github_actions_billing_user(username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [username: username],
      call: {GitHub.Billing, :get_github_actions_billing_user},
      url: "/users/#{username}/settings/billing/actions",
      method: :get,
      response: [{200, {GitHub.Actions.BillingUsage, :t}}],
      opts: opts
    })
  end

  @doc """
  Get GitHub Packages billing for an organization

  Gets the free and paid storage used for GitHub Packages in gigabytes.

  Paid minutes only apply to packages stored for private repositories. For more information, see "[Managing billing for GitHub Packages](https://docs.github.com/github/setting-up-and-managing-billing-and-payments-on-github/managing-billing-for-github-packages)."

  OAuth app tokens and personal access tokens (classic) need the `repo` or `admin:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/billing/billing#get-github-packages-billing-for-an-organization)

  """
  @spec get_github_packages_billing_org(String.t(), keyword) ::
          {:ok, GitHub.PackagesBillingUsage.t()} | {:error, GitHub.Error.t()}
  def get_github_packages_billing_org(org, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org],
      call: {GitHub.Billing, :get_github_packages_billing_org},
      url: "/orgs/#{org}/settings/billing/packages",
      method: :get,
      response: [{200, {GitHub.PackagesBillingUsage, :t}}],
      opts: opts
    })
  end

  @doc """
  Get GitHub Packages billing for a user

  Gets the free and paid storage used for GitHub Packages in gigabytes.

  Paid minutes only apply to packages stored for private repositories. For more information, see "[Managing billing for GitHub Packages](https://docs.github.com/github/setting-up-and-managing-billing-and-payments-on-github/managing-billing-for-github-packages)."

  OAuth app tokens and personal access tokens (classic) need the `user` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/billing/billing#get-github-packages-billing-for-a-user)

  """
  @spec get_github_packages_billing_user(String.t(), keyword) ::
          {:ok, GitHub.PackagesBillingUsage.t()} | {:error, GitHub.Error.t()}
  def get_github_packages_billing_user(username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [username: username],
      call: {GitHub.Billing, :get_github_packages_billing_user},
      url: "/users/#{username}/settings/billing/packages",
      method: :get,
      response: [{200, {GitHub.PackagesBillingUsage, :t}}],
      opts: opts
    })
  end

  @doc """
  Get shared storage billing for an organization

  Gets the estimated paid and estimated total storage used for GitHub Actions and GitHub Packages.

  Paid minutes only apply to packages stored for private repositories. For more information, see "[Managing billing for GitHub Packages](https://docs.github.com/github/setting-up-and-managing-billing-and-payments-on-github/managing-billing-for-github-packages)."

  OAuth app tokens and personal access tokens (classic) need the `repo` or `admin:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/billing/billing#get-shared-storage-billing-for-an-organization)

  """
  @spec get_shared_storage_billing_org(String.t(), keyword) ::
          {:ok, GitHub.CombinedBillingUsage.t()} | {:error, GitHub.Error.t()}
  def get_shared_storage_billing_org(org, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org],
      call: {GitHub.Billing, :get_shared_storage_billing_org},
      url: "/orgs/#{org}/settings/billing/shared-storage",
      method: :get,
      response: [{200, {GitHub.CombinedBillingUsage, :t}}],
      opts: opts
    })
  end

  @doc """
  Get shared storage billing for a user

  Gets the estimated paid and estimated total storage used for GitHub Actions and GitHub Packages.

  Paid minutes only apply to packages stored for private repositories. For more information, see "[Managing billing for GitHub Packages](https://docs.github.com/github/setting-up-and-managing-billing-and-payments-on-github/managing-billing-for-github-packages)."

  OAuth app tokens and personal access tokens (classic) need the `user` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/billing/billing#get-shared-storage-billing-for-a-user)

  """
  @spec get_shared_storage_billing_user(String.t(), keyword) ::
          {:ok, GitHub.CombinedBillingUsage.t()} | {:error, GitHub.Error.t()}
  def get_shared_storage_billing_user(username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [username: username],
      call: {GitHub.Billing, :get_shared_storage_billing_user},
      url: "/users/#{username}/settings/billing/shared-storage",
      method: :get,
      response: [{200, {GitHub.CombinedBillingUsage, :t}}],
      opts: opts
    })
  end
end
