defmodule GitHub.PullRequest.ReviewCommentLinks do
  @moduledoc """
  Provides struct and type for a PullRequest.ReviewCommentLinks
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          html: GitHub.PullRequest.ReviewCommentLinksHtml.t(),
          pull_request: GitHub.PullRequest.ReviewCommentLinksPullRequest.t(),
          self: GitHub.PullRequest.ReviewCommentLinksSelf.t()
        }

  defstruct [:__info__, :html, :pull_request, :self]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      html: {GitHub.PullRequest.ReviewCommentLinksHtml, :t},
      pull_request: {GitHub.PullRequest.ReviewCommentLinksPullRequest, :t},
      self: {GitHub.PullRequest.ReviewCommentLinksSelf, :t}
    ]
  end
end
