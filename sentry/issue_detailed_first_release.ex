defmodule IssueDetailedFirstRelease do
  @moduledoc """
  Provides struct and type for a IssueDetailedFirstRelease
  """

  @type t :: %__MODULE__{
          authors: [String.t()] | nil,
          commitCount: integer | nil,
          data: map | nil,
          dateCreated: String.t() | nil,
          dateReleased: String.t() | nil,
          deployCount: integer | nil,
          firstEvent: String.t() | nil,
          lastCommit: String.t() | nil,
          lastDeploy: String.t() | nil,
          lastEvent: String.t() | nil,
          newGroups: integer | nil,
          owner: String.t() | nil,
          projects: [IssueDetailedFirstReleaseProjects.t()] | nil,
          ref: String.t() | nil,
          shortVersion: String.t() | nil,
          url: String.t() | nil,
          version: String.t() | nil
        }

  defstruct [
    :authors,
    :commitCount,
    :data,
    :dateCreated,
    :dateReleased,
    :deployCount,
    :firstEvent,
    :lastCommit,
    :lastDeploy,
    :lastEvent,
    :newGroups,
    :owner,
    :projects,
    :ref,
    :shortVersion,
    :url,
    :version
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      authors: [string: :generic],
      commitCount: :integer,
      data: :map,
      dateCreated: {:string, :generic},
      dateReleased: {:string, :generic},
      deployCount: :integer,
      firstEvent: {:string, :generic},
      lastCommit: {:string, :generic},
      lastDeploy: {:string, :generic},
      lastEvent: {:string, :generic},
      newGroups: :integer,
      owner: {:string, :generic},
      projects: [{IssueDetailedFirstReleaseProjects, :t}],
      ref: {:string, :generic},
      shortVersion: {:string, :generic},
      url: {:string, :generic},
      version: {:string, :generic}
    ]
  end
end
