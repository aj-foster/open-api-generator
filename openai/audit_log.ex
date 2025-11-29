defmodule AuditLog do
  @moduledoc """
  Provides struct and type for a AuditLog
  """

  @type t :: %__MODULE__{
          actor: AuditLogActor.t(),
          "api_key.created": AuditLogApiKeyCreated.t() | nil,
          "api_key.deleted": AuditLogApiKeyDeleted.t() | nil,
          "api_key.updated": AuditLogApiKeyUpdated.t() | nil,
          effective_at: integer,
          id: String.t(),
          "invite.accepted": AuditLogInviteAccepted.t() | nil,
          "invite.deleted": AuditLogInviteDeleted.t() | nil,
          "invite.sent": AuditLogInviteSent.t() | nil,
          "login.failed": AuditLogLoginFailed.t() | nil,
          "logout.failed": AuditLogLogoutFailed.t() | nil,
          "organization.updated": AuditLogOrganizationUpdated.t() | nil,
          project: AuditLogProject.t() | nil,
          "project.archived": AuditLogProjectArchived.t() | nil,
          "project.created": AuditLogProjectCreated.t() | nil,
          "project.updated": AuditLogProjectUpdated.t() | nil,
          "rate_limit.deleted": AuditLogRateLimitDeleted.t() | nil,
          "rate_limit.updated": AuditLogRateLimitUpdated.t() | nil,
          "service_account.created": AuditLogServiceAccountCreated.t() | nil,
          "service_account.deleted": AuditLogServiceAccountDeleted.t() | nil,
          "service_account.updated": AuditLogServiceAccountUpdated.t() | nil,
          type: String.t(),
          "user.added": AuditLogUserAdded.t() | nil,
          "user.deleted": AuditLogUserDeleted.t() | nil,
          "user.updated": AuditLogUserUpdated.t() | nil
        }

  defstruct [
    :actor,
    :"api_key.created",
    :"api_key.deleted",
    :"api_key.updated",
    :effective_at,
    :id,
    :"invite.accepted",
    :"invite.deleted",
    :"invite.sent",
    :"login.failed",
    :"logout.failed",
    :"organization.updated",
    :project,
    :"project.archived",
    :"project.created",
    :"project.updated",
    :"rate_limit.deleted",
    :"rate_limit.updated",
    :"service_account.created",
    :"service_account.deleted",
    :"service_account.updated",
    :type,
    :"user.added",
    :"user.deleted",
    :"user.updated"
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actor: {AuditLogActor, :t},
      "api_key.created": {AuditLogApiKeyCreated, :t},
      "api_key.deleted": {AuditLogApiKeyDeleted, :t},
      "api_key.updated": {AuditLogApiKeyUpdated, :t},
      effective_at: :integer,
      id: {:string, :generic},
      "invite.accepted": {AuditLogInviteAccepted, :t},
      "invite.deleted": {AuditLogInviteDeleted, :t},
      "invite.sent": {AuditLogInviteSent, :t},
      "login.failed": {AuditLogLoginFailed, :t},
      "logout.failed": {AuditLogLogoutFailed, :t},
      "organization.updated": {AuditLogOrganizationUpdated, :t},
      project: {AuditLogProject, :t},
      "project.archived": {AuditLogProjectArchived, :t},
      "project.created": {AuditLogProjectCreated, :t},
      "project.updated": {AuditLogProjectUpdated, :t},
      "rate_limit.deleted": {AuditLogRateLimitDeleted, :t},
      "rate_limit.updated": {AuditLogRateLimitUpdated, :t},
      "service_account.created": {AuditLogServiceAccountCreated, :t},
      "service_account.deleted": {AuditLogServiceAccountDeleted, :t},
      "service_account.updated": {AuditLogServiceAccountUpdated, :t},
      type:
        {:enum,
         [
           "api_key.created",
           "api_key.updated",
           "api_key.deleted",
           "invite.sent",
           "invite.accepted",
           "invite.deleted",
           "login.succeeded",
           "login.failed",
           "logout.succeeded",
           "logout.failed",
           "organization.updated",
           "project.created",
           "project.updated",
           "project.archived",
           "service_account.created",
           "service_account.updated",
           "service_account.deleted",
           "rate_limit.updated",
           "rate_limit.deleted",
           "user.added",
           "user.updated",
           "user.deleted"
         ]},
      "user.added": {AuditLogUserAdded, :t},
      "user.deleted": {AuditLogUserDeleted, :t},
      "user.updated": {AuditLogUserUpdated, :t}
    ]
  end
end
