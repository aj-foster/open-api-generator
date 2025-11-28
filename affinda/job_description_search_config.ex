defmodule JobDescriptionSearchConfig do
  @moduledoc """
  Provides struct and type for a JobDescriptionSearchConfig
  """

  @type t :: %__MODULE__{
          actions: [SearchConfigAction.t()] | nil,
          allowPdfDownload: boolean | nil,
          customFieldsConfig: [CustomFieldConfig.t()] | nil,
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
          searchToolTheme: JobDescriptionSearchConfigSearchToolTheme.t() | nil,
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
      actions: [{SearchConfigAction, :t}],
      allowPdfDownload: :boolean,
      customFieldsConfig: [{CustomFieldConfig, :t}],
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
      indices: [string: :generic],
      maxResults: :integer,
      searchToolTheme: {JobDescriptionSearchConfigSearchToolTheme, :t},
      showIndexDropdown: :boolean,
      userId: :integer,
      username: {:string, :generic},
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
