defmodule GitHub.Issue.Event.ConvertedNoteToIssue do
  @moduledoc """
  Provides struct and type for a Issue.Event.ConvertedNoteToIssue
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          actor: GitHub.User.simple(),
          commit_id: String.t() | nil,
          commit_url: String.t() | nil,
          created_at: String.t(),
          event: String.t(),
          id: integer,
          node_id: String.t(),
          performed_via_github_app: GitHub.App.t() | nil,
          project_card: GitHub.Issue.Event.ConvertedNoteToIssueProjectCard.t() | nil,
          url: String.t()
        }

  defstruct [
    :__info__,
    :actor,
    :commit_id,
    :commit_url,
    :created_at,
    :event,
    :id,
    :node_id,
    :performed_via_github_app,
    :project_card,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actor: {GitHub.User, :simple},
      commit_id: {:union, [{:string, :generic}, :null]},
      commit_url: {:union, [{:string, :generic}, :null]},
      created_at: {:string, :generic},
      event: {:string, :generic},
      id: :integer,
      node_id: {:string, :generic},
      performed_via_github_app: {:union, [{GitHub.App, :t}, :null]},
      project_card: {GitHub.Issue.Event.ConvertedNoteToIssueProjectCard, :t},
      url: {:string, :generic}
    ]
  end
end
