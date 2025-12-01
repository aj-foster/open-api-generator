defmodule OpenAI.FineTuneDPOMethod do
  @moduledoc """
  Provides struct and type for a FineTuneDPOMethod
  """

  @type t :: %__MODULE__{hyperparameters: OpenAI.FineTuneDPOMethodHyperparameters.t() | nil}

  defstruct [:hyperparameters]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [hyperparameters: {OpenAI.FineTuneDPOMethodHyperparameters, :t}]
  end
end
