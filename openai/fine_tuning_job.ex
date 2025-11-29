defmodule FineTuningJob do
  @moduledoc """
  Provides struct and type for a FineTuningJob
  """

  @type t :: %__MODULE__{
          created_at: integer,
          error: FineTuningJobError.t() | nil,
          estimated_finish: integer | nil,
          fine_tuned_model: String.t() | nil,
          finished_at: integer | nil,
          hyperparameters: FineTuningJobHyperparameters.t(),
          id: String.t(),
          integrations: [FineTuningIntegration.t()] | nil,
          metadata: Metadata.t() | nil,
          method: FineTuneMethod.t() | nil,
          model: String.t(),
          object: String.t(),
          organization_id: String.t(),
          result_files: [String.t()],
          seed: integer,
          status: String.t(),
          trained_tokens: integer | nil,
          training_file: String.t(),
          validation_file: String.t() | nil
        }

  defstruct [
    :created_at,
    :error,
    :estimated_finish,
    :fine_tuned_model,
    :finished_at,
    :hyperparameters,
    :id,
    :integrations,
    :metadata,
    :method,
    :model,
    :object,
    :organization_id,
    :result_files,
    :seed,
    :status,
    :trained_tokens,
    :training_file,
    :validation_file
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: :integer,
      error: {FineTuningJobError, :t},
      estimated_finish: :integer,
      fine_tuned_model: {:string, :generic},
      finished_at: :integer,
      hyperparameters: {FineTuningJobHyperparameters, :t},
      id: {:string, :generic},
      integrations: [{FineTuningIntegration, :t}],
      metadata: {Metadata, :t},
      method: {FineTuneMethod, :t},
      model: {:string, :generic},
      object: {:const, "fine_tuning.job"},
      organization_id: {:string, :generic},
      result_files: [string: :generic],
      seed: :integer,
      status:
        {:enum, ["validating_files", "queued", "running", "succeeded", "failed", "cancelled"]},
      trained_tokens: :integer,
      training_file: {:string, :generic},
      validation_file: {:string, :generic}
    ]
  end
end
