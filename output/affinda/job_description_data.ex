defmodule JobDescriptionData do
  @moduledoc """
  Provides struct and type for a JobDescriptionData
  """

  @type t :: %__MODULE__{
          certifications: [TextAnnotation.t()] | nil,
          contactEmail: TextAnnotation.t() | nil,
          contactName: TextAnnotation.t() | nil,
          contactPhone: TextAnnotation.t() | nil,
          educationAccreditation: TextAnnotation.t() | nil,
          educationLevel: TextAnnotation.t() | nil,
          endDate: DateAnnotation.t() | nil,
          expectedRemuneration: ExpectedRemunerationAnnotation.t() | nil,
          jobTitle: JobTitleAnnotation.t() | nil,
          jobType: TextAnnotation.t() | nil,
          languages: [LanguageAnnotation.t()] | nil,
          location: LocationAnnotation.t() | nil,
          organizationName: TextAnnotation.t() | nil,
          organizationWebsite: TextAnnotation.t() | nil,
          rawText: String.t() | nil,
          skills: [SkillAnnotation.t()] | nil,
          startDate: DateAnnotation.t() | nil,
          yearsExperience: YearsExperienceAnnotation.t() | nil
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
    :rawText,
    :skills,
    :startDate,
    :yearsExperience
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      certifications: [{TextAnnotation, :t}],
      contactEmail: {TextAnnotation, :t},
      contactName: {TextAnnotation, :t},
      contactPhone: {TextAnnotation, :t},
      educationAccreditation: {TextAnnotation, :t},
      educationLevel: {TextAnnotation, :t},
      endDate: {DateAnnotation, :t},
      expectedRemuneration: {ExpectedRemunerationAnnotation, :t},
      jobTitle: {JobTitleAnnotation, :t},
      jobType: {TextAnnotation, :t},
      languages: [{LanguageAnnotation, :t}],
      location: {LocationAnnotation, :t},
      organizationName: {TextAnnotation, :t},
      organizationWebsite: {TextAnnotation, :t},
      rawText: {:string, :generic},
      skills: [{SkillAnnotation, :t}],
      startDate: {DateAnnotation, :t},
      yearsExperience: {YearsExperienceAnnotation, :t}
    ]
  end
end
