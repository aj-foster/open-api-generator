defmodule OpenAI.FineTuningJob do
  @moduledoc """
  Provides struct and type for a FineTuningJob
  """

  @type t :: %__MODULE__{
          created_at: integer,
          error: OpenAI.FineTuningJobError.t() | nil,
          estimated_finish: integer | nil,
          fine_tuned_model: String.t() | nil,
          finished_at: integer | nil,
          hyperparameters: OpenAI.FineTuningJobHyperparameters.t(),
          id: String.t(),
          integrations: [OpenAI.FineTuningIntegration.t()] | nil,
          metadata: map | nil,
          method: OpenAI.FineTuneMethod.t() | nil,
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
      error: {OpenAI.FineTuningJobError, :t},
      estimated_finish: :integer,
      fine_tuned_model: :string,
      finished_at: :integer,
      hyperparameters: {OpenAI.FineTuningJobHyperparameters, :t},
      id: :string,
      integrations: [{OpenAI.FineTuningIntegration, :t}],
      metadata: :map,
      method: {OpenAI.FineTuneMethod, :t},
      model: :string,
      object: {:const, "fine_tuning.job"},
      organization_id: :string,
      result_files: [:string],
      seed: :integer,
      status:
        {:enum, ["validating_files", "queued", "running", "succeeded", "failed", "cancelled"]},
      trained_tokens: :integer,
      training_file: :string,
      validation_file: :string
    ]
  end
end
