defmodule IssueNoStats do
  @moduledoc """
  Provides struct and type for a IssueNoStats
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
          metadata: IssueNoStatsMetadata.t(),
          numComments: integer,
          permalink: String.t(),
          project: IssueNoStatsProject.t(),
          shareId: String.t() | nil,
          shortId: String.t(),
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
      annotations: [string: :generic],
      assignedTo: :map,
      count: {:string, :generic},
      culprit: {:string, :generic},
      firstSeen: {:string, :generic},
      hasSeen: :boolean,
      id: {:string, :generic},
      isBookmarked: :boolean,
      isPublic: :boolean,
      isSubscribed: :boolean,
      lastSeen: {:string, :generic},
      level: {:string, :generic},
      logger: {:string, :generic},
      metadata: {IssueNoStatsMetadata, :t},
      numComments: :integer,
      permalink: {:string, :generic},
      project: {IssueNoStatsProject, :t},
      shareId: {:string, :generic},
      shortId: {:string, :generic},
      status: {:enum, ["resolved", "unresolved", "ignored"]},
      statusDetails: :map,
      subscriptionDetails: :map,
      title: {:string, :generic},
      type: {:string, :generic},
      userCount: :integer
    ]
  end
end
