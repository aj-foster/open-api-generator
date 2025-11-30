defmodule Affinda.JobDescriptionDataUpdate do
  @moduledoc """
  Provides struct and type for a JobDescriptionDataUpdate
  """

  @type t :: %__MODULE__{
          certifications: [Affinda.TextAnnotationUpdate.t()] | nil,
          contactEmail: Affinda.TextAnnotationUpdate.t() | nil,
          contactName: Affinda.TextAnnotationUpdate.t() | nil,
          contactPhone: Affinda.TextAnnotationUpdate.t() | nil,
          educationAccreditation: Affinda.TextAnnotationUpdate.t() | nil,
          educationLevel: Affinda.TextAnnotationUpdate.t() | nil,
          endDate: Affinda.DateAnnotationUpdate.t() | nil,
          expectedRemuneration: Affinda.ExpectedRemunerationAnnotationUpdate.t() | nil,
          jobTitle: Affinda.JobTitleAnnotationUpdate.t() | nil,
          jobType: Affinda.TextAnnotationUpdate.t() | nil,
          languages: [Affinda.LanguageAnnotationUpdate.t()] | nil,
          location: Affinda.LocationAnnotationUpdate.t() | nil,
          organizationName: Affinda.TextAnnotationUpdate.t() | nil,
          organizationWebsite: Affinda.TextAnnotationUpdate.t() | nil,
          skills: [Affinda.SkillAnnotationUpdate.t()] | nil,
          startDate: Affinda.DateAnnotationUpdate.t() | nil,
          yearsExperience: Affinda.YearsExperienceAnnotationUpdate.t() | nil
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
      certifications: [{Affinda.TextAnnotationUpdate, :t}],
      contactEmail: {Affinda.TextAnnotationUpdate, :t},
      contactName: {Affinda.TextAnnotationUpdate, :t},
      contactPhone: {Affinda.TextAnnotationUpdate, :t},
      educationAccreditation: {Affinda.TextAnnotationUpdate, :t},
      educationLevel: {Affinda.TextAnnotationUpdate, :t},
      endDate: {Affinda.DateAnnotationUpdate, :t},
      expectedRemuneration: {Affinda.ExpectedRemunerationAnnotationUpdate, :t},
      jobTitle: {Affinda.JobTitleAnnotationUpdate, :t},
      jobType: {Affinda.TextAnnotationUpdate, :t},
      languages: [{Affinda.LanguageAnnotationUpdate, :t}],
      location: {Affinda.LocationAnnotationUpdate, :t},
      organizationName: {Affinda.TextAnnotationUpdate, :t},
      organizationWebsite: {Affinda.TextAnnotationUpdate, :t},
      skills: [{Affinda.SkillAnnotationUpdate, :t}],
      startDate: {Affinda.DateAnnotationUpdate, :t},
      yearsExperience: {Affinda.YearsExperienceAnnotationUpdate, :t}
    ]
  end
end
