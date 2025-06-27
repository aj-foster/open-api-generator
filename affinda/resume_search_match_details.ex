defmodule ResumeSearchMatchDetails do
  @moduledoc """
  Provides struct and type for a ResumeSearchMatchDetails
  """

  @type t :: %__MODULE__{
          education: EducationSearchScoreComponent.t() | nil,
          experience: ExperienceSearchScoreComponent.t() | nil,
          jobTitle: JobTitleSearchScoreComponent.t() | nil,
          languages: LanguagesSearchScoreComponent.t() | nil,
          location: LocationSearchScoreComponent.t() | nil,
          managementLevel: ManagementLevelSearchScoreComponent.t() | nil,
          occupationGroup: OccupationGroupSearchScoreComponent.t() | nil,
          searchExpression: SearchExpressionSearchScoreComponent.t() | nil,
          skills: SkillsSearchScoreComponent.t() | nil
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
      education: {EducationSearchScoreComponent, :t},
      experience: {ExperienceSearchScoreComponent, :t},
      jobTitle: {JobTitleSearchScoreComponent, :t},
      languages: {LanguagesSearchScoreComponent, :t},
      location: {LocationSearchScoreComponent, :t},
      managementLevel: {ManagementLevelSearchScoreComponent, :t},
      occupationGroup: {OccupationGroupSearchScoreComponent, :t},
      searchExpression: {SearchExpressionSearchScoreComponent, :t},
      skills: {SkillsSearchScoreComponent, :t}
    ]
  end
end
