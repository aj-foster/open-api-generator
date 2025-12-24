defmodule Affinda.ResumeSearchDetailLanguages do
  @moduledoc """
  Provides struct and type for a ResumeSearchDetailLanguages
  """

  @type t :: %__MODULE__{
          missing: [Affinda.ResumeSearchParametersSkill.t()] | nil,
          value: [Affinda.ResumeSearchDetailLanguagesValue.t()] | nil
        }

  defstruct [:missing, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      missing: [{Affinda.ResumeSearchParametersSkill, :t}],
      value: [{Affinda.ResumeSearchDetailLanguagesValue, :t}]
    ]
  end
end
