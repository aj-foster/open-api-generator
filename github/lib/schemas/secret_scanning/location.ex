defmodule GitHub.SecretScanning.Location do
  @moduledoc """
  Provides struct and type for a SecretScanning.Location
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          details:
            GitHub.SecretScanning.LocationCommit.t()
            | GitHub.SecretScanning.LocationDiscussionBody.t()
            | GitHub.SecretScanning.LocationDiscussionComment.t()
            | GitHub.SecretScanning.LocationDiscussionTitle.t()
            | GitHub.SecretScanning.LocationIssueBody.t()
            | GitHub.SecretScanning.LocationIssueComment.t()
            | GitHub.SecretScanning.LocationIssueTitle.t()
            | GitHub.SecretScanning.LocationPullRequestBody.t()
            | GitHub.SecretScanning.LocationPullRequestComment.t()
            | GitHub.SecretScanning.LocationPullRequestReview.t()
            | GitHub.SecretScanning.LocationPullRequestReviewComment.t()
            | GitHub.SecretScanning.LocationPullRequestTitle.t()
            | GitHub.SecretScanning.LocationWikiCommit.t()
            | nil,
          type: String.t() | nil
        }

  defstruct [:__info__, :details, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      details:
        {:union,
         [
           {GitHub.SecretScanning.LocationCommit, :t},
           {GitHub.SecretScanning.LocationDiscussionBody, :t},
           {GitHub.SecretScanning.LocationDiscussionComment, :t},
           {GitHub.SecretScanning.LocationDiscussionTitle, :t},
           {GitHub.SecretScanning.LocationIssueBody, :t},
           {GitHub.SecretScanning.LocationIssueComment, :t},
           {GitHub.SecretScanning.LocationIssueTitle, :t},
           {GitHub.SecretScanning.LocationPullRequestBody, :t},
           {GitHub.SecretScanning.LocationPullRequestComment, :t},
           {GitHub.SecretScanning.LocationPullRequestReview, :t},
           {GitHub.SecretScanning.LocationPullRequestReviewComment, :t},
           {GitHub.SecretScanning.LocationPullRequestTitle, :t},
           {GitHub.SecretScanning.LocationWikiCommit, :t}
         ]},
      type:
        {:enum,
         [
           "commit",
           "wiki_commit",
           "issue_title",
           "issue_body",
           "issue_comment",
           "discussion_title",
           "discussion_body",
           "discussion_comment",
           "pull_request_title",
           "pull_request_body",
           "pull_request_comment",
           "pull_request_review",
           "pull_request_review_comment"
         ]}
    ]
  end
end
