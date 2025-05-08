defmodule GitHub.CodeScanning.VariantAnalysis do
  @moduledoc """
  Provides struct and type for a CodeScanning.VariantAnalysis
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          actions_workflow_run_id: integer | nil,
          actor: GitHub.User.simple(),
          completed_at: DateTime.t() | nil,
          controller_repo: GitHub.Repository.simple(),
          created_at: DateTime.t() | nil,
          failure_reason: String.t() | nil,
          id: integer,
          query_language: String.t(),
          query_pack_url: String.t(),
          scanned_repositories:
            [GitHub.CodeScanning.VariantAnalysisScannedRepositories.t()] | nil,
          skipped_repositories: GitHub.CodeScanning.VariantAnalysisSkippedRepositories.t() | nil,
          status: String.t(),
          updated_at: DateTime.t() | nil
        }

  defstruct [
    :__info__,
    :actions_workflow_run_id,
    :actor,
    :completed_at,
    :controller_repo,
    :created_at,
    :failure_reason,
    :id,
    :query_language,
    :query_pack_url,
    :scanned_repositories,
    :skipped_repositories,
    :status,
    :updated_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actions_workflow_run_id: :integer,
      actor: {GitHub.User, :simple},
      completed_at: {:union, [{:string, :date_time}, :null]},
      controller_repo: {GitHub.Repository, :simple},
      created_at: {:string, :date_time},
      failure_reason:
        {:enum, ["no_repos_queried", "actions_workflow_run_failed", "internal_error"]},
      id: :integer,
      query_language:
        {:enum, ["cpp", "csharp", "go", "java", "javascript", "python", "ruby", "swift"]},
      query_pack_url: {:string, :generic},
      scanned_repositories: [{GitHub.CodeScanning.VariantAnalysisScannedRepositories, :t}],
      skipped_repositories: {GitHub.CodeScanning.VariantAnalysisSkippedRepositories, :t},
      status: {:enum, ["in_progress", "succeeded", "failed", "cancelled"]},
      updated_at: {:string, :date_time}
    ]
  end
end
