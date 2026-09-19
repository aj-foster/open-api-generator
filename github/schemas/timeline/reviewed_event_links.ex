defmodule GitHub.Timeline.ReviewedEventLinks do
  @moduledoc """
  Provides struct and type for a Timeline.ReviewedEventLinks
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          html: GitHub.Timeline.ReviewedEventLinksHtml.t(),
          pull_request: GitHub.Timeline.ReviewedEventLinksPullRequest.t()
        }

  defstruct [:__info__, :html, :pull_request]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      html: {GitHub.Timeline.ReviewedEventLinksHtml, :t},
      pull_request: {GitHub.Timeline.ReviewedEventLinksPullRequest, :t}
    ]
  end
end
