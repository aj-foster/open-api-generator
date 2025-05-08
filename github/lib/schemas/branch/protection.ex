defmodule GitHub.Branch.Protection do
  @moduledoc """
  Provides struct and type for a Branch.Protection
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          allow_deletions: GitHub.Branch.ProtectionAllowDeletions.t() | nil,
          allow_force_pushes: GitHub.Branch.ProtectionAllowForcePushes.t() | nil,
          allow_fork_syncing: GitHub.Branch.ProtectionAllowForkSyncing.t() | nil,
          block_creations: GitHub.Branch.ProtectionBlockCreations.t() | nil,
          enabled: boolean | nil,
          enforce_admins: GitHub.ProtectedBranch.AdminEnforced.t() | nil,
          lock_branch: GitHub.Branch.ProtectionLockBranch.t() | nil,
          name: String.t() | nil,
          protection_url: String.t() | nil,
          required_conversation_resolution:
            GitHub.Branch.ProtectionRequiredConversationResolution.t() | nil,
          required_linear_history: GitHub.Branch.ProtectionRequiredLinearHistory.t() | nil,
          required_pull_request_reviews: GitHub.ProtectedBranch.PullRequestReview.t() | nil,
          required_signatures: GitHub.Branch.ProtectionRequiredSignatures.t() | nil,
          required_status_checks: GitHub.ProtectedBranch.RequiredStatusCheck.t() | nil,
          restrictions: GitHub.Branch.RestrictionPolicy.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :__info__,
    :allow_deletions,
    :allow_force_pushes,
    :allow_fork_syncing,
    :block_creations,
    :enabled,
    :enforce_admins,
    :lock_branch,
    :name,
    :protection_url,
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
      allow_deletions: {GitHub.Branch.ProtectionAllowDeletions, :t},
      allow_force_pushes: {GitHub.Branch.ProtectionAllowForcePushes, :t},
      allow_fork_syncing: {GitHub.Branch.ProtectionAllowForkSyncing, :t},
      block_creations: {GitHub.Branch.ProtectionBlockCreations, :t},
      enabled: :boolean,
      enforce_admins: {GitHub.ProtectedBranch.AdminEnforced, :t},
      lock_branch: {GitHub.Branch.ProtectionLockBranch, :t},
      name: {:string, :generic},
      protection_url: {:string, :generic},
      required_conversation_resolution:
        {GitHub.Branch.ProtectionRequiredConversationResolution, :t},
      required_linear_history: {GitHub.Branch.ProtectionRequiredLinearHistory, :t},
      required_pull_request_reviews: {GitHub.ProtectedBranch.PullRequestReview, :t},
      required_signatures: {GitHub.Branch.ProtectionRequiredSignatures, :t},
      required_status_checks: {GitHub.ProtectedBranch.RequiredStatusCheck, :t},
      restrictions: {GitHub.Branch.RestrictionPolicy, :t},
      url: {:string, :generic}
    ]
  end
end
