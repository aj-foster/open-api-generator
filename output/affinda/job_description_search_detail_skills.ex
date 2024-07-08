defmodule JobDescriptionSearchDetailSkills do
  @moduledoc """
  Provides struct and type for a JobDescriptionSearchDetailSkills
  """

  @type t :: %__MODULE__{
          missing: [ResumeSearchParametersSkill.t()] | nil,
          value: [JobDescriptionSearchDetailSkillsValue.t()] | nil
        }

  defstruct [:missing, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      missing: [{ResumeSearchParametersSkill, :t}],
      value: [{JobDescriptionSearchDetailSkillsValue, :t}]
    ]
  end
end
