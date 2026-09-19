defmodule OpenAI.FineTuneSupervisedMethod do
  @moduledoc """
  Provides struct and type for a FineTuneSupervisedMethod
  """

  @type t :: %__MODULE__{
          hyperparameters: OpenAI.FineTuneSupervisedMethodHyperparameters.t() | nil
        }

  defstruct [:hyperparameters]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [hyperparameters: {OpenAI.FineTuneSupervisedMethodHyperparameters, :t}]
  end
end
