defmodule GitHub.BaseGist do
  @moduledoc """
  Provides struct and type for a BaseGist
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          comments: integer,
          comments_url: String.t(),
          commits_url: String.t(),
          created_at: DateTime.t(),
          description: String.t() | nil,
          files: map,
          forks: [map] | nil,
          forks_url: String.t(),
          git_pull_url: String.t(),
          git_push_url: String.t(),
          history: [map] | nil,
          html_url: String.t(),
          id: String.t(),
          node_id: String.t(),
          owner: GitHub.User.simple() | nil,
          public: boolean,
          truncated: boolean | nil,
          updated_at: DateTime.t(),
          url: String.t(),
          user: GitHub.User.simple() | nil
        }

  defstruct [
    :__info__,
    :comments,
    :comments_url,
    :commits_url,
    :created_at,
    :description,
    :files,
    :forks,
    :forks_url,
    :git_pull_url,
    :git_push_url,
    :history,
    :html_url,
    :id,
    :node_id,
    :owner,
    :public,
    :truncated,
    :updated_at,
    :url,
    :user
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      comments: :integer,
      comments_url: {:string, :uri},
      commits_url: {:string, :uri},
      created_at: {:string, :date_time},
      description: {:union, [{:string, :generic}, :null]},
      files: :map,
      forks: [:map],
      forks_url: {:string, :uri},
      git_pull_url: {:string, :uri},
      git_push_url: {:string, :uri},
      history: [:map],
      html_url: {:string, :uri},
      id: {:string, :generic},
      node_id: {:string, :generic},
      owner: {GitHub.User, :simple},
      public: :boolean,
      truncated: :boolean,
      updated_at: {:string, :date_time},
      url: {:string, :uri},
      user: {:union, [{GitHub.User, :simple}, :null]}
    ]
  end
end
