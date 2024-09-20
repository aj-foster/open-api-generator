defmodule ResumeSearchDetail do
  @moduledoc """
  Provides struct and type for a ResumeSearchDetail
  """

  @type t :: %__MODULE__{
          education: ResumeSearchDetailEducation.t() | nil,
          experience: ResumeSearchDetailExperience.t() | nil,
          jobTitle: ResumeSearchDetailJobTitle.t() | nil,
          languages: ResumeSearchDetailLanguages.t() | nil,
          location: ResumeSearchDetailLocation.t() | nil,
          managementLevel: ResumeSearchDetailManagementLevel.t() | nil,
          occupationGroup: ResumeSearchDetailOccupationGroup.t() | nil,
          searchExpression: ResumeSearchDetailSearchExpression.t() | nil,
          skills: ResumeSearchDetailSkills.t() | nil
        }

  defstruct [
    :education,
    :experience,
    :jobTitle,
    :languages,
    :location,
    :managementLevel,
    :occupationGroup,
    :searchExpression,
    :skills
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      education: {ResumeSearchDetailEducation, :t},
      experience: {ResumeSearchDetailExperience, :t},
      jobTitle: {ResumeSearchDetailJobTitle, :t},
      languages: {ResumeSearchDetailLanguages, :t},
      location: {ResumeSearchDetailLocation, :t},
      managementLevel: {ResumeSearchDetailManagementLevel, :t},
      occupationGroup: {ResumeSearchDetailOccupationGroup, :t},
      searchExpression: {ResumeSearchDetailSearchExpression, :t},
      skills: {ResumeSearchDetailSkills, :t}
    ]
  end
end
