defmodule GitHub.CodeScanning do
  @moduledoc """
  Provides API endpoints related to code scanning
  """

  @default_client GitHub.Client

  @doc """
  Create a CodeQL variant analysis

  Creates a new CodeQL variant analysis, which will run a CodeQL query against one or more repositories.

  Get started by learning more about [running CodeQL queries at scale with Multi-Repository Variant Analysis](https://docs.github.com/code-security/codeql-for-vs-code/getting-started-with-codeql-for-vs-code/running-codeql-queries-at-scale-with-multi-repository-variant-analysis).

  Use the `owner` and `repo` parameters in the URL to specify the controller repository that
  will be used for running GitHub Actions workflows and storing the results of the CodeQL variant analysis.

  OAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-scanning/code-scanning#create-a-codeql-variant-analysis)

  """
  @spec create_variant_analysis(String.t(), String.t(), map, keyword) ::
          {:ok, GitHub.CodeScanning.VariantAnalysis.t()} | {:error, GitHub.Error.t()}
  def create_variant_analysis(owner, repo, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, body: body],
      call: {GitHub.CodeScanning, :create_variant_analysis},
      url: "/repos/#{owner}/#{repo}/code-scanning/codeql/variant-analyses",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {GitHub.CodeScanning.VariantAnalysis, :t}},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.BasicError, :t}},
        {503, {GitHub.ServiceUnavailable, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a code scanning analysis from a repository

  Deletes a specified code scanning analysis from a repository.

  You can delete one analysis at a time.
  To delete a series of analyses, start with the most recent analysis and work backwards.
  Conceptually, the process is similar to the undo function in a text editor.

  When you list the analyses for a repository,
  one or more will be identified as deletable in the response:

  ```
  "deletable": true
  ```

  An analysis is deletable when it's the most recent in a set of analyses.
  Typically, a repository will have multiple sets of analyses
  for each enabled code scanning tool,
  where a set is determined by a unique combination of analysis values:

  * `ref`
  * `tool`
  * `category`

  If you attempt to delete an analysis that is not the most recent in a set,
  you'll get a 400 response with the message:

  ```
  Analysis specified is not deletable.
  ```

  The response from a successful `DELETE` operation provides you with
  two alternative URLs for deleting the next analysis in the set:
  `next_analysis_url` and `confirm_delete_url`.
  Use the `next_analysis_url` URL if you want to avoid accidentally deleting the final analysis
  in a set. This is a useful option if you want to preserve at least one analysis
  for the specified tool in your repository.
  Use the `confirm_delete_url` URL if you are content to remove all analyses for a tool.
  When you delete the last analysis in a set, the value of `next_analysis_url` and `confirm_delete_url`
  in the 200 response is `null`.

  As an example of the deletion process,
  let's imagine that you added a workflow that configured a particular code scanning tool
  to analyze the code in a repository. This tool has added 15 analyses:
  10 on the default branch, and another 5 on a topic branch.
  You therefore have two separate sets of analyses for this tool.
  You've now decided that you want to remove all of the analyses for the tool.
  To do this you must make 15 separate deletion requests.
  To start, you must find an analysis that's identified as deletable.
  Each set of analyses always has one that's identified as deletable.
  Having found the deletable analysis for one of the two sets,
  delete this analysis and then continue deleting the next analysis in the set until they're all deleted.
  Then repeat the process for the second set.
  The procedure therefore consists of a nested loop:

  **Outer loop**:
  * List the analyses for the repository, filtered by tool.
  * Parse this list to find a deletable analysis. If found:

    **Inner loop**:
    * Delete the identified analysis.
    * Parse the response for the value of `confirm_delete_url` and, if found, use this in the next iteration.

  The above process assumes that you want to remove all trace of the tool's analyses from the GitHub user interface, for the specified repository, and it therefore uses the `confirm_delete_url` value. Alternatively, you could use the `next_analysis_url` value, which would leave the last analysis in each set undeleted to avoid removing a tool's analysis entirely.

  OAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories.

  ## Options

    * `confirm_delete`: Allow deletion if the specified analysis is the last in a set. If you attempt to delete the final analysis in a set without setting this parameter to `true`, you'll get a 400 response with the message: `Analysis is last of its type and deletion may result in the loss of historical alert data. Please specify confirm_delete.`

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-scanning/code-scanning#delete-a-code-scanning-analysis-from-a-repository)

  """
  @spec delete_analysis(String.t(), String.t(), integer, keyword) ::
          {:ok, GitHub.CodeScanning.AnalysisDeletion.t()} | {:error, GitHub.Error.t()}
  def delete_analysis(owner, repo, analysis_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:confirm_delete])

    client.request(%{
      args: [owner: owner, repo: repo, analysis_id: analysis_id],
      call: {GitHub.CodeScanning, :delete_analysis},
      url: "/repos/#{owner}/#{repo}/code-scanning/analyses/#{analysis_id}",
      method: :delete,
      query: query,
      response: [
        {200, {GitHub.CodeScanning.AnalysisDeletion, :t}},
        {400, {:union, [{GitHub.BasicError, :t}, {GitHub.SCIM.Error, :t}]}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {503, {GitHub.ServiceUnavailable, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a code scanning alert

  Gets a single code scanning alert.

  OAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-scanning/code-scanning#get-a-code-scanning-alert)

  """
  @spec get_alert(String.t(), String.t(), integer, keyword) ::
          {:ok, GitHub.CodeScanning.Alert.t()} | {:error, GitHub.Error.t()}
  def get_alert(owner, repo, alert_number, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, alert_number: alert_number],
      call: {GitHub.CodeScanning, :get_alert},
      url: "/repos/#{owner}/#{repo}/code-scanning/alerts/#{alert_number}",
      method: :get,
      response: [
        {200, {GitHub.CodeScanning.Alert, :t}},
        {304, :null},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {503, {GitHub.ServiceUnavailable, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a code scanning analysis for a repository

  Gets a specified code scanning analysis for a repository.

  The default JSON response contains fields that describe the analysis.
  This includes the Git reference and commit SHA to which the analysis relates,
  the datetime of the analysis, the name of the code scanning tool,
  and the number of alerts.

  The `rules_count` field in the default response give the number of rules
  that were run in the analysis.
  For very old analyses this data is not available,
  and `0` is returned in this field.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/sarif+json`**: Instead of returning a summary of the analysis, this endpoint returns a subset of the analysis data that was uploaded. The data is formatted as [SARIF version 2.1.0](https://docs.oasis-open.org/sarif/sarif/v2.1.0/cs01/sarif-v2.1.0-cs01.html). It also returns additional data such as the `github/alertNumber` and `github/alertUrl` properties.

  OAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-scanning/code-scanning#get-a-code-scanning-analysis-for-a-repository)

  """
  @spec get_analysis(String.t(), String.t(), integer, keyword) ::
          {:ok, map | GitHub.CodeScanning.Analysis.t()} | {:error, GitHub.Error.t()}
  def get_analysis(owner, repo, analysis_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, analysis_id: analysis_id],
      call: {GitHub.CodeScanning, :get_analysis},
      url: "/repos/#{owner}/#{repo}/code-scanning/analyses/#{analysis_id}",
      method: :get,
      response: [
        {200, {:union, [:map, {GitHub.CodeScanning.Analysis, :t}]}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {503, {GitHub.ServiceUnavailable, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a CodeQL database for a repository

  Gets a CodeQL database for a language in a repository.

  By default this endpoint returns JSON metadata about the CodeQL database. To
  download the CodeQL database binary content, set the `Accept` header of the request
  to [`application/zip`](https://docs.github.com/rest/overview/media-types), and make sure
  your HTTP client is configured to follow redirects or use the `Location` header
  to make a second request to get the redirect URL.

  OAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-scanning/code-scanning#get-a-codeql-database-for-a-repository)

  """
  @spec get_codeql_database(String.t(), String.t(), String.t(), keyword) ::
          {:ok, GitHub.CodeScanning.CodeqlDatabase.t()} | {:error, GitHub.Error.t()}
  def get_codeql_database(owner, repo, language, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, language: language],
      call: {GitHub.CodeScanning, :get_codeql_database},
      url: "/repos/#{owner}/#{repo}/code-scanning/codeql/databases/#{language}",
      method: :get,
      response: [
        {200, {GitHub.CodeScanning.CodeqlDatabase, :t}},
        {302, :null},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {503, {GitHub.ServiceUnavailable, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a code scanning default setup configuration

  Gets a code scanning default setup configuration.

  OAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-scanning/code-scanning#get-a-code-scanning-default-setup-configuration)

  """
  @spec get_default_setup(String.t(), String.t(), keyword) ::
          {:ok, GitHub.CodeScanning.DefaultSetup.t()} | {:error, GitHub.Error.t()}
  def get_default_setup(owner, repo, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo],
      call: {GitHub.CodeScanning, :get_default_setup},
      url: "/repos/#{owner}/#{repo}/code-scanning/default-setup",
      method: :get,
      response: [
        {200, {GitHub.CodeScanning.DefaultSetup, :t}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {503, {GitHub.ServiceUnavailable, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get information about a SARIF upload

  Gets information about a SARIF upload, including the status and the URL of the analysis that was uploaded so that you can retrieve details of the analysis. For more information, see "[Get a code scanning analysis for a repository](/rest/code-scanning/code-scanning#get-a-code-scanning-analysis-for-a-repository)."
  OAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-scanning/code-scanning#get-information-about-a-sarif-upload)

  """
  @spec get_sarif(String.t(), String.t(), String.t(), keyword) ::
          {:ok, GitHub.CodeScanning.SarifsStatus.t()} | {:error, GitHub.Error.t()}
  def get_sarif(owner, repo, sarif_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, sarif_id: sarif_id],
      call: {GitHub.CodeScanning, :get_sarif},
      url: "/repos/#{owner}/#{repo}/code-scanning/sarifs/#{sarif_id}",
      method: :get,
      response: [
        {200, {GitHub.CodeScanning.SarifsStatus, :t}},
        {403, {GitHub.BasicError, :t}},
        {404, :null},
        {503, {GitHub.ServiceUnavailable, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get the summary of a CodeQL variant analysis

  Gets the summary of a CodeQL variant analysis.

  OAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-scanning/code-scanning#get-the-summary-of-a-codeql-variant-analysis)

  """
  @spec get_variant_analysis(String.t(), String.t(), integer, keyword) ::
          {:ok, GitHub.CodeScanning.VariantAnalysis.t()} | {:error, GitHub.Error.t()}
  def get_variant_analysis(owner, repo, codeql_variant_analysis_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, codeql_variant_analysis_id: codeql_variant_analysis_id],
      call: {GitHub.CodeScanning, :get_variant_analysis},
      url:
        "/repos/#{owner}/#{repo}/code-scanning/codeql/variant-analyses/#{codeql_variant_analysis_id}",
      method: :get,
      response: [
        {200, {GitHub.CodeScanning.VariantAnalysis, :t}},
        {404, {GitHub.BasicError, :t}},
        {503, {GitHub.ServiceUnavailable, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get the analysis status of a repository in a CodeQL variant analysis

  Gets the analysis status of a repository in a CodeQL variant analysis.

  OAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-scanning/code-scanning#get-the-analysis-status-of-a-repository-in-a-codeql-variant-analysis)

  """
  @spec get_variant_analysis_repo_task(
          String.t(),
          String.t(),
          integer,
          String.t(),
          String.t(),
          keyword
        ) :: {:ok, GitHub.CodeScanning.VariantAnalysisRepoTask.t()} | {:error, GitHub.Error.t()}
  def get_variant_analysis_repo_task(
        owner,
        repo,
        codeql_variant_analysis_id,
        repo_owner,
        repo_name,
        opts \\ []
      ) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [
        owner: owner,
        repo: repo,
        codeql_variant_analysis_id: codeql_variant_analysis_id,
        repo_owner: repo_owner,
        repo_name: repo_name
      ],
      call: {GitHub.CodeScanning, :get_variant_analysis_repo_task},
      url:
        "/repos/#{owner}/#{repo}/code-scanning/codeql/variant-analyses/#{codeql_variant_analysis_id}/repos/#{repo_owner}/#{repo_name}",
      method: :get,
      response: [
        {200, {GitHub.CodeScanning.VariantAnalysisRepoTask, :t}},
        {404, {GitHub.BasicError, :t}},
        {503, {GitHub.ServiceUnavailable, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  List instances of a code scanning alert

  Lists all instances of the specified code scanning alert.

  OAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories.

  ## Options

    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `ref`: The Git reference for the results you want to list. The `ref` for a branch can be formatted either as `refs/heads/<branch name>` or simply `<branch name>`. To reference a pull request use `refs/pull/<number>/merge`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-scanning/code-scanning#list-instances-of-a-code-scanning-alert)

  """
  @spec list_alert_instances(String.t(), String.t(), integer, keyword) ::
          {:ok, [GitHub.CodeScanning.AlertInstance.t()]} | {:error, GitHub.Error.t()}
  def list_alert_instances(owner, repo, alert_number, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page, :ref])

    client.request(%{
      args: [owner: owner, repo: repo, alert_number: alert_number],
      call: {GitHub.CodeScanning, :list_alert_instances},
      url: "/repos/#{owner}/#{repo}/code-scanning/alerts/#{alert_number}/instances",
      method: :get,
      query: query,
      response: [
        {200, [{GitHub.CodeScanning.AlertInstance, :t}]},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {503, {GitHub.ServiceUnavailable, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  List code scanning alerts for an organization

  Lists code scanning alerts for the default branch for all eligible repositories in an organization. Eligible repositories are repositories that are owned by organizations that you own or for which you are a security manager. For more information, see "[Managing security managers in your organization](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/managing-security-managers-in-your-organization)."

  The authenticated user must be an owner or security manager for the organization to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `security_events` or `repo`s cope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories.

  ## Options

    * `tool_name`: The name of a code scanning tool. Only results by this tool will be listed. You can specify the tool by using either `tool_name` or `tool_guid`, but not both.
    * `tool_guid`: The GUID of a code scanning tool. Only results by this tool will be listed. Note that some code scanning tools may not include a GUID in their analysis data. You can specify the tool by using either `tool_guid` or `tool_name`, but not both.
    * `before`: A cursor, as given in the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers). If specified, the query only searches for results before this cursor. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `after`: A cursor, as given in the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers). If specified, the query only searches for results after this cursor. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `direction`: The direction to sort the results by.
    * `state`: If specified, only code scanning alerts with this state will be returned.
    * `sort`: The property by which to sort the results.
    * `severity`: If specified, only code scanning alerts with this severity will be returned.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-scanning/code-scanning#list-code-scanning-alerts-for-an-organization)

  """
  @spec list_alerts_for_org(String.t(), keyword) ::
          {:ok, [GitHub.CodeScanning.OrganizationAlertItems.t()]} | {:error, GitHub.Error.t()}
  def list_alerts_for_org(org, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :after,
        :before,
        :direction,
        :page,
        :per_page,
        :severity,
        :sort,
        :state,
        :tool_guid,
        :tool_name
      ])

    client.request(%{
      args: [org: org],
      call: {GitHub.CodeScanning, :list_alerts_for_org},
      url: "/orgs/#{org}/code-scanning/alerts",
      method: :get,
      query: query,
      response: [
        {200, [{GitHub.CodeScanning.OrganizationAlertItems, :t}]},
        {404, {GitHub.BasicError, :t}},
        {503, {GitHub.ServiceUnavailable, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  List code scanning alerts for a repository

  Lists code scanning alerts.

  The response includes a `most_recent_instance` object.
  This provides details of the most recent instance of this alert
  for the default branch (or for the specified Git reference if you used `ref` in the request).

  OAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories.

  ## Options

    * `tool_name`: The name of a code scanning tool. Only results by this tool will be listed. You can specify the tool by using either `tool_name` or `tool_guid`, but not both.
    * `tool_guid`: The GUID of a code scanning tool. Only results by this tool will be listed. Note that some code scanning tools may not include a GUID in their analysis data. You can specify the tool by using either `tool_guid` or `tool_name`, but not both.
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `ref`: The Git reference for the results you want to list. The `ref` for a branch can be formatted either as `refs/heads/<branch name>` or simply `<branch name>`. To reference a pull request use `refs/pull/<number>/merge`.
    * `direction`: The direction to sort the results by.
    * `sort`: The property by which to sort the results.
    * `state`: If specified, only code scanning alerts with this state will be returned.
    * `severity`: If specified, only code scanning alerts with this severity will be returned.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-scanning/code-scanning#list-code-scanning-alerts-for-a-repository)

  """
  @spec list_alerts_for_repo(String.t(), String.t(), keyword) ::
          {:ok, [GitHub.CodeScanning.AlertItems.t()]} | {:error, GitHub.Error.t()}
  def list_alerts_for_repo(owner, repo, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :direction,
        :page,
        :per_page,
        :ref,
        :severity,
        :sort,
        :state,
        :tool_guid,
        :tool_name
      ])

    client.request(%{
      args: [owner: owner, repo: repo],
      call: {GitHub.CodeScanning, :list_alerts_for_repo},
      url: "/repos/#{owner}/#{repo}/code-scanning/alerts",
      method: :get,
      query: query,
      response: [
        {200, [{GitHub.CodeScanning.AlertItems, :t}]},
        {304, :null},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {503, {GitHub.ServiceUnavailable, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  List CodeQL databases for a repository

  Lists the CodeQL databases that are available in a repository.

  OAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-scanning/code-scanning#list-codeql-databases-for-a-repository)

  """
  @spec list_codeql_databases(String.t(), String.t(), keyword) ::
          {:ok, [GitHub.CodeScanning.CodeqlDatabase.t()]} | {:error, GitHub.Error.t()}
  def list_codeql_databases(owner, repo, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo],
      call: {GitHub.CodeScanning, :list_codeql_databases},
      url: "/repos/#{owner}/#{repo}/code-scanning/codeql/databases",
      method: :get,
      response: [
        {200, [{GitHub.CodeScanning.CodeqlDatabase, :t}]},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {503, {GitHub.ServiceUnavailable, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  List code scanning analyses for a repository

  Lists the details of all code scanning analyses for a repository,
  starting with the most recent.
  The response is paginated and you can use the `page` and `per_page` parameters
  to list the analyses you're interested in.
  By default 30 analyses are listed per page.

  The `rules_count` field in the response give the number of rules
  that were run in the analysis.
  For very old analyses this data is not available,
  and `0` is returned in this field.

  **Deprecation notice**:
  The `tool_name` field is deprecated and will, in future, not be included in the response for this endpoint. The example response reflects this change. The tool name can now be found inside the `tool` field.

  OAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories.

  ## Options

    * `tool_name`: The name of a code scanning tool. Only results by this tool will be listed. You can specify the tool by using either `tool_name` or `tool_guid`, but not both.
    * `tool_guid`: The GUID of a code scanning tool. Only results by this tool will be listed. Note that some code scanning tools may not include a GUID in their analysis data. You can specify the tool by using either `tool_guid` or `tool_name`, but not both.
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `ref`: The Git reference for the analyses you want to list. The `ref` for a branch can be formatted either as `refs/heads/<branch name>` or simply `<branch name>`. To reference a pull request use `refs/pull/<number>/merge`.
    * `sarif_id`: Filter analyses belonging to the same SARIF upload.
    * `direction`: The direction to sort the results by.
    * `sort`: The property by which to sort the results.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-scanning/code-scanning#list-code-scanning-analyses-for-a-repository)

  """
  @spec list_recent_analyses(String.t(), String.t(), keyword) ::
          {:ok, [GitHub.CodeScanning.Analysis.t()]} | {:error, GitHub.Error.t()}
  def list_recent_analyses(owner, repo, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :direction,
        :page,
        :per_page,
        :ref,
        :sarif_id,
        :sort,
        :tool_guid,
        :tool_name
      ])

    client.request(%{
      args: [owner: owner, repo: repo],
      call: {GitHub.CodeScanning, :list_recent_analyses},
      url: "/repos/#{owner}/#{repo}/code-scanning/analyses",
      method: :get,
      query: query,
      response: [
        {200, [{GitHub.CodeScanning.Analysis, :t}]},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {503, {GitHub.ServiceUnavailable, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a code scanning alert

  Updates the status of a single code scanning alert.
  OAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-scanning/code-scanning#update-a-code-scanning-alert)

  """
  @spec update_alert(String.t(), String.t(), integer, map, keyword) ::
          {:ok, GitHub.CodeScanning.Alert.t()} | {:error, GitHub.Error.t()}
  def update_alert(owner, repo, alert_number, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, alert_number: alert_number, body: body],
      call: {GitHub.CodeScanning, :update_alert},
      url: "/repos/#{owner}/#{repo}/code-scanning/alerts/#{alert_number}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, {GitHub.CodeScanning.Alert, :t}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {503, {GitHub.ServiceUnavailable, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a code scanning default setup configuration

  Updates a code scanning default setup configuration.

  OAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-scanning/code-scanning#update-a-code-scanning-default-setup-configuration)

  """
  @spec update_default_setup(
          String.t(),
          String.t(),
          GitHub.CodeScanning.DefaultSetupUpdate.t(),
          keyword
        ) ::
          {:ok, GitHub.CodeScanning.DefaultSetupUpdateResponse.t() | GitHub.EmptyObject.t()}
          | {:error, GitHub.Error.t()}
  def update_default_setup(owner, repo, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, body: body],
      call: {GitHub.CodeScanning, :update_default_setup},
      url: "/repos/#{owner}/#{repo}/code-scanning/default-setup",
      body: body,
      method: :patch,
      request: [{"application/json", {GitHub.CodeScanning.DefaultSetupUpdate, :t}}],
      response: [
        {200, {GitHub.EmptyObject, :t}},
        {202, {GitHub.CodeScanning.DefaultSetupUpdateResponse, :t}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {409, {GitHub.BasicError, :t}},
        {503, {GitHub.ServiceUnavailable, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Upload an analysis as SARIF data

  Uploads SARIF data containing the results of a code scanning analysis to make the results available in a repository. For troubleshooting information, see "[Troubleshooting SARIF uploads](https://docs.github.com/code-security/code-scanning/troubleshooting-sarif)."

  There are two places where you can upload code scanning results.
   - If you upload to a pull request, for example `--ref refs/pull/42/merge` or `--ref refs/pull/42/head`, then the results appear as alerts in a pull request check. For more information, see "[Triaging code scanning alerts in pull requests](/code-security/secure-coding/triaging-code-scanning-alerts-in-pull-requests)."
   - If you upload to a branch, for example `--ref refs/heads/my-branch`, then the results appear in the **Security** tab for your repository. For more information, see "[Managing code scanning alerts for your repository](/code-security/secure-coding/managing-code-scanning-alerts-for-your-repository#viewing-the-alerts-for-a-repository)."

  You must compress the SARIF-formatted analysis data that you want to upload, using `gzip`, and then encode it as a Base64 format string. For example:

  ```
  gzip -c analysis-data.sarif | base64 -w0
  ```

  SARIF upload supports a maximum number of entries per the following data objects, and an analysis will be rejected if any of these objects is above its maximum value. For some objects, there are additional values over which the entries will be ignored while keeping the most important entries whenever applicable.
  To get the most out of your analysis when it includes data above the supported limits, try to optimize the analysis configuration. For example, for the CodeQL tool, identify and remove the most noisy queries. For more information, see "[SARIF results exceed one or more limits](https://docs.github.com/code-security/code-scanning/troubleshooting-sarif/results-exceed-limit)."


  | **SARIF data**                   | **Maximum values** | **Additional limits**                                                            |
  |----------------------------------|:------------------:|----------------------------------------------------------------------------------|
  | Runs per file                    |         20         |                                                                                  |
  | Results per run                  |       25,000       | Only the top 5,000 results will be included, prioritized by severity.            |
  | Rules per run                    |       25,000       |                                                                                  |
  | Tool extensions per run          |        100         |                                                                                  |
  | Thread Flow Locations per result |       10,000       | Only the top 1,000 Thread Flow Locations will be included, using prioritization. |
  | Location per result	             |       1,000        | Only 100 locations will be included.                                             |
  | Tags per rule	                   |         20         | Only 10 tags will be included.                                                   |


  The `202 Accepted` response includes an `id` value.
  You can use this ID to check the status of the upload by using it in the `/sarifs/{sarif_id}` endpoint.
  For more information, see "[Get information about a SARIF upload](/rest/code-scanning/code-scanning#get-information-about-a-sarif-upload)."

  OAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories.

  This endpoint is limited to 1,000 requests per hour for each user or app installation calling it.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-scanning/code-scanning#upload-an-analysis-as-sarif-data)

  """
  @spec upload_sarif(String.t(), String.t(), map, keyword) ::
          {:ok, GitHub.CodeScanning.SarifsReceipt.t()} | {:error, GitHub.Error.t()}
  def upload_sarif(owner, repo, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, body: body],
      call: {GitHub.CodeScanning, :upload_sarif},
      url: "/repos/#{owner}/#{repo}/code-scanning/sarifs",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {202, {GitHub.CodeScanning.SarifsReceipt, :t}},
        {400, :null},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {413, :null},
        {503, {GitHub.ServiceUnavailable, :json_resp}}
      ],
      opts: opts
    })
  end
end
