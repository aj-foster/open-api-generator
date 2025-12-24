defmodule Affinda.ResumeSearchDetailSkills do
  @moduledoc """
  Provides struct and type for a ResumeSearchDetailSkills
  """

  @type t :: %__MODULE__{
          missing: [Affinda.ResumeSearchParametersSkill.t()] | nil,
          value: [Affinda.ResumeSearchDetailSkillsValue.t()] | nil
        }

  defstruct [:missing, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      missing: [{Affinda.ResumeSearchParametersSkill, :t}],
      value: [{Affinda.ResumeSearchDetailSkillsValue, :t}]
    ]
  end
end
