defmodule GitHub.ReviewComment do
  @moduledoc """
  Provides struct and type for a ReviewComment
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          _links: GitHub.ReviewCommentLinks.t(),
          author_association: String.t(),
          body: String.t(),
          body_html: String.t() | nil,
          body_text: String.t() | nil,
          commit_id: String.t(),
          created_at: DateTime.t(),
          diff_hunk: String.t(),
          html_url: String.t(),
          id: integer,
          in_reply_to_id: integer | nil,
          line: integer | nil,
          node_id: String.t(),
          original_commit_id: String.t(),
          original_line: integer | nil,
          original_position: integer,
          original_start_line: integer | nil,
          path: String.t(),
          position: integer | nil,
          pull_request_review_id: integer | nil,
          pull_request_url: String.t(),
          reactions: GitHub.Reaction.Rollup.t() | nil,
          side: String.t() | nil,
          start_line: integer | nil,
          start_side: String.t() | nil,
          updated_at: DateTime.t(),
          url: String.t(),
          user: GitHub.User.simple() | nil
        }

  defstruct [
    :__info__,
    :_links,
    :author_association,
    :body,
    :body_html,
    :body_text,
    :commit_id,
    :created_at,
    :diff_hunk,
    :html_url,
    :id,
    :in_reply_to_id,
    :line,
    :node_id,
    :original_commit_id,
    :original_line,
    :original_position,
    :original_start_line,
    :path,
    :position,
    :pull_request_review_id,
    :pull_request_url,
    :reactions,
    :side,
    :start_line,
    :start_side,
    :updated_at,
    :url,
    :user
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: {GitHub.ReviewCommentLinks, :t},
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
      commit_id: {:string, :generic},
      created_at: {:string, :date_time},
      diff_hunk: {:string, :generic},
      html_url: {:string, :uri},
      id: :integer,
      in_reply_to_id: :integer,
      line: :integer,
      node_id: {:string, :generic},
      original_commit_id: {:string, :generic},
      original_line: :integer,
      original_position: :integer,
      original_start_line: {:union, [:integer, :null]},
      path: {:string, :generic},
      position: {:union, [:integer, :null]},
      pull_request_review_id: {:union, [:integer, :null]},
      pull_request_url: {:string, :uri},
      reactions: {GitHub.Reaction.Rollup, :t},
      side: {:enum, ["LEFT", "RIGHT"]},
      start_line: {:union, [:integer, :null]},
      start_side: {:enum, ["LEFT", "RIGHT", nil]},
      updated_at: {:string, :date_time},
      url: {:string, :uri},
      user: {:union, [{GitHub.User, :simple}, :null]}
    ]
  end
end
