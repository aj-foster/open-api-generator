defmodule Affinda.JobDescriptionData do
  @moduledoc """
  Provides struct and type for a JobDescriptionData
  """

  @type t :: %__MODULE__{
          certifications: [Affinda.TextAnnotation.t()] | nil,
          contactEmail: Affinda.TextAnnotation.t() | nil,
          contactName: Affinda.TextAnnotation.t() | nil,
          contactPhone: Affinda.TextAnnotation.t() | nil,
          educationAccreditation: Affinda.TextAnnotation.t() | nil,
          educationLevel: Affinda.TextAnnotation.t() | nil,
          endDate: Affinda.DateAnnotation.t() | nil,
          expectedRemuneration: Affinda.ExpectedRemunerationAnnotation.t() | nil,
          jobTitle: Affinda.JobTitleAnnotation.t() | nil,
          jobType: Affinda.TextAnnotation.t() | nil,
          languages: [Affinda.LanguageAnnotation.t()] | nil,
          location: Affinda.LocationAnnotation.t() | nil,
          organizationName: Affinda.TextAnnotation.t() | nil,
          organizationWebsite: Affinda.TextAnnotation.t() | nil,
          rawText: String.t() | nil,
          skills: [Affinda.SkillAnnotation.t()] | nil,
          startDate: Affinda.DateAnnotation.t() | nil,
          yearsExperience: Affinda.YearsExperienceAnnotation.t() | nil
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
      certifications: [{Affinda.TextAnnotation, :t}],
      contactEmail: {Affinda.TextAnnotation, :t},
      contactName: {Affinda.TextAnnotation, :t},
      contactPhone: {Affinda.TextAnnotation, :t},
      educationAccreditation: {Affinda.TextAnnotation, :t},
      educationLevel: {Affinda.TextAnnotation, :t},
      endDate: {Affinda.DateAnnotation, :t},
      expectedRemuneration: {Affinda.ExpectedRemunerationAnnotation, :t},
      jobTitle: {Affinda.JobTitleAnnotation, :t},
      jobType: {Affinda.TextAnnotation, :t},
      languages: [{Affinda.LanguageAnnotation, :t}],
      location: {Affinda.LocationAnnotation, :t},
      organizationName: {Affinda.TextAnnotation, :t},
      organizationWebsite: {Affinda.TextAnnotation, :t},
      rawText: :string,
      skills: [{Affinda.SkillAnnotation, :t}],
      startDate: {Affinda.DateAnnotation, :t},
      yearsExperience: {Affinda.YearsExperienceAnnotation, :t}
    ]
  end
end
