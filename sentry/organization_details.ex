defmodule OrganizationDetails do
  @moduledoc """
  Provides struct and type for a OrganizationDetails
  """

  @type t :: %__MODULE__{
          access: [String.t()],
          allowSharedIssues: boolean,
          availableRoles: [OrganizationDetailsAvailableRoles.t()],
          avatar: Avatar.t(),
          dataScrubber: boolean,
          dataScrubberDefaults: boolean,
          dateCreated: DateTime.t(),
          defaultRole: String.t(),
          enhancedPrivacy: boolean,
          experiments: map,
          features: [String.t()],
          id: String.t(),
          isDefault: boolean,
          isEarlyAdopter: boolean,
          name: String.t(),
          onboardingTasks: [OrganizationDetailsOnboardingTasks.t()],
          openMembership: boolean,
          pendingAccessRequests: integer,
          projects: [OrganizationProjects.t()],
          quota: OrganizationDetailsQuota.t(),
          require2FA: boolean,
          safeFields: [String.t()],
          scrapeJavaScript: boolean,
          scrubIPAddresses: boolean,
          sensitiveFields: [String.t()],
          slug: String.t(),
          status: OrganizationDetailsStatus.t(),
          storeCrashReports: integer,
          teams: [Team.t()],
          trustedRelays: [String.t()]
        }

  defstruct [
    :access,
    :allowSharedIssues,
    :availableRoles,
    :avatar,
    :dataScrubber,
    :dataScrubberDefaults,
    :dateCreated,
    :defaultRole,
    :enhancedPrivacy,
    :experiments,
    :features,
    :id,
    :isDefault,
    :isEarlyAdopter,
    :name,
    :onboardingTasks,
    :openMembership,
    :pendingAccessRequests,
    :projects,
    :quota,
    :require2FA,
    :safeFields,
    :scrapeJavaScript,
    :scrubIPAddresses,
    :sensitiveFields,
    :slug,
    :status,
    :storeCrashReports,
    :teams,
    :trustedRelays
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      access: [string: :generic],
      allowSharedIssues: :boolean,
      availableRoles: [{OrganizationDetailsAvailableRoles, :t}],
      avatar: {Avatar, :t},
      dataScrubber: :boolean,
      dataScrubberDefaults: :boolean,
      dateCreated: {:string, :date_time},
      defaultRole: {:string, :generic},
      enhancedPrivacy: :boolean,
      experiments: :map,
      features: [string: :generic],
      id: {:string, :generic},
      isDefault: :boolean,
      isEarlyAdopter: :boolean,
      name: {:string, :generic},
      onboardingTasks: [{OrganizationDetailsOnboardingTasks, :t}],
      openMembership: :boolean,
      pendingAccessRequests: :integer,
      projects: [{OrganizationProjects, :t}],
      quota: {OrganizationDetailsQuota, :t},
      require2FA: :boolean,
      safeFields: [string: :generic],
      scrapeJavaScript: :boolean,
      scrubIPAddresses: :boolean,
      sensitiveFields: [string: :generic],
      slug: {:string, :generic},
      status: {OrganizationDetailsStatus, :t},
      storeCrashReports: :integer,
      teams: [{Team, :t}],
      trustedRelays: [string: :generic]
    ]
  end
end
