defmodule OpenAI.FineTuneDPOMethodHyperparameters do
  @moduledoc """
  Provides struct and type for a FineTuneDPOMethodHyperparameters
  """

  @type t :: %__MODULE__{
          batch_size: integer | String.t() | nil,
          beta: number | String.t() | nil,
          learning_rate_multiplier: number | String.t() | nil,
          n_epochs: integer | String.t() | nil
        }

  defstruct [:batch_size, :beta, :learning_rate_multiplier, :n_epochs]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      batch_size: {:union, [:integer, const: "auto"]},
      beta: {:union, [:number, const: "auto"]},
      learning_rate_multiplier: {:union, [:number, const: "auto"]},
      n_epochs: {:union, [:integer, const: "auto"]}
    ]
  end
end
