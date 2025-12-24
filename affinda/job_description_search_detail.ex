defmodule Affinda.JobDescriptionSearchDetail do
  @moduledoc """
  Provides struct and type for a JobDescriptionSearchDetail
  """

  @type t :: %__MODULE__{
          education: Affinda.JobDescriptionSearchDetailEducation.t() | nil,
          experience: Affinda.JobDescriptionSearchDetailExperience.t() | nil,
          jobTitle: Affinda.JobDescriptionSearchDetailJobTitle.t() | nil,
          languages: Affinda.JobDescriptionSearchDetailLanguages.t() | nil,
          location: Affinda.JobDescriptionSearchDetailLocation.t() | nil,
          managementLevel: Affinda.JobDescriptionSearchDetailManagementLevel.t() | nil,
          occupationGroup: Affinda.JobDescriptionSearchDetailOccupationGroup.t() | nil,
          searchExpression: Affinda.JobDescriptionSearchDetailSearchExpression.t() | nil,
          skills: Affinda.JobDescriptionSearchDetailSkills.t() | nil
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
      education: {Affinda.JobDescriptionSearchDetailEducation, :t},
      experience: {Affinda.JobDescriptionSearchDetailExperience, :t},
      jobTitle: {Affinda.JobDescriptionSearchDetailJobTitle, :t},
      languages: {Affinda.JobDescriptionSearchDetailLanguages, :t},
      location: {Affinda.JobDescriptionSearchDetailLocation, :t},
      managementLevel: {Affinda.JobDescriptionSearchDetailManagementLevel, :t},
      occupationGroup: {Affinda.JobDescriptionSearchDetailOccupationGroup, :t},
      searchExpression: {Affinda.JobDescriptionSearchDetailSearchExpression, :t},
      skills: {Affinda.JobDescriptionSearchDetailSkills, :t}
    ]
  end
end
