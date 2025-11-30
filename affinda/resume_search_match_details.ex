defmodule Affinda.ResumeSearchMatchDetails do
  @moduledoc """
  Provides struct and type for a ResumeSearchMatchDetails
  """

  @type t :: %__MODULE__{
          education: Affinda.EducationSearchScoreComponent.t() | nil,
          experience: Affinda.ExperienceSearchScoreComponent.t() | nil,
          jobTitle: Affinda.JobTitleSearchScoreComponent.t() | nil,
          languages: Affinda.LanguagesSearchScoreComponent.t() | nil,
          location: Affinda.LocationSearchScoreComponent.t() | nil,
          managementLevel: Affinda.ManagementLevelSearchScoreComponent.t() | nil,
          occupationGroup: Affinda.OccupationGroupSearchScoreComponent.t() | nil,
          searchExpression: Affinda.SearchExpressionSearchScoreComponent.t() | nil,
          skills: Affinda.SkillsSearchScoreComponent.t() | nil
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
      education: {Affinda.EducationSearchScoreComponent, :t},
      experience: {Affinda.ExperienceSearchScoreComponent, :t},
      jobTitle: {Affinda.JobTitleSearchScoreComponent, :t},
      languages: {Affinda.LanguagesSearchScoreComponent, :t},
      location: {Affinda.LocationSearchScoreComponent, :t},
      managementLevel: {Affinda.ManagementLevelSearchScoreComponent, :t},
      occupationGroup: {Affinda.OccupationGroupSearchScoreComponent, :t},
      searchExpression: {Affinda.SearchExpressionSearchScoreComponent, :t},
      skills: {Affinda.SkillsSearchScoreComponent, :t}
    ]
  end
end
