defmodule GitHub.RateLimit do
  @moduledoc """
  Provides API endpoint related to rate limit
  """
  use GitHub.Encoder

  @default_client GitHub.Client

  @doc """
  Get rate limit status for the authenticated user

  **Note:** Accessing this endpoint does not count against your REST API rate limit.

  Some categories of endpoints have custom rate limits that are separate from the rate limit governing the other REST API endpoints. For this reason, the API response categorizes your rate limit. Under `resources`, you'll see objects relating to different categories:
  * The `core` object provides your rate limit status for all non-search-related resources in the REST API.
  * The `search` object provides your rate limit status for the REST API for searching (excluding code searches). For more information, see "[Search](https://docs.github.com/rest/search/search)."
  * The `code_search` object provides your rate limit status for the REST API for searching code. For more information, see "[Search code](https://docs.github.com/rest/search/search#search-code)."
  * The `graphql` object provides your rate limit status for the GraphQL API. For more information, see "[Resource limitations](https://docs.github.com/graphql/overview/resource-limitations#rate-limit)."
  * The `integration_manifest` object provides your rate limit status for the `POST /app-manifests/{code}/conversions` operation. For more information, see "[Creating a GitHub App from a manifest](https://docs.github.com/apps/creating-github-apps/setting-up-a-github-app/creating-a-github-app-from-a-manifest#3-you-exchange-the-temporary-code-to-retrieve-the-app-configuration)."
  * The `dependency_snapshots` object provides your rate limit status for submitting snapshots to the dependency graph. For more information, see "[Dependency graph](https://docs.github.com/rest/dependency-graph)."
  * The `code_scanning_upload` object provides your rate limit status for uploading SARIF results to code scanning. For more information, see "[Uploading a SARIF file to GitHub](https://docs.github.com/code-security/code-scanning/integrating-with-code-scanning/uploading-a-sarif-file-to-github)."
  * The `actions_runner_registration` object provides your rate limit status for registering self-hosted runners in GitHub Actions. For more information, see "[Self-hosted runners](https://docs.github.com/rest/actions/self-hosted-runners)."
  * The `source_import` object is no longer in use for any API endpoints, and it will be removed in the next API version. For more information about API versions, see "[API Versions](https://docs.github.com/rest/overview/api-versions)."

  **Note:** The `rate` object is deprecated. If you're writing new API client code or updating existing code, you should use the `core` object instead of the `rate` object. The `core` object contains the same information that is present in the `rate` object.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/rate-limit/rate-limit#get-rate-limit-status-for-the-authenticated-user)

  """
  @spec get(keyword) :: {:ok, GitHub.RateLimit.Overview.t()} | {:error, GitHub.Error.t()}
  def get(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {GitHub.RateLimit, :get},
      url: "/rate_limit",
      method: :get,
      response: [
        {200, {GitHub.RateLimit.Overview, :t}},
        {304, :null},
        {404, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @type t :: %__MODULE__{
          __info__: map,
          limit: integer,
          remaining: integer,
          reset: integer,
          used: integer
        }

  defstruct [:__info__, :limit, :remaining, :reset, :used]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [limit: :integer, remaining: :integer, reset: :integer, used: :integer]
  end
end
