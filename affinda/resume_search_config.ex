defmodule Affinda.ResumeSearchConfig do
  @moduledoc """
  Provides struct and type for a ResumeSearchConfig
  """

  @type t :: %__MODULE__{
          actions: [Affinda.SearchConfigAction.t()] | nil,
          allowPdfDownload: boolean | nil,
          customFieldsConfig: [Affinda.CustomFieldConfig.t()] | nil,
          displayEducation: boolean | nil,
          displayJobTitle: boolean | nil,
          displayKeywords: boolean | nil,
          displayLanguages: boolean | nil,
          displayLocation: boolean | nil,
          displayManagementLevel: boolean | nil,
          displayOccupationGroup: boolean | nil,
          displaySkills: boolean | nil,
          displayYearsExperience: boolean | nil,
          distanceUnit: String.t() | nil,
          hideSidePanel: boolean | nil,
          hideToolbar: boolean | nil,
          indices: [String.t()] | nil,
          maxResults: integer | nil,
          searchToolTheme: Affinda.ResumeSearchConfigSearchToolTheme.t() | nil,
          showIndexDropdown: boolean | nil,
          userId: integer | nil,
          username: String.t() | nil,
          weightEducation: number | nil,
          weightJobTitle: number | nil,
          weightKeywords: number | nil,
          weightLanguages: number | nil,
          weightLocation: number | nil,
          weightManagementLevel: number | nil,
          weightOccupationGroup: number | nil,
          weightSkills: number | nil,
          weightYearsExperience: number | nil
        }

  defstruct [
    :actions,
    :allowPdfDownload,
    :customFieldsConfig,
    :displayEducation,
    :displayJobTitle,
    :displayKeywords,
    :displayLanguages,
    :displayLocation,
    :displayManagementLevel,
    :displayOccupationGroup,
    :displaySkills,
    :displayYearsExperience,
    :distanceUnit,
    :hideSidePanel,
    :hideToolbar,
    :indices,
    :maxResults,
    :searchToolTheme,
    :showIndexDropdown,
    :userId,
    :username,
    :weightEducation,
    :weightJobTitle,
    :weightKeywords,
    :weightLanguages,
    :weightLocation,
    :weightManagementLevel,
    :weightOccupationGroup,
    :weightSkills,
    :weightYearsExperience
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actions: [{Affinda.SearchConfigAction, :t}],
      allowPdfDownload: :boolean,
      customFieldsConfig: [{Affinda.CustomFieldConfig, :t}],
      displayEducation: :boolean,
      displayJobTitle: :boolean,
      displayKeywords: :boolean,
      displayLanguages: :boolean,
      displayLocation: :boolean,
      displayManagementLevel: :boolean,
      displayOccupationGroup: :boolean,
      displaySkills: :boolean,
      displayYearsExperience: :boolean,
      distanceUnit: {:enum, ["mi", "km"]},
      hideSidePanel: :boolean,
      hideToolbar: :boolean,
      indices: [:string],
      maxResults: :integer,
      searchToolTheme: {Affinda.ResumeSearchConfigSearchToolTheme, :t},
      showIndexDropdown: :boolean,
      userId: :integer,
      username: :string,
      weightEducation: :number,
      weightJobTitle: :number,
      weightKeywords: :number,
      weightLanguages: :number,
      weightLocation: :number,
      weightManagementLevel: :number,
      weightOccupationGroup: :number,
      weightSkills: :number,
      weightYearsExperience: :number
    ]
  end
end
