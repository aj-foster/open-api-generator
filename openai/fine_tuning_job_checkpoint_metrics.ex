defmodule OpenAI.FineTuningJobCheckpointMetrics do
  @moduledoc """
  Provides struct and type for a FineTuningJobCheckpointMetrics
  """

  @type t :: %__MODULE__{
          full_valid_loss: number | nil,
          full_valid_mean_token_accuracy: number | nil,
          step: number | nil,
          train_loss: number | nil,
          train_mean_token_accuracy: number | nil,
          valid_loss: number | nil,
          valid_mean_token_accuracy: number | nil
        }

  defstruct [
    :full_valid_loss,
    :full_valid_mean_token_accuracy,
    :step,
    :train_loss,
    :train_mean_token_accuracy,
    :valid_loss,
    :valid_mean_token_accuracy
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      full_valid_loss: :number,
      full_valid_mean_token_accuracy: :number,
      step: :number,
      train_loss: :number,
      train_mean_token_accuracy: :number,
      valid_loss: :number,
      valid_mean_token_accuracy: :number
    ]
  end
end
