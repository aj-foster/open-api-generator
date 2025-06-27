defmodule GitHub.Timeline.CommitCommentedEvent do
  @moduledoc """
  Provides struct and type for a Timeline.CommitCommentedEvent
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          comments: [GitHub.Commit.Comment.t()] | nil,
          commit_id: String.t() | nil,
          event: String.t() | nil,
          node_id: String.t() | nil
        }

  defstruct [:__info__, :comments, :commit_id, :event, :node_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      comments: [{GitHub.Commit.Comment, :t}],
      commit_id: {:string, :generic},
      event: {:string, :generic},
      node_id: {:string, :generic}
    ]
  end
end
