defmodule GitHub.CodeScanning.Analysis do
  @moduledoc """
  Provides struct and type for a CodeScanning.Analysis
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          analysis_key: String.t(),
          category: String.t() | nil,
          commit_sha: String.t(),
          created_at: DateTime.t(),
          deletable: boolean,
          environment: String.t(),
          error: String.t(),
          id: integer,
          ref: String.t(),
          results_count: integer,
          rules_count: integer,
          sarif_id: String.t(),
          tool: GitHub.CodeScanning.AnalysisTool.t(),
          url: String.t(),
          warning: String.t()
        }

  defstruct [
    :__info__,
    :analysis_key,
    :category,
    :commit_sha,
    :created_at,
    :deletable,
    :environment,
    :error,
    :id,
    :ref,
    :results_count,
    :rules_count,
    :sarif_id,
    :tool,
    :url,
    :warning
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      analysis_key: :string,
      category: :string,
      commit_sha: :string,
      created_at: {:string, "date-time"},
      deletable: :boolean,
      environment: :string,
      error: :string,
      id: :integer,
      ref: :string,
      results_count: :integer,
      rules_count: :integer,
      sarif_id: :string,
      tool: {GitHub.CodeScanning.AnalysisTool, :t},
      url: {:string, "uri"},
      warning: :string
    ]
  end
end
