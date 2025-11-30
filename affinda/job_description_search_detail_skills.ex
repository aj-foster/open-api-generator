defmodule Affinda.JobDescriptionSearchDetailSkills do
  @moduledoc """
  Provides struct and type for a JobDescriptionSearchDetailSkills
  """

  @type t :: %__MODULE__{
          missing: [Affinda.ResumeSearchParametersSkill.t()] | nil,
          value: [Affinda.JobDescriptionSearchDetailSkillsValue.t()] | nil
        }

  defstruct [:missing, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      missing: [{Affinda.ResumeSearchParametersSkill, :t}],
      value: [{Affinda.JobDescriptionSearchDetailSkillsValue, :t}]
    ]
  end
end
