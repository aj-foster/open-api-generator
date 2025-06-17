defmodule GitHub.Team.DiscussionComment do
  @moduledoc """
  Provides struct and type for a Team.DiscussionComment
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          author: GitHub.User.simple() | nil,
          body: String.t(),
          body_html: String.t(),
          body_version: String.t(),
          created_at: DateTime.t(),
          discussion_url: String.t(),
          html_url: String.t(),
          last_edited_at: DateTime.t() | nil,
          node_id: String.t(),
          number: integer,
          reactions: GitHub.Reaction.Rollup.t() | nil,
          updated_at: DateTime.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :author,
    :body,
    :body_html,
    :body_version,
    :created_at,
    :discussion_url,
    :html_url,
    :last_edited_at,
    :node_id,
    :number,
    :reactions,
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
      created_at: {:string, :date_time},
      discussion_url: {:string, :uri},
      html_url: {:string, :uri},
      last_edited_at: {:union, [{:string, :date_time}, :null]},
      node_id: {:string, :generic},
      number: :integer,
      reactions: {GitHub.Reaction.Rollup, :t},
      updated_at: {:string, :date_time},
      url: {:string, :uri}
    ]
  end
end
