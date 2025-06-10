defmodule JobDescriptionDataUpdate do
  @moduledoc """
  Provides struct and type for a JobDescriptionDataUpdate
  """

  @type t :: %__MODULE__{
          certifications: [TextAnnotationUpdate.t()] | nil,
          contactEmail: TextAnnotationUpdate.t() | nil,
          contactName: TextAnnotationUpdate.t() | nil,
          contactPhone: TextAnnotationUpdate.t() | nil,
          educationAccreditation: TextAnnotationUpdate.t() | nil,
          educationLevel: TextAnnotationUpdate.t() | nil,
          endDate: DateAnnotationUpdate.t() | nil,
          expectedRemuneration: ExpectedRemunerationAnnotationUpdate.t() | nil,
          jobTitle: JobTitleAnnotationUpdate.t() | nil,
          jobType: TextAnnotationUpdate.t() | nil,
          languages: [LanguageAnnotationUpdate.t()] | nil,
          location: LocationAnnotationUpdate.t() | nil,
          organizationName: TextAnnotationUpdate.t() | nil,
          organizationWebsite: TextAnnotationUpdate.t() | nil,
          skills: [SkillAnnotationUpdate.t()] | nil,
          startDate: DateAnnotationUpdate.t() | nil,
          yearsExperience: YearsExperienceAnnotationUpdate.t() | nil
        }

  defstruct [
    :certifications,
    :contactEmail,
    :contactName,
    :contactPhone,
    :educationAccreditation,
    :educationLevel,
    :endDate,
    :expectedRemuneration,
    :jobTitle,
    :jobType,
    :languages,
    :location,
    :organizationName,
    :organizationWebsite,
    :skills,
    :startDate,
    :yearsExperience
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      certifications: [{TextAnnotationUpdate, :t}],
      contactEmail: {TextAnnotationUpdate, :t},
      contactName: {TextAnnotationUpdate, :t},
      contactPhone: {TextAnnotationUpdate, :t},
      educationAccreditation: {TextAnnotationUpdate, :t},
      educationLevel: {TextAnnotationUpdate, :t},
      endDate: {DateAnnotationUpdate, :t},
      expectedRemuneration: {ExpectedRemunerationAnnotationUpdate, :t},
      jobTitle: {JobTitleAnnotationUpdate, :t},
      jobType: {TextAnnotationUpdate, :t},
      languages: [{LanguageAnnotationUpdate, :t}],
      location: {LocationAnnotationUpdate, :t},
      organizationName: {TextAnnotationUpdate, :t},
      organizationWebsite: {TextAnnotationUpdate, :t},
      skills: [{SkillAnnotationUpdate, :t}],
      startDate: {DateAnnotationUpdate, :t},
      yearsExperience: {YearsExperienceAnnotationUpdate, :t}
    ]
  end
end
