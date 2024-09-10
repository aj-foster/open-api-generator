defmodule GitHub.SecurityAdvisories do
  @moduledoc """
  Provides API endpoints related to security advisories
  """

  @default_client GitHub.Client

  @doc """
  Create a temporary private fork

  Create a temporary private fork to collaborate on fixing a security vulnerability in your repository.

  **Note**: Forking a repository happens asynchronously. You may have to wait up to 5 minutes before you can access the fork.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/security-advisories/repository-advisories#create-a-temporary-private-fork)

  """
  @spec create_fork(String.t(), String.t(), String.t(), keyword) ::
          {:ok, GitHub.Repository.full()} | {:error, GitHub.Error.t()}
  def create_fork(owner, repo, ghsa_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, ghsa_id: ghsa_id],
      call: {GitHub.SecurityAdvisories, :create_fork},
      url: "/repos/#{owner}/#{repo}/security-advisories/#{ghsa_id}/forks",
      method: :post,
      response: [
        {202, {GitHub.Repository, :full}},
        {400, {:union, [{GitHub.BasicError, :t}, {GitHub.SCIM.Error, :t}]}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Privately report a security vulnerability

  Report a security vulnerability to the maintainers of the repository.
  See "[Privately reporting a security vulnerability](https://docs.github.com/code-security/security-advisories/guidance-on-reporting-and-writing/privately-reporting-a-security-vulnerability)" for more information about private vulnerability reporting.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/security-advisories/repository-advisories#privately-report-a-security-vulnerability)

  """
  @spec create_private_vulnerability_report(
          String.t(),
          String.t(),
          GitHub.PrivateVulnerabilityReport.Create.t(),
          keyword
        ) :: {:ok, GitHub.Repository.Advisory.t()} | {:error, GitHub.Error.t()}
  def create_private_vulnerability_report(owner, repo, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, body: body],
      call: {GitHub.SecurityAdvisories, :create_private_vulnerability_report},
      url: "/repos/#{owner}/#{repo}/security-advisories/reports",
      body: body,
      method: :post,
      request: [{"application/json", {GitHub.PrivateVulnerabilityReport.Create, :t}}],
      response: [
        {201, {GitHub.Repository.Advisory, :t}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create a repository security advisory

  Creates a new repository security advisory.

  In order to create a draft repository security advisory, the authenticated user must be a security manager or administrator of that repository.

  OAuth app tokens and personal access tokens (classic) need the `repo` or `repository_advisories:write` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/security-advisories/repository-advisories#create-a-repository-security-advisory)

  """
  @spec create_repository_advisory(
          String.t(),
          String.t(),
          GitHub.Repository.Advisory.Create.t(),
          keyword
        ) :: {:ok, GitHub.Repository.Advisory.t()} | {:error, GitHub.Error.t()}
  def create_repository_advisory(owner, repo, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, body: body],
      call: {GitHub.SecurityAdvisories, :create_repository_advisory},
      url: "/repos/#{owner}/#{repo}/security-advisories",
      body: body,
      method: :post,
      request: [{"application/json", {GitHub.Repository.Advisory.Create, :t}}],
      response: [
        {201, {GitHub.Repository.Advisory, :t}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Request a CVE for a repository security advisory

  If you want a CVE identification number for the security vulnerability in your project, and don't already have one, you can request a CVE identification number from GitHub. For more information see "[Requesting a CVE identification number](https://docs.github.com/code-security/security-advisories/repository-security-advisories/publishing-a-repository-security-advisory#requesting-a-cve-identification-number-optional)."

  You may request a CVE for public repositories, but cannot do so for private repositories.

  In order to request a CVE for a repository security advisory, the authenticated user must be a security manager or administrator of that repository.

  OAuth app tokens and personal access tokens (classic) need the `repo` or `repository_advisories:write` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/security-advisories/repository-advisories#request-a-cve-for-a-repository-security-advisory)

  """
  @spec create_repository_advisory_cve_request(String.t(), String.t(), String.t(), keyword) ::
          {:ok, map} | {:error, GitHub.Error.t()}
  def create_repository_advisory_cve_request(owner, repo, ghsa_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, ghsa_id: ghsa_id],
      call: {GitHub.SecurityAdvisories, :create_repository_advisory_cve_request},
      url: "/repos/#{owner}/#{repo}/security-advisories/#{ghsa_id}/cve",
      method: :post,
      response: [
        {202, :map},
        {400, {:union, [{GitHub.BasicError, :t}, {GitHub.SCIM.Error, :t}]}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a global security advisory

  Gets a global security advisory using its GitHub Security Advisory (GHSA) identifier.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/security-advisories/global-advisories#get-a-global-security-advisory)

  """
  @spec get_global_advisory(String.t(), keyword) ::
          {:ok, GitHub.GlobalAdvisory.t()} | {:error, GitHub.Error.t()}
  def get_global_advisory(ghsa_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [ghsa_id: ghsa_id],
      call: {GitHub.SecurityAdvisories, :get_global_advisory},
      url: "/advisories/#{ghsa_id}",
      method: :get,
      response: [{200, {GitHub.GlobalAdvisory, :t}}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get a repository security advisory

  Get a repository security advisory using its GitHub Security Advisory (GHSA) identifier.

  Anyone can access any published security advisory on a public repository.

  The authenticated user can access an unpublished security advisory from a repository if they are a security manager or administrator of that repository, or if they are a
  collaborator on the security advisory.

  OAuth app tokens and personal access tokens (classic) need the `repo` or `repository_advisories:read` scope to to get a published security advisory in a private repository, or any unpublished security advisory that the authenticated user has access to.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/security-advisories/repository-advisories#get-a-repository-security-advisory)

  """
  @spec get_repository_advisory(String.t(), String.t(), String.t(), keyword) ::
          {:ok, GitHub.Repository.Advisory.t()} | {:error, GitHub.Error.t()}
  def get_repository_advisory(owner, repo, ghsa_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, ghsa_id: ghsa_id],
      call: {GitHub.SecurityAdvisories, :get_repository_advisory},
      url: "/repos/#{owner}/#{repo}/security-advisories/#{ghsa_id}",
      method: :get,
      response: [
        {200, {GitHub.Repository.Advisory, :t}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List global security advisories

  Lists all global security advisories that match the specified parameters. If no other parameters are defined, the request will return only GitHub-reviewed advisories that are not malware.

  By default, all responses will exclude advisories for malware, because malware are not standard vulnerabilities. To list advisories for malware, you must include the `type` parameter in your request, with the value `malware`. For more information about the different types of security advisories, see "[About the GitHub Advisory database](https://docs.github.com/code-security/security-advisories/global-security-advisories/about-the-github-advisory-database#about-types-of-security-advisories)."

  ## Options

    * `ghsa_id`: If specified, only advisories with this GHSA (GitHub Security Advisory) identifier will be returned.
    * `type`: If specified, only advisories of this type will be returned. By default, a request with no other parameters defined will only return reviewed advisories that are not malware.
    * `cve_id`: If specified, only advisories with this CVE (Common Vulnerabilities and Exposures) identifier will be returned.
    * `ecosystem`: If specified, only advisories for these ecosystems will be returned.
    * `severity`: If specified, only advisories with these severities will be returned.
    * `cwes`: If specified, only advisories with these Common Weakness Enumerations (CWEs) will be returned.
      
      Example: `cwes=79,284,22` or `cwes[]=79&cwes[]=284&cwes[]=22`
    * `is_withdrawn`: Whether to only return advisories that have been withdrawn.
    * `affects`: If specified, only return advisories that affect any of `package` or `package@version`. A maximum of 1000 packages can be specified.
      If the query parameter causes the URL to exceed the maximum URL length supported by your client, you must specify fewer packages.
      
      Example: `affects=package1,package2@1.0.0,package3@^2.0.0` or `affects[]=package1&affects[]=package2@1.0.0`
    * `published`: If specified, only return advisories that were published on a date or date range.
      
      For more information on the syntax of the date range, see "[Understanding the search syntax](https://docs.github.com/search-github/getting-started-with-searching-on-github/understanding-the-search-syntax#query-for-dates)."
    * `updated`: If specified, only return advisories that were updated on a date or date range.
      
      For more information on the syntax of the date range, see "[Understanding the search syntax](https://docs.github.com/search-github/getting-started-with-searching-on-github/understanding-the-search-syntax#query-for-dates)."
    * `modified`: If specified, only show advisories that were updated or published on a date or date range.
      
      For more information on the syntax of the date range, see "[Understanding the search syntax](https://docs.github.com/search-github/getting-started-with-searching-on-github/understanding-the-search-syntax#query-for-dates)."
    * `before`: A cursor, as given in the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers). If specified, the query only searches for results before this cursor. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `after`: A cursor, as given in the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers). If specified, the query only searches for results after this cursor. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `direction`: The direction to sort the results by.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `sort`: The property to sort the results by.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/security-advisories/global-advisories#list-global-security-advisories)

  """
  @spec list_global_advisories(keyword) ::
          {:ok, [GitHub.GlobalAdvisory.t()]} | {:error, GitHub.Error.t()}
  def list_global_advisories(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :affects,
        :after,
        :before,
        :cve_id,
        :cwes,
        :direction,
        :ecosystem,
        :ghsa_id,
        :is_withdrawn,
        :modified,
        :per_page,
        :published,
        :severity,
        :sort,
        :type,
        :updated
      ])

    client.request(%{
      args: [],
      call: {GitHub.SecurityAdvisories, :list_global_advisories},
      url: "/advisories",
      method: :get,
      query: query,
      response: [
        {200, [{GitHub.GlobalAdvisory, :t}]},
        {422, {GitHub.ValidationError, :simple}},
        {429, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List repository security advisories for an organization

  Lists repository security advisories for an organization.

  The authenticated user must be an owner or security manager for the organization to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `repo` or `repository_advisories:write` scope to use this endpoint.

  ## Options

    * `direction`: The direction to sort the results by.
    * `sort`: The property to sort the results by.
    * `before`: A cursor, as given in the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers). If specified, the query only searches for results before this cursor. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `after`: A cursor, as given in the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers). If specified, the query only searches for results after this cursor. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `per_page`: The number of advisories to return per page. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `state`: Filter by the state of the repository advisories. Only advisories of this state will be returned.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/security-advisories/repository-advisories#list-repository-security-advisories-for-an-organization)

  """
  @spec list_org_repository_advisories(String.t(), keyword) ::
          {:ok, [GitHub.Repository.Advisory.t()]} | {:error, GitHub.Error.t()}
  def list_org_repository_advisories(org, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :before, :direction, :per_page, :sort, :state])

    client.request(%{
      args: [org: org],
      call: {GitHub.SecurityAdvisories, :list_org_repository_advisories},
      url: "/orgs/#{org}/security-advisories",
      method: :get,
      query: query,
      response: [
        {200, [{GitHub.Repository.Advisory, :t}]},
        {400, {:union, [{GitHub.BasicError, :t}, {GitHub.SCIM.Error, :t}]}},
        {404, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List repository security advisories

  Lists security advisories in a repository.

  The authenticated user can access unpublished security advisories from a repository if they are a security manager or administrator of that repository, or if they are a collaborator on any security advisory.

  OAuth app tokens and personal access tokens (classic) need the `repo` or `repository_advisories:read` scope to to get a published security advisory in a private repository, or any unpublished security advisory that the authenticated user has access to.

  ## Options

    * `direction`: The direction to sort the results by.
    * `sort`: The property to sort the results by.
    * `before`: A cursor, as given in the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers). If specified, the query only searches for results before this cursor. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `after`: A cursor, as given in the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers). If specified, the query only searches for results after this cursor. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `per_page`: The number of advisories to return per page. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `state`: Filter by state of the repository advisories. Only advisories of this state will be returned.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/security-advisories/repository-advisories#list-repository-security-advisories)

  """
  @spec list_repository_advisories(String.t(), String.t(), keyword) ::
          {:ok, [GitHub.Repository.Advisory.t()]} | {:error, GitHub.Error.t()}
  def list_repository_advisories(owner, repo, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :before, :direction, :per_page, :sort, :state])

    client.request(%{
      args: [owner: owner, repo: repo],
      call: {GitHub.SecurityAdvisories, :list_repository_advisories},
      url: "/repos/#{owner}/#{repo}/security-advisories",
      method: :get,
      query: query,
      response: [
        {200, [{GitHub.Repository.Advisory, :t}]},
        {400, {:union, [{GitHub.BasicError, :t}, {GitHub.SCIM.Error, :t}]}},
        {404, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a repository security advisory

  Update a repository security advisory using its GitHub Security Advisory (GHSA) identifier.

  In order to update any security advisory, the authenticated user must be a security manager or administrator of that repository,
  or a collaborator on the repository security advisory.

  OAuth app tokens and personal access tokens (classic) need the `repo` or `repository_advisories:write` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/security-advisories/repository-advisories#update-a-repository-security-advisory)

  """
  @spec update_repository_advisory(
          String.t(),
          String.t(),
          String.t(),
          GitHub.Repository.Advisory.Update.t(),
          keyword
        ) :: {:ok, GitHub.Repository.Advisory.t()} | {:error, GitHub.Error.t()}
  def update_repository_advisory(owner, repo, ghsa_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, ghsa_id: ghsa_id, body: body],
      call: {GitHub.SecurityAdvisories, :update_repository_advisory},
      url: "/repos/#{owner}/#{repo}/security-advisories/#{ghsa_id}",
      body: body,
      method: :patch,
      request: [{"application/json", {GitHub.Repository.Advisory.Update, :t}}],
      response: [
        {200, {GitHub.Repository.Advisory, :t}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end
end
