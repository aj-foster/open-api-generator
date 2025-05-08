defmodule OrganizationRelease do
  @moduledoc """
  Provides struct and type for a OrganizationRelease
  """

  @type t :: %__MODULE__{
          authors: [map],
          commitCount: integer,
          data: map,
          dateCreated: DateTime.t(),
          dateReleased: DateTime.t() | nil,
          deployCount: integer,
          firstEvent: DateTime.t() | nil,
          id: integer | nil,
          lastCommit: map | nil,
          lastDeploy: Deploy.t() | String.t() | nil,
          lastEvent: DateTime.t() | nil,
          newGroups: integer,
          owner: map | nil,
          projects: [map],
          ref: String.t() | nil,
          shortVersion: String.t(),
          url: String.t() | nil,
          version: String.t()
        }

  defstruct [
    :authors,
    :commitCount,
    :data,
    :dateCreated,
    :dateReleased,
    :deployCount,
    :firstEvent,
    :id,
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
      authors: [:map],
      commitCount: :integer,
      data: :map,
      dateCreated: {:string, :date_time},
      dateReleased: {:string, :date_time},
      deployCount: :integer,
      firstEvent: {:string, :date_time},
      id: :integer,
      lastCommit: :map,
      lastDeploy: {:union, [{Deploy, :t}, string: :generic]},
      lastEvent: {:string, :date_time},
      newGroups: :integer,
      owner: :map,
      projects: [:map],
      ref: {:string, :generic},
      shortVersion: {:string, :generic},
      url: {:string, :generic},
      version: {:string, :generic}
    ]
  end
end
