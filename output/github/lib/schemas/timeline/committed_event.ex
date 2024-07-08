defmodule GitHub.Timeline.CommittedEvent do
  @moduledoc """
  Provides struct and type for a Timeline.CommittedEvent
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          author: GitHub.Timeline.CommittedEventAuthor.t(),
          committer: GitHub.Timeline.CommittedEventCommitter.t(),
          event: String.t() | nil,
          html_url: String.t(),
          message: String.t(),
          node_id: String.t(),
          parents: [GitHub.Timeline.CommittedEventParents.t()],
          sha: String.t(),
          tree: GitHub.Timeline.CommittedEventTree.t(),
          url: String.t(),
          verification: GitHub.Timeline.CommittedEventVerification.t()
        }

  defstruct [
    :__info__,
    :author,
    :committer,
    :event,
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
      author: {GitHub.Timeline.CommittedEventAuthor, :t},
      committer: {GitHub.Timeline.CommittedEventCommitter, :t},
      event: {:string, :generic},
      html_url: {:string, :uri},
      message: {:string, :generic},
      node_id: {:string, :generic},
      parents: [{GitHub.Timeline.CommittedEventParents, :t}],
      sha: {:string, :generic},
      tree: {GitHub.Timeline.CommittedEventTree, :t},
      url: {:string, :uri},
      verification: {GitHub.Timeline.CommittedEventVerification, :t}
    ]
  end
end
