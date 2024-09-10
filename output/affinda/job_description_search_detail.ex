defmodule JobDescriptionSearchDetail do
  @moduledoc """
  Provides struct and type for a JobDescriptionSearchDetail
  """

  @type t :: %__MODULE__{
          education: JobDescriptionSearchDetailEducation.t() | nil,
          experience: JobDescriptionSearchDetailExperience.t() | nil,
          jobTitle: JobDescriptionSearchDetailJobTitle.t() | nil,
          languages: JobDescriptionSearchDetailLanguages.t() | nil,
          location: JobDescriptionSearchDetailLocation.t() | nil,
          managementLevel: JobDescriptionSearchDetailManagementLevel.t() | nil,
          occupationGroup: JobDescriptionSearchDetailOccupationGroup.t() | nil,
          searchExpression: JobDescriptionSearchDetailSearchExpression.t() | nil,
          skills: JobDescriptionSearchDetailSkills.t() | nil
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
      education: {JobDescriptionSearchDetailEducation, :t},
      experience: {JobDescriptionSearchDetailExperience, :t},
      jobTitle: {JobDescriptionSearchDetailJobTitle, :t},
      languages: {JobDescriptionSearchDetailLanguages, :t},
      location: {JobDescriptionSearchDetailLocation, :t},
      managementLevel: {JobDescriptionSearchDetailManagementLevel, :t},
      occupationGroup: {JobDescriptionSearchDetailOccupationGroup, :t},
      searchExpression: {JobDescriptionSearchDetailSearchExpression, :t},
      skills: {JobDescriptionSearchDetailSkills, :t}
    ]
  end
end
