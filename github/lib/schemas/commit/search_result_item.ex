defmodule GitHub.Commit.SearchResultItem do
  @moduledoc """
  Provides struct and type for a Commit.SearchResultItem
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          author: GitHub.User.simple() | nil,
          comments_url: String.t(),
          commit: GitHub.Commit.SearchResultItemCommit.t(),
          committer: GitHub.Git.User.t() | nil,
          html_url: String.t(),
          node_id: String.t(),
          parents: [GitHub.Commit.SearchResultItemParents.t()],
          repository: GitHub.Repository.minimal(),
          score: number,
          sha: String.t(),
          text_matches: [GitHub.SearchResultTextMatches.t()] | nil,
          url: String.t()
        }

  defstruct [
    :__info__,
    :author,
    :comments_url,
    :commit,
    :committer,
    :html_url,
    :node_id,
    :parents,
    :repository,
    :score,
    :sha,
    :text_matches,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      author: {:union, [{GitHub.User, :simple}, :null]},
      comments_url: {:string, :uri},
      commit: {GitHub.Commit.SearchResultItemCommit, :t},
      committer: {:union, [{GitHub.Git.User, :t}, :null]},
      html_url: {:string, :uri},
      node_id: {:string, :generic},
      parents: [{GitHub.Commit.SearchResultItemParents, :t}],
      repository: {GitHub.Repository, :minimal},
      score: :number,
      sha: {:string, :generic},
      text_matches: [{GitHub.SearchResultTextMatches, :t}],
      url: {:string, :uri}
    ]
  end
end
