defmodule GitHub.Timeline.LineCommentedEvent do
  @moduledoc """
  Provides struct and type for a Timeline.LineCommentedEvent
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          comments: [GitHub.PullRequest.ReviewComment.t()] | nil,
          event: String.t() | nil,
          node_id: String.t() | nil
        }

  defstruct [:__info__, :comments, :event, :node_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      comments: [{GitHub.PullRequest.ReviewComment, :t}],
      event: {:string, :generic},
      node_id: {:string, :generic}
    ]
  end
end
