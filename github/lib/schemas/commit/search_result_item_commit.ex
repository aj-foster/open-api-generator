defmodule GitHub.Commit.SearchResultItemCommit do
  @moduledoc """
  Provides struct and type for a Commit.SearchResultItemCommit
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          author: GitHub.Commit.SearchResultItemCommitAuthor.t(),
          comment_count: integer,
          committer: GitHub.Git.User.t() | nil,
          message: String.t(),
          tree: GitHub.Commit.SearchResultItemCommitTree.t(),
          url: String.t(),
          verification: GitHub.Verification.t() | nil
        }

  defstruct [:__info__, :author, :comment_count, :committer, :message, :tree, :url, :verification]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      author: {GitHub.Commit.SearchResultItemCommitAuthor, :t},
      comment_count: :integer,
      committer: {:union, [{GitHub.Git.User, :t}, :null]},
      message: {:string, :generic},
      tree: {GitHub.Commit.SearchResultItemCommitTree, :t},
      url: {:string, :uri},
      verification: {GitHub.Verification, :t}
    ]
  end
end
