defmodule FineTuneMethod do
  @moduledoc """
  Provides struct and type for a FineTuneMethod
  """

  @type t :: %__MODULE__{
          dpo: FineTuneDPOMethod.t() | nil,
          supervised: FineTuneSupervisedMethod.t() | nil,
          type: String.t() | nil
        }

  defstruct [:dpo, :supervised, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      dpo: {FineTuneDPOMethod, :t},
      supervised: {FineTuneSupervisedMethod, :t},
      type: {:enum, ["supervised", "dpo"]}
    ]
  end
end
