defmodule Sentry.OrganizationDetails do
  @moduledoc """
  Provides struct and type for a OrganizationDetails
  """

  @type t :: %__MODULE__{
          access: [String.t()],
          allowSharedIssues: boolean,
          availableRoles: [Sentry.OrganizationDetailsAvailableRoles.t()],
          avatar: Sentry.Avatar.t(),
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
          onboardingTasks: [Sentry.OrganizationDetailsOnboardingTasks.t()],
          openMembership: boolean,
          pendingAccessRequests: integer,
          projects: [Sentry.OrganizationProjects.t()],
          quota: Sentry.OrganizationDetailsQuota.t(),
          require2FA: boolean,
          safeFields: [String.t()],
          scrapeJavaScript: boolean,
          scrubIPAddresses: boolean,
          sensitiveFields: [String.t()],
          slug: String.t(),
          status: Sentry.OrganizationDetailsStatus.t(),
          storeCrashReports: integer,
          teams: [Sentry.Team.t()],
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
      access: [:string],
      allowSharedIssues: :boolean,
      availableRoles: [{Sentry.OrganizationDetailsAvailableRoles, :t}],
      avatar: {Sentry.Avatar, :t},
      dataScrubber: :boolean,
      dataScrubberDefaults: :boolean,
      dateCreated: {:string, "date-time"},
      defaultRole: :string,
      enhancedPrivacy: :boolean,
      experiments: :map,
      features: [:string],
      id: :string,
      isDefault: :boolean,
      isEarlyAdopter: :boolean,
      name: :string,
      onboardingTasks: [{Sentry.OrganizationDetailsOnboardingTasks, :t}],
      openMembership: :boolean,
      pendingAccessRequests: {:integer, "int64"},
      projects: [{Sentry.OrganizationProjects, :t}],
      quota: {Sentry.OrganizationDetailsQuota, :t},
      require2FA: :boolean,
      safeFields: [:string],
      scrapeJavaScript: :boolean,
      scrubIPAddresses: :boolean,
      sensitiveFields: [:string],
      slug: :string,
      status: {Sentry.OrganizationDetailsStatus, :t},
      storeCrashReports: {:integer, "int64"},
      teams: [{Sentry.Team, :t}],
      trustedRelays: [:string]
    ]
  end
end
