defmodule GitHub.PullRequest.ReviewLinks do
  @moduledoc """
  Provides struct and type for a PullRequest.ReviewLinks
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          html: GitHub.PullRequest.ReviewLinksHtml.t(),
          pull_request: GitHub.PullRequest.ReviewLinksPullRequest.t()
        }

  defstruct [:__info__, :html, :pull_request]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      html: {GitHub.PullRequest.ReviewLinksHtml, :t},
      pull_request: {GitHub.PullRequest.ReviewLinksPullRequest, :t}
    ]
  end
end
