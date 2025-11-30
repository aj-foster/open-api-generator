defmodule GitHub.Team.Discussion do
  @moduledoc """
  Provides struct and type for a Team.Discussion
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          author: GitHub.User.simple() | nil,
          body: String.t(),
          body_html: String.t(),
          body_version: String.t(),
          comments_count: integer,
          comments_url: String.t(),
          created_at: DateTime.t(),
          html_url: String.t(),
          last_edited_at: DateTime.t() | nil,
          node_id: String.t(),
          number: integer,
          pinned: boolean,
          private: boolean,
          reactions: GitHub.Reaction.Rollup.t() | nil,
          team_url: String.t(),
          title: String.t(),
          updated_at: DateTime.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :author,
    :body,
    :body_html,
    :body_version,
    :comments_count,
    :comments_url,
    :created_at,
    :html_url,
    :last_edited_at,
    :node_id,
    :number,
    :pinned,
    :private,
    :reactions,
    :team_url,
    :title,
    :updated_at,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      author: {:union, [{GitHub.User, :simple}, :null]},
      body: {:string, :generic},
      body_html: {:string, :generic},
      body_version: {:string, :generic},
      comments_count: :integer,
      comments_url: {:string, :uri},
      created_at: {:string, :date_time},
      html_url: {:string, :uri},
      last_edited_at: {:union, [{:string, :date_time}, :null]},
      node_id: {:string, :generic},
      number: :integer,
      pinned: :boolean,
      private: :boolean,
      reactions: {GitHub.Reaction.Rollup, :t},
      team_url: {:string, :uri},
      title: {:string, :generic},
      updated_at: {:string, :date_time},
      url: {:string, :uri}
    ]
  end
end
