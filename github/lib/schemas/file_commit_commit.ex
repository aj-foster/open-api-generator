defmodule GitHub.FileCommitCommit do
  @moduledoc """
  Provides struct and type for a FileCommitCommit
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          author: GitHub.FileCommitCommitAuthor.t() | nil,
          committer: GitHub.FileCommitCommitCommitter.t() | nil,
          html_url: String.t() | nil,
          message: String.t() | nil,
          node_id: String.t() | nil,
          parents: [GitHub.FileCommitCommitParents.t()] | nil,
          sha: String.t() | nil,
          tree: GitHub.FileCommitCommitTree.t() | nil,
          url: String.t() | nil,
          verification: GitHub.FileCommitCommitVerification.t() | nil
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
      author: {GitHub.FileCommitCommitAuthor, :t},
      committer: {GitHub.FileCommitCommitCommitter, :t},
      html_url: {:string, :generic},
      message: {:string, :generic},
      node_id: {:string, :generic},
      parents: [{GitHub.FileCommitCommitParents, :t}],
      sha: {:string, :generic},
      tree: {GitHub.FileCommitCommitTree, :t},
      url: {:string, :generic},
      verification: {GitHub.FileCommitCommitVerification, :t}
    ]
  end
end
