defmodule JobDescriptionSearchParameters do
  @moduledoc """
  Provides struct and type for a JobDescriptionSearchParameters
  """

  @type t :: %__MODULE__{
          customData: [SearchParametersCustomData.t()] | nil,
          degreeTypes: [String.t()] | nil,
          degreeTypesRequired: boolean | nil,
          degrees: [String.t()] | nil,
          degreesRequired: boolean | nil,
          educationWeight: number | nil,
          indices: [String.t()],
          jobTitles: [String.t()] | nil,
          jobTitlesRequired: boolean | nil,
          jobTitlesWeight: number | nil,
          languages: [ResumeSearchParametersSkill.t()] | nil,
          languagesWeight: number | nil,
          locations: [ResumeSearchParametersLocation.t()] | nil,
          locationsRequired: boolean | nil,
          locationsWeight: number | nil,
          managementLevel: String.t() | nil,
          managementLevelRequired: boolean | nil,
          managementLevelWeight: number | nil,
          resume: String.t() | nil,
          searchExpression: String.t() | nil,
          searchExpressionRequired: boolean | nil,
          searchExpressionWeight: number | nil,
          skills: [ResumeSearchParametersSkill.t()] | nil,
          skillsWeight: number | nil,
          socCodes: [integer] | nil,
          socCodesRequired: boolean | nil,
          socCodesWeight: number | nil,
          totalYearsExperience: number | nil,
          yearsExperienceRequired: boolean | nil,
          yearsExperienceWeight: number | nil
        }

  defstruct [
    :customData,
    :degreeTypes,
    :degreeTypesRequired,
    :degrees,
    :degreesRequired,
    :educationWeight,
    :indices,
    :jobTitles,
    :jobTitlesRequired,
    :jobTitlesWeight,
    :languages,
    :languagesWeight,
    :locations,
    :locationsRequired,
    :locationsWeight,
    :managementLevel,
    :managementLevelRequired,
    :managementLevelWeight,
    :resume,
    :searchExpression,
    :searchExpressionRequired,
    :searchExpressionWeight,
    :skills,
    :skillsWeight,
    :socCodes,
    :socCodesRequired,
    :socCodesWeight,
    :totalYearsExperience,
    :yearsExperienceRequired,
    :yearsExperienceWeight
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      customData: [{SearchParametersCustomData, :t}],
      degreeTypes: [enum: ["school", "certificate", "bachelors", "masters", "doctoral"]],
      degreeTypesRequired: :boolean,
      degrees: [string: :generic],
      degreesRequired: :boolean,
      educationWeight: :number,
      indices: [string: :generic],
      jobTitles: [string: :generic],
      jobTitlesRequired: :boolean,
      jobTitlesWeight: :number,
      languages: [{ResumeSearchParametersSkill, :t}],
      languagesWeight: :number,
      locations: [{ResumeSearchParametersLocation, :t}],
      locationsRequired: :boolean,
      locationsWeight: :number,
      managementLevel: {:enum, ["None", "Low", "Mid", "Upper"]},
      managementLevelRequired: :boolean,
      managementLevelWeight: :number,
      resume: {:string, :generic},
      searchExpression: {:string, :generic},
      searchExpressionRequired: :boolean,
      searchExpressionWeight: :number,
      skills: [{ResumeSearchParametersSkill, :t}],
      skillsWeight: :number,
      socCodes: [:integer],
      socCodesRequired: :boolean,
      socCodesWeight: :number,
      totalYearsExperience: :number,
      yearsExperienceRequired: :boolean,
      yearsExperienceWeight: :number
    ]
  end
end
