defmodule OpenAI.FineTuningJobCheckpoint do
  @moduledoc """
  Provides struct and type for a FineTuningJobCheckpoint
  """

  @type t :: %__MODULE__{
          created_at: integer,
          fine_tuned_model_checkpoint: String.t(),
          fine_tuning_job_id: String.t(),
          id: String.t(),
          metrics: OpenAI.FineTuningJobCheckpointMetrics.t(),
          object: String.t(),
          step_number: integer
        }

  defstruct [
    :created_at,
    :fine_tuned_model_checkpoint,
    :fine_tuning_job_id,
    :id,
    :metrics,
    :object,
    :step_number
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: :integer,
      fine_tuned_model_checkpoint: :string,
      fine_tuning_job_id: :string,
      id: :string,
      metrics: {OpenAI.FineTuningJobCheckpointMetrics, :t},
      object: {:const, "fine_tuning.job.checkpoint"},
      step_number: :integer
    ]
  end
end
