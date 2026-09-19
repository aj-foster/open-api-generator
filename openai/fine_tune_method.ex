defmodule OpenAI.FineTuneMethod do
  @moduledoc """
  Provides struct and type for a FineTuneMethod
  """

  @type t :: %__MODULE__{
          dpo: OpenAI.FineTuneDPOMethod.t() | nil,
          supervised: OpenAI.FineTuneSupervisedMethod.t() | nil,
          type: String.t() | nil
        }

  defstruct [:dpo, :supervised, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      dpo: {OpenAI.FineTuneDPOMethod, :t},
      supervised: {OpenAI.FineTuneSupervisedMethod, :t},
      type: {:enum, ["supervised", "dpo"]}
    ]
  end
end
