defmodule Affinda.ResumeSearchDetail do
  @moduledoc """
  Provides struct and type for a ResumeSearchDetail
  """

  @type t :: %__MODULE__{
          education: Affinda.ResumeSearchDetailEducation.t() | nil,
          experience: Affinda.ResumeSearchDetailExperience.t() | nil,
          jobTitle: Affinda.ResumeSearchDetailJobTitle.t() | nil,
          languages: Affinda.ResumeSearchDetailLanguages.t() | nil,
          location: Affinda.ResumeSearchDetailLocation.t() | nil,
          managementLevel: Affinda.ResumeSearchDetailManagementLevel.t() | nil,
          occupationGroup: Affinda.ResumeSearchDetailOccupationGroup.t() | nil,
          searchExpression: Affinda.ResumeSearchDetailSearchExpression.t() | nil,
          skills: Affinda.ResumeSearchDetailSkills.t() | nil
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
      education: {Affinda.ResumeSearchDetailEducation, :t},
      experience: {Affinda.ResumeSearchDetailExperience, :t},
      jobTitle: {Affinda.ResumeSearchDetailJobTitle, :t},
      languages: {Affinda.ResumeSearchDetailLanguages, :t},
      location: {Affinda.ResumeSearchDetailLocation, :t},
      managementLevel: {Affinda.ResumeSearchDetailManagementLevel, :t},
      occupationGroup: {Affinda.ResumeSearchDetailOccupationGroup, :t},
      searchExpression: {Affinda.ResumeSearchDetailSearchExpression, :t},
      skills: {Affinda.ResumeSearchDetailSkills, :t}
    ]
  end
end
