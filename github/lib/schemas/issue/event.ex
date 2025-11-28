defmodule GitHub.Issue.Event do
  @moduledoc """
  Provides struct and type for a Issue.Event
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          actor: GitHub.User.simple() | nil,
          assignee: GitHub.User.simple() | nil,
          assigner: GitHub.User.simple() | nil,
          author_association: String.t() | nil,
          commit_id: String.t() | nil,
          commit_url: String.t() | nil,
          created_at: DateTime.t(),
          dismissed_review: GitHub.Issue.EventDismissedReview.t() | nil,
          event: String.t(),
          id: integer,
          issue: GitHub.Issue.t() | nil,
          label: GitHub.Issue.EventLabel.t() | nil,
          lock_reason: String.t() | nil,
          milestone: GitHub.Issue.EventMilestone.t() | nil,
          node_id: String.t(),
          performed_via_github_app: GitHub.App.t() | nil,
          project_card: GitHub.Issue.EventProjectCard.t() | nil,
          rename: GitHub.Issue.EventRename.t() | nil,
          requested_reviewer: GitHub.User.simple() | nil,
          requested_team: GitHub.Team.t() | nil,
          review_requester: GitHub.User.simple() | nil,
          url: String.t()
        }

  defstruct [
    :__info__,
    :actor,
    :assignee,
    :assigner,
    :author_association,
    :commit_id,
    :commit_url,
    :created_at,
    :dismissed_review,
    :event,
    :id,
    :issue,
    :label,
    :lock_reason,
    :milestone,
    :node_id,
    :performed_via_github_app,
    :project_card,
    :rename,
    :requested_reviewer,
    :requested_team,
    :review_requester,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actor: {:union, [{GitHub.User, :simple}, :null]},
      assignee: {:union, [{GitHub.User, :simple}, :null]},
      assigner: {:union, [{GitHub.User, :simple}, :null]},
      author_association:
        {:enum,
         [
           "COLLABORATOR",
           "CONTRIBUTOR",
           "FIRST_TIMER",
           "FIRST_TIME_CONTRIBUTOR",
           "MANNEQUIN",
           "MEMBER",
           "NONE",
           "OWNER"
         ]},
      commit_id: {:union, [{:string, :generic}, :null]},
      commit_url: {:union, [{:string, :generic}, :null]},
      created_at: {:string, :date_time},
      dismissed_review: {GitHub.Issue.EventDismissedReview, :t},
      event: {:string, :generic},
      id: :integer,
      issue: {:union, [{GitHub.Issue, :t}, :null]},
      label: {GitHub.Issue.EventLabel, :t},
      lock_reason: {:union, [{:string, :generic}, :null]},
      milestone: {GitHub.Issue.EventMilestone, :t},
      node_id: {:string, :generic},
      performed_via_github_app: {:union, [{GitHub.App, :t}, :null]},
      project_card: {GitHub.Issue.EventProjectCard, :t},
      rename: {GitHub.Issue.EventRename, :t},
      requested_reviewer: {:union, [{GitHub.User, :simple}, :null]},
      requested_team: {GitHub.Team, :t},
      review_requester: {:union, [{GitHub.User, :simple}, :null]},
      url: {:string, :uri}
    ]
  end
end
