defmodule OrganizationProjects do
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
          team: OrganizationProjectsTeam.t() | nil,
          teams: [TeamMinimal.t()]
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
      dateCreated: {:string, :generic},
      firstEvent: {:string, :generic},
      hasAccess: :boolean,
      id: {:string, :generic},
      isBookmarked: :boolean,
      isMember: :boolean,
      latestDeploys: {:string, :generic},
      name: {:string, :generic},
      platform: {:string, :generic},
      platforms: [string: :generic],
      slug: {:string, :generic},
      team: {OrganizationProjectsTeam, :t},
      teams: [{TeamMinimal, :t}]
    ]
  end
end
