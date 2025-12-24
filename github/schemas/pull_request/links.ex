defmodule GitHub.PullRequest.Links do
  @moduledoc """
  Provides struct and types for a PullRequest.Links
  """
  use GitHub.Encoder

  @type simple :: %__MODULE__{
          __info__: map,
          comments: GitHub.Link.t(),
          commits: GitHub.Link.t(),
          html: GitHub.Link.t(),
          issue: GitHub.Link.t(),
          review_comment: GitHub.Link.t(),
          review_comments: GitHub.Link.t(),
          self: GitHub.Link.t(),
          statuses: GitHub.Link.t()
        }

  @type t :: %__MODULE__{
          __info__: map,
          comments: GitHub.Link.t(),
          commits: GitHub.Link.t(),
          html: GitHub.Link.t(),
          issue: GitHub.Link.t(),
          review_comment: GitHub.Link.t(),
          review_comments: GitHub.Link.t(),
          self: GitHub.Link.t(),
          statuses: GitHub.Link.t()
        }

  defstruct [
    :__info__,
    :comments,
    :commits,
    :html,
    :issue,
    :review_comment,
    :review_comments,
    :self,
    :statuses
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:simple) do
    [
      comments: {GitHub.Link, :t},
      commits: {GitHub.Link, :t},
      html: {GitHub.Link, :t},
      issue: {GitHub.Link, :t},
      review_comment: {GitHub.Link, :t},
      review_comments: {GitHub.Link, :t},
      self: {GitHub.Link, :t},
      statuses: {GitHub.Link, :t}
    ]
  end

  def __fields__(:t) do
    [
      comments: {GitHub.Link, :t},
      commits: {GitHub.Link, :t},
      html: {GitHub.Link, :t},
      issue: {GitHub.Link, :t},
      review_comment: {GitHub.Link, :t},
      review_comments: {GitHub.Link, :t},
      self: {GitHub.Link, :t},
      statuses: {GitHub.Link, :t}
    ]
  end
end
