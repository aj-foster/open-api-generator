defmodule OpenAI.FineTuningJobHyperparameters do
  @moduledoc """
  Provides struct and type for a FineTuningJobHyperparameters
  """

  @type t :: %__MODULE__{
          batch_size: integer | String.t() | nil,
          learning_rate_multiplier: number | String.t() | nil,
          n_epochs: integer | String.t() | nil
        }

  defstruct [:batch_size, :learning_rate_multiplier, :n_epochs]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      batch_size: {:union, [:integer, const: "auto"]},
      learning_rate_multiplier: {:union, [:number, const: "auto"]},
      n_epochs: {:union, [:integer, const: "auto"]}
    ]
  end
end
