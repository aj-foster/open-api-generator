defmodule GitHub.PullRequest.Review do
  @moduledoc """
  Provides struct and type for a PullRequest.Review
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          _links: GitHub.PullRequest.ReviewLinks.t(),
          author_association: String.t(),
          body: String.t(),
          body_html: String.t() | nil,
          body_text: String.t() | nil,
          commit_id: String.t() | nil,
          html_url: String.t(),
          id: integer,
          node_id: String.t(),
          pull_request_url: String.t(),
          state: String.t(),
          submitted_at: DateTime.t() | nil,
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
    :html_url,
    :id,
    :node_id,
    :pull_request_url,
    :state,
    :submitted_at,
    :user
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: {GitHub.PullRequest.ReviewLinks, :t},
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
      commit_id: {:union, [{:string, :generic}, :null]},
      html_url: {:string, :uri},
      id: :integer,
      node_id: {:string, :generic},
      pull_request_url: {:string, :uri},
      state: {:string, :generic},
      submitted_at: {:string, :date_time},
      user: {:union, [{GitHub.User, :simple}, :null]}
    ]
  end
end
