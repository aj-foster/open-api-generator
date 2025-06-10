defmodule GitHub.CodeScanning.VariantAnalysisRepoTask do
  @moduledoc """
  Provides struct and type for a CodeScanning.VariantAnalysisRepoTask
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          analysis_status: String.t(),
          artifact_size_in_bytes: integer | nil,
          artifact_url: String.t() | nil,
          database_commit_sha: String.t() | nil,
          failure_message: String.t() | nil,
          repository: GitHub.Repository.simple(),
          result_count: integer | nil,
          source_location_prefix: String.t() | nil
        }

  defstruct [
    :__info__,
    :analysis_status,
    :artifact_size_in_bytes,
    :artifact_url,
    :database_commit_sha,
    :failure_message,
    :repository,
    :result_count,
    :source_location_prefix
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      analysis_status:
        {:enum, ["pending", "in_progress", "succeeded", "failed", "canceled", "timed_out"]},
      artifact_size_in_bytes: :integer,
      artifact_url: {:string, :generic},
      database_commit_sha: {:string, :generic},
      failure_message: {:string, :generic},
      repository: {GitHub.Repository, :simple},
      result_count: :integer,
      source_location_prefix: {:string, :generic}
    ]
  end
end
