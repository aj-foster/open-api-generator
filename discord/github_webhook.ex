defmodule Discord.GithubWebhook do
  @moduledoc """
  Provides struct and type for a GithubWebhook
  """

  @type t :: %__MODULE__{
          action: String.t() | nil,
          answer: Discord.GithubComment.t() | nil,
          check_run: Discord.GithubCheckRun.t() | nil,
          check_suite: Discord.GithubCheckSuite.t() | nil,
          comment: Discord.GithubComment.t() | nil,
          commits: [Discord.GithubCommit.t()] | nil,
          compare: String.t() | nil,
          discussion: Discord.GithubDiscussion.t() | nil,
          forced: boolean | nil,
          forkee: Discord.GithubRepository.t() | nil,
          head_commit: Discord.GithubCommit.t() | nil,
          issue: Discord.GithubIssue.t() | nil,
          member: Discord.GithubUser.t() | nil,
          pull_request: Discord.GithubIssue.t() | nil,
          ref: String.t() | nil,
          ref_type: String.t() | nil,
          release: Discord.GithubRelease.t() | nil,
          repository: Discord.GithubRepository.t() | nil,
          review: Discord.GithubReview.t() | nil,
          sender: Discord.GithubUser.t()
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
      action: {:union, [:string, :null]},
      answer: {:union, [{Discord.GithubComment, :t}, :null]},
      check_run: {:union, [{Discord.GithubCheckRun, :t}, :null]},
      check_suite: {:union, [{Discord.GithubCheckSuite, :t}, :null]},
      comment: {:union, [{Discord.GithubComment, :t}, :null]},
      commits: {:union, [[{Discord.GithubCommit, :t}], :null]},
      compare: {:union, [{:string, "uri"}, :null]},
      discussion: {:union, [{Discord.GithubDiscussion, :t}, :null]},
      forced: {:union, [:boolean, :null]},
      forkee: {:union, [{Discord.GithubRepository, :t}, :null]},
      head_commit: {:union, [{Discord.GithubCommit, :t}, :null]},
      issue: {:union, [{Discord.GithubIssue, :t}, :null]},
      member: {:union, [{Discord.GithubUser, :t}, :null]},
      pull_request: {:union, [{Discord.GithubIssue, :t}, :null]},
      ref: {:union, [:string, :null]},
      ref_type: {:union, [:string, :null]},
      release: {:union, [{Discord.GithubRelease, :t}, :null]},
      repository: {:union, [{Discord.GithubRepository, :t}, :null]},
      review: {:union, [{Discord.GithubReview, :t}, :null]},
      sender: {Discord.GithubUser, :t}
    ]
  end
end
