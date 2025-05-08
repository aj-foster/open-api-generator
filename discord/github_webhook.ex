defmodule GithubWebhook do
  @moduledoc """
  Provides struct and type for a GithubWebhook
  """

  @type t :: %__MODULE__{
          action: String.t() | nil,
          answer: GithubComment.t() | nil,
          check_run: GithubCheckRun.t() | nil,
          check_suite: GithubCheckSuite.t() | nil,
          comment: GithubComment.t() | nil,
          commits: [GithubCommit.t()] | nil,
          compare: String.t() | nil,
          discussion: GithubDiscussion.t() | nil,
          forced: boolean | nil,
          forkee: GithubRepository.t() | nil,
          head_commit: GithubCommit.t() | nil,
          issue: GithubIssue.t() | nil,
          member: GithubUser.t() | nil,
          pull_request: GithubIssue.t() | nil,
          ref: String.t() | nil,
          ref_type: String.t() | nil,
          release: GithubRelease.t() | nil,
          repository: GithubRepository.t() | nil,
          review: GithubReview.t() | nil,
          sender: GithubUser.t()
        }

  defstruct [
    :action,
    :answer,
    :check_run,
    :check_suite,
    :comment,
    :commits,
    :compare,
    :discussion,
    :forced,
    :forkee,
    :head_commit,
    :issue,
    :member,
    :pull_request,
    :ref,
    :ref_type,
    :release,
    :repository,
    :review,
    :sender
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      action: {:union, [{:string, :generic}, :null]},
      answer: {:union, [{GithubComment, :t}, :null]},
      check_run: {:union, [{GithubCheckRun, :t}, :null]},
      check_suite: {:union, [{GithubCheckSuite, :t}, :null]},
      comment: {:union, [{GithubComment, :t}, :null]},
      commits: {:union, [[{GithubCommit, :t}], :null]},
      compare: {:union, [{:string, :uri}, :null]},
      discussion: {:union, [{GithubDiscussion, :t}, :null]},
      forced: {:union, [:boolean, :null]},
      forkee: {:union, [{GithubRepository, :t}, :null]},
      head_commit: {:union, [{GithubCommit, :t}, :null]},
      issue: {:union, [{GithubIssue, :t}, :null]},
      member: {:union, [{GithubUser, :t}, :null]},
      pull_request: {:union, [{GithubIssue, :t}, :null]},
      ref: {:union, [{:string, :generic}, :null]},
      ref_type: {:union, [{:string, :generic}, :null]},
      release: {:union, [{GithubRelease, :t}, :null]},
      repository: {:union, [{GithubRepository, :t}, :null]},
      review: {:union, [{GithubReview, :t}, :null]},
      sender: {GithubUser, :t}
    ]
  end
end
