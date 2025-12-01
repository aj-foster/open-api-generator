defmodule Sentry.OrganizationProjects do
  @moduledoc """
  Provides struct and type for a OrganizationProjects
  """

  @type t :: %__MODULE__{
          dateCreated: String.t(),
          firstEvent: String.t() | nil,
          hasAccess: boolean,
          id: String.t(),
          isBookmarked: boolean,
          isMember: boolean,
          latestDeploys: String.t() | nil,
          name: String.t(),
          platform: String.t() | nil,
          platforms: [String.t()],
          slug: String.t(),
          team: Sentry.OrganizationProjectsTeam.t() | nil,
          teams: [Sentry.TeamMinimal.t()]
        }

  defstruct [
    :dateCreated,
    :firstEvent,
    :hasAccess,
    :id,
    :isBookmarked,
    :isMember,
    :latestDeploys,
    :name,
    :platform,
    :platforms,
    :slug,
    :team,
    :teams
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      dateCreated: :string,
      firstEvent: :string,
      hasAccess: :boolean,
      id: :string,
      isBookmarked: :boolean,
      isMember: :boolean,
      latestDeploys: :string,
      name: :string,
      platform: :string,
      platforms: [:string],
      slug: :string,
      team: {Sentry.OrganizationProjectsTeam, :t},
      teams: [{Sentry.TeamMinimal, :t}]
    ]
  end
end
