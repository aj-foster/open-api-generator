defmodule GitHub.Timeline.CommentEvent do
  @moduledoc """
  Provides struct and type for a Timeline.CommentEvent
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          actor: GitHub.User.simple(),
          author_association: String.t(),
          body: String.t() | nil,
          body_html: String.t() | nil,
          body_text: String.t() | nil,
          created_at: DateTime.t(),
          event: String.t(),
          html_url: String.t(),
          id: integer,
          issue_url: String.t(),
          node_id: String.t(),
          performed_via_github_app: GitHub.App.t() | nil,
          reactions: GitHub.Reaction.Rollup.t() | nil,
          updated_at: DateTime.t(),
          url: String.t(),
          user: GitHub.User.simple()
        }

  defstruct [
    :__info__,
    :actor,
    :author_association,
    :body,
    :body_html,
    :body_text,
    :created_at,
    :event,
    :html_url,
    :id,
    :issue_url,
    :node_id,
    :performed_via_github_app,
    :reactions,
    :updated_at,
    :url,
    :user
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actor: {GitHub.User, :simple},
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
      created_at: {:string, :date_time},
      event: {:string, :generic},
      html_url: {:string, :uri},
      id: :integer,
      issue_url: {:string, :uri},
      node_id: {:string, :generic},
      performed_via_github_app: {:union, [{GitHub.App, :t}, :null]},
      reactions: {GitHub.Reaction.Rollup, :t},
      updated_at: {:string, :date_time},
      url: {:string, :uri},
      user: {GitHub.User, :simple}
    ]
  end
end
