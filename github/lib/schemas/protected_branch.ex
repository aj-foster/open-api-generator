defmodule GitHub.ProtectedBranch do
  @moduledoc """
  Provides struct and type for a ProtectedBranch
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          allow_deletions: GitHub.ProtectedBranch.AllowDeletions.t() | nil,
          allow_force_pushes: GitHub.ProtectedBranch.AllowForcePushes.t() | nil,
          allow_fork_syncing: GitHub.ProtectedBranch.AllowForkSyncing.t() | nil,
          block_creations: GitHub.ProtectedBranch.BlockCreations.t() | nil,
          enforce_admins: GitHub.ProtectedBranch.EnforceAdmins.t() | nil,
          lock_branch: GitHub.ProtectedBranch.LockBranch.t() | nil,
          required_conversation_resolution:
            GitHub.ProtectedBranch.RequiredConversationResolution.t() | nil,
          required_linear_history: GitHub.ProtectedBranch.RequiredLinearHistory.t() | nil,
          required_pull_request_reviews:
            GitHub.ProtectedBranch.RequiredPullRequestReviews.t() | nil,
          required_signatures: GitHub.ProtectedBranch.RequiredSignatures.t() | nil,
          required_status_checks: GitHub.StatusCheckPolicy.t() | nil,
          restrictions: GitHub.Branch.RestrictionPolicy.t() | nil,
          url: String.t()
        }

  defstruct [
    :__info__,
    :allow_deletions,
    :allow_force_pushes,
    :allow_fork_syncing,
    :block_creations,
    :enforce_admins,
    :lock_branch,
    :required_conversation_resolution,
    :required_linear_history,
    :required_pull_request_reviews,
    :required_signatures,
    :required_status_checks,
    :restrictions,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      allow_deletions: {GitHub.ProtectedBranch.AllowDeletions, :t},
      allow_force_pushes: {GitHub.ProtectedBranch.AllowForcePushes, :t},
      allow_fork_syncing: {GitHub.ProtectedBranch.AllowForkSyncing, :t},
      block_creations: {GitHub.ProtectedBranch.BlockCreations, :t},
      enforce_admins: {GitHub.ProtectedBranch.EnforceAdmins, :t},
      lock_branch: {GitHub.ProtectedBranch.LockBranch, :t},
      required_conversation_resolution:
        {GitHub.ProtectedBranch.RequiredConversationResolution, :t},
      required_linear_history: {GitHub.ProtectedBranch.RequiredLinearHistory, :t},
      required_pull_request_reviews: {GitHub.ProtectedBranch.RequiredPullRequestReviews, :t},
      required_signatures: {GitHub.ProtectedBranch.RequiredSignatures, :t},
      required_status_checks: {GitHub.StatusCheckPolicy, :t},
      restrictions: {GitHub.Branch.RestrictionPolicy, :t},
      url: {:string, :uri}
    ]
  end
end
