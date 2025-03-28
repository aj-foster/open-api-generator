defmodule JobDescriptionSearchResult do
  @moduledoc """
  Provides struct and type for a JobDescriptionSearchResult
  """

  @type t :: %__MODULE__{
          customData: CustomDataSearchScoreComponent.t(),
          education: EducationSearchScoreComponent.t(),
          experience: ExperienceSearchScoreComponent.t(),
          identifier: String.t(),
          jobTitle: JobTitleSearchScoreComponent.t(),
          languages: LanguagesSearchScoreComponent.t(),
          location: LocationSearchScoreComponent.t(),
          managementLevel: ManagementLevelSearchScoreComponent.t(),
          occupationGroup: OccupationGroupSearchScoreComponent.t() | nil,
          organizationName: String.t() | nil,
          pdf: String.t() | nil,
          score: number,
          searchExpression: SearchExpressionSearchScoreComponent.t(),
          skills: SkillsSearchScoreComponent.t()
        }

  defstruct [
    :customData,
    :education,
    :experience,
    :identifier,
    :jobTitle,
    :languages,
    :location,
    :managementLevel,
    :occupationGroup,
    :organizationName,
    :pdf,
    :score,
    :searchExpression,
    :skills
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      customData: {CustomDataSearchScoreComponent, :t},
      education: {EducationSearchScoreComponent, :t},
      experience: {ExperienceSearchScoreComponent, :t},
      identifier: {:string, :generic},
      jobTitle: {JobTitleSearchScoreComponent, :t},
      languages: {LanguagesSearchScoreComponent, :t},
      location: {LocationSearchScoreComponent, :t},
      managementLevel: {ManagementLevelSearchScoreComponent, :t},
      occupationGroup: {OccupationGroupSearchScoreComponent, :t},
      organizationName: {:string, :generic},
      pdf: {:string, :generic},
      score: :number,
      searchExpression: {SearchExpressionSearchScoreComponent, :t},
      skills: {SkillsSearchScoreComponent, :t}
    ]
  end
end
