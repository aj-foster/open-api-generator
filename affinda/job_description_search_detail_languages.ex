defmodule Affinda.JobDescriptionSearchDetailLanguages do
  @moduledoc """
  Provides struct and type for a JobDescriptionSearchDetailLanguages
  """

  @type t :: %__MODULE__{
          missing: [Affinda.ResumeSearchParametersSkill.t()] | nil,
          value: [Affinda.JobDescriptionSearchDetailLanguagesValue.t()] | nil
        }

  defstruct [:missing, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      missing: [{Affinda.ResumeSearchParametersSkill, :t}],
      value: [{Affinda.JobDescriptionSearchDetailLanguagesValue, :t}]
    ]
  end
end
