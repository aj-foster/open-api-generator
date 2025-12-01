defmodule Sentry.IssueDetailedFirstRelease do
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
          projects: [Sentry.IssueDetailedFirstReleaseProjects.t()] | nil,
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
      authors: [:string],
      commitCount: :integer,
      data: :map,
      dateCreated: :string,
      dateReleased: :string,
      deployCount: :integer,
      firstEvent: :string,
      lastCommit: :string,
      lastDeploy: :string,
      lastEvent: :string,
      newGroups: :integer,
      owner: :string,
      projects: [{Sentry.IssueDetailedFirstReleaseProjects, :t}],
      ref: :string,
      shortVersion: :string,
      url: :string,
      version: :string
    ]
  end
end
