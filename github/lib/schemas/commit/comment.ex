defmodule GitHub.Commit.Comment do
  @moduledoc """
  Provides struct and type for a Commit.Comment
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          author_association: String.t(),
          body: String.t(),
          commit_id: String.t(),
          created_at: DateTime.t(),
          html_url: String.t(),
          id: integer,
          line: integer | nil,
          node_id: String.t(),
          path: String.t() | nil,
          position: integer | nil,
          reactions: GitHub.Reaction.Rollup.t() | nil,
          updated_at: DateTime.t(),
          url: String.t(),
          user: GitHub.User.simple() | nil
        }

  defstruct [
    :__info__,
    :author_association,
    :body,
    :commit_id,
    :created_at,
    :html_url,
    :id,
    :line,
    :node_id,
    :path,
    :position,
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
      commit_id: {:string, :generic},
      created_at: {:string, :date_time},
      html_url: {:string, :uri},
      id: :integer,
      line: {:union, [:integer, :null]},
      node_id: {:string, :generic},
      path: {:union, [{:string, :generic}, :null]},
      position: {:union, [:integer, :null]},
      reactions: {GitHub.Reaction.Rollup, :t},
      updated_at: {:string, :date_time},
      url: {:string, :uri},
      user: {:union, [{GitHub.User, :simple}, :null]}
    ]
  end
end
