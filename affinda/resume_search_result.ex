defmodule Affinda.ResumeSearchResult do
  @moduledoc """
  Provides struct and type for a ResumeSearchResult
  """

  @type t :: %__MODULE__{
          customData: map,
          education: Affinda.EducationSearchScoreComponent.t(),
          experience: Affinda.ExperienceSearchScoreComponent.t(),
          identifier: String.t(),
          jobTitle: Affinda.JobTitleSearchScoreComponent.t(),
          languages: Affinda.LanguagesSearchScoreComponent.t(),
          location: Affinda.LocationSearchScoreComponent.t(),
          managementLevel: Affinda.ManagementLevelSearchScoreComponent.t(),
          name: String.t() | nil,
          occupationGroup: Affinda.OccupationGroupSearchScoreComponent.t(),
          pdf: String.t() | nil,
          score: number,
          searchExpression: Affinda.SearchExpressionSearchScoreComponent.t(),
          skills: Affinda.SkillsSearchScoreComponent.t()
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
    :name,
    :occupationGroup,
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
      customData: :map,
      education: {Affinda.EducationSearchScoreComponent, :t},
      experience: {Affinda.ExperienceSearchScoreComponent, :t},
      identifier: :string,
      jobTitle: {Affinda.JobTitleSearchScoreComponent, :t},
      languages: {Affinda.LanguagesSearchScoreComponent, :t},
      location: {Affinda.LocationSearchScoreComponent, :t},
      managementLevel: {Affinda.ManagementLevelSearchScoreComponent, :t},
      name: :string,
      occupationGroup: {Affinda.OccupationGroupSearchScoreComponent, :t},
      pdf: :string,
      score: :number,
      searchExpression: {Affinda.SearchExpressionSearchScoreComponent, :t},
      skills: {Affinda.SkillsSearchScoreComponent, :t}
    ]
  end
end
