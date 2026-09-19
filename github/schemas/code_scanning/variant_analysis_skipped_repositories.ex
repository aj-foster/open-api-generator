defmodule GitHub.CodeScanning.VariantAnalysisSkippedRepositories do
  @moduledoc """
  Provides struct and type for a CodeScanning.VariantAnalysisSkippedRepositories
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          access_mismatch_repos: GitHub.CodeScanning.VariantAnalysisSkippedRepoGroup.t(),
          no_codeql_db_repos: GitHub.CodeScanning.VariantAnalysisSkippedRepoGroup.t(),
          not_found_repos:
            GitHub.CodeScanning.VariantAnalysisSkippedRepositoriesNotFoundRepos.t(),
          over_limit_repos: GitHub.CodeScanning.VariantAnalysisSkippedRepoGroup.t()
        }

  defstruct [
    :__info__,
    :access_mismatch_repos,
    :no_codeql_db_repos,
    :not_found_repos,
    :over_limit_repos
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      access_mismatch_repos: {GitHub.CodeScanning.VariantAnalysisSkippedRepoGroup, :t},
      no_codeql_db_repos: {GitHub.CodeScanning.VariantAnalysisSkippedRepoGroup, :t},
      not_found_repos: {GitHub.CodeScanning.VariantAnalysisSkippedRepositoriesNotFoundRepos, :t},
      over_limit_repos: {GitHub.CodeScanning.VariantAnalysisSkippedRepoGroup, :t}
    ]
  end
end
