defmodule GitHub.Issue.SearchResultItem do
  @moduledoc """
  Provides struct and type for a Issue.SearchResultItem
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          active_lock_reason: String.t() | nil,
          assignee: GitHub.User.simple() | nil,
          assignees: [GitHub.User.simple()] | nil,
          author_association: String.t(),
          body: String.t() | nil,
          body_html: String.t() | nil,
          body_text: String.t() | nil,
          closed_at: DateTime.t() | nil,
          comments: integer,
          comments_url: String.t(),
          created_at: DateTime.t(),
          draft: boolean | nil,
          events_url: String.t(),
          html_url: String.t(),
          id: integer,
          labels: [GitHub.Issue.SearchResultItemLabels.t()],
          labels_url: String.t(),
          locked: boolean,
          milestone: GitHub.Milestone.t() | nil,
          node_id: String.t(),
          number: integer,
          performed_via_github_app: GitHub.App.t() | nil,
          pull_request: GitHub.Issue.SearchResultItemPullRequest.t() | nil,
          reactions: GitHub.Reaction.Rollup.t() | nil,
          repository: GitHub.Repository.t() | nil,
          repository_url: String.t(),
          score: number,
          state: String.t(),
          state_reason: String.t() | nil,
          text_matches: [GitHub.SearchResultTextMatches.t()] | nil,
          timeline_url: String.t() | nil,
          title: String.t(),
          updated_at: DateTime.t(),
          url: String.t(),
          user: GitHub.User.simple() | nil
        }

  defstruct [
    :__info__,
    :active_lock_reason,
    :assignee,
    :assignees,
    :author_association,
    :body,
    :body_html,
    :body_text,
    :closed_at,
    :comments,
    :comments_url,
    :created_at,
    :draft,
    :events_url,
    :html_url,
    :id,
    :labels,
    :labels_url,
    :locked,
    :milestone,
    :node_id,
    :number,
    :performed_via_github_app,
    :pull_request,
    :reactions,
    :repository,
    :repository_url,
    :score,
    :state,
    :state_reason,
    :text_matches,
    :timeline_url,
    :title,
    :updated_at,
    :url,
    :user
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      active_lock_reason: {:union, [{:string, :generic}, :null]},
      assignee: {:union, [{GitHub.User, :simple}, :null]},
      assignees: {:union, [[{GitHub.User, :simple}], :null]},
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
      body: {:string, :generic},
      body_html: {:string, :generic},
      body_text: {:string, :generic},
      closed_at: {:union, [{:string, :date_time}, :null]},
      comments: :integer,
      comments_url: {:string, :uri},
      created_at: {:string, :date_time},
      draft: :boolean,
      events_url: {:string, :uri},
      html_url: {:string, :uri},
      id: :integer,
      labels: [{GitHub.Issue.SearchResultItemLabels, :t}],
      labels_url: {:string, :generic},
      locked: :boolean,
      milestone: {:union, [{GitHub.Milestone, :t}, :null]},
      node_id: {:string, :generic},
      number: :integer,
      performed_via_github_app: {:union, [{GitHub.App, :t}, :null]},
      pull_request: {GitHub.Issue.SearchResultItemPullRequest, :t},
      reactions: {GitHub.Reaction.Rollup, :t},
      repository: {GitHub.Repository, :t},
      repository_url: {:string, :uri},
      score: :number,
      state: {:string, :generic},
      state_reason: {:union, [{:string, :generic}, :null]},
      text_matches: [{GitHub.SearchResultTextMatches, :t}],
      timeline_url: {:string, :uri},
      title: {:string, :generic},
      updated_at: {:string, :date_time},
      url: {:string, :uri},
      user: {:union, [{GitHub.User, :simple}, :null]}
    ]
  end
end
