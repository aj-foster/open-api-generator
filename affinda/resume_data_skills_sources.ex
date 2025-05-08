defmodule ResumeDataSkillsSources do
  @moduledoc """
  Provides struct and type for a ResumeDataSkillsSources
  """

  @type t :: %__MODULE__{
          position: integer | nil,
          section: String.t() | nil,
          workExperienceId: integer | nil
        }

  defstruct [:position, :section, :workExperienceId]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [position: :integer, section: {:string, :generic}, workExperienceId: :integer]
  end
end
