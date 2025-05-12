defmodule GitHub.Git.Commit do
  @moduledoc """
  Provides struct and type for a Git.Commit
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          author: GitHub.Git.CommitAuthor.t(),
          committer: GitHub.Git.CommitCommitter.t(),
          html_url: String.t(),
          message: String.t(),
          node_id: String.t(),
          parents: [GitHub.Git.CommitParents.t()],
          sha: String.t(),
          tree: GitHub.Git.CommitTree.t(),
          url: String.t(),
          verification: GitHub.Git.CommitVerification.t()
        }

  defstruct [
    :__info__,
    :author,
    :committer,
    :html_url,
    :message,
    :node_id,
    :parents,
    :sha,
    :tree,
    :url,
    :verification
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      author: {GitHub.Git.CommitAuthor, :t},
      committer: {GitHub.Git.CommitCommitter, :t},
      html_url: {:string, :uri},
      message: {:string, :generic},
      node_id: {:string, :generic},
      parents: [{GitHub.Git.CommitParents, :t}],
      sha: {:string, :generic},
      tree: {GitHub.Git.CommitTree, :t},
      url: {:string, :uri},
      verification: {GitHub.Git.CommitVerification, :t}
    ]
  end
end
