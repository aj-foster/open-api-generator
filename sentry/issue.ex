defmodule Sentry.Issue do
  @moduledoc """
  Provides struct and type for a Issue
  """

  @type t :: %__MODULE__{
          annotations: [String.t()],
          assignedTo: map | nil,
          count: String.t(),
          culprit: String.t(),
          firstSeen: String.t(),
          hasSeen: boolean,
          id: String.t(),
          isBookmarked: boolean,
          isPublic: boolean,
          isSubscribed: boolean,
          lastSeen: String.t(),
          level: String.t(),
          logger: String.t() | nil,
          metadata: Sentry.IssueMetadata.t(),
          numComments: integer,
          permalink: String.t(),
          project: Sentry.IssueProject.t(),
          shareId: String.t() | nil,
          shortId: String.t(),
          stats: Sentry.IssueStats.t(),
          status: String.t(),
          statusDetails: map,
          subscriptionDetails: map | nil,
          title: String.t(),
          type: String.t(),
          userCount: integer
        }

  defstruct [
    :annotations,
    :assignedTo,
    :count,
    :culprit,
    :firstSeen,
    :hasSeen,
    :id,
    :isBookmarked,
    :isPublic,
    :isSubscribed,
    :lastSeen,
    :level,
    :logger,
    :metadata,
    :numComments,
    :permalink,
    :project,
    :shareId,
    :shortId,
    :stats,
    :status,
    :statusDetails,
    :subscriptionDetails,
    :title,
    :type,
    :userCount
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      annotations: [:string],
      assignedTo: :map,
      count: :string,
      culprit: :string,
      firstSeen: :string,
      hasSeen: :boolean,
      id: :string,
      isBookmarked: :boolean,
      isPublic: :boolean,
      isSubscribed: :boolean,
      lastSeen: :string,
      level: :string,
      logger: :string,
      metadata: {Sentry.IssueMetadata, :t},
      numComments: :integer,
      permalink: :string,
      project: {Sentry.IssueProject, :t},
      shareId: :string,
      shortId: :string,
      stats: {Sentry.IssueStats, :t},
      status: {:enum, ["resolved", "unresolved", "ignored"]},
      statusDetails: :map,
      subscriptionDetails: :map,
      title: :string,
      type: :string,
      userCount: :integer
    ]
  end
end
