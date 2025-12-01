defmodule OpenAI.AuditLog do
  @moduledoc """
  Provides struct and type for a AuditLog
  """

  @type t :: %__MODULE__{
          actor: OpenAI.AuditLogActor.t(),
          "api_key.created": OpenAI.AuditLogApiKeyCreated.t() | nil,
          "api_key.deleted": OpenAI.AuditLogApiKeyDeleted.t() | nil,
          "api_key.updated": OpenAI.AuditLogApiKeyUpdated.t() | nil,
          effective_at: integer,
          id: String.t(),
          "invite.accepted": OpenAI.AuditLogInviteAccepted.t() | nil,
          "invite.deleted": OpenAI.AuditLogInviteDeleted.t() | nil,
          "invite.sent": OpenAI.AuditLogInviteSent.t() | nil,
          "login.failed": OpenAI.AuditLogLoginFailed.t() | nil,
          "logout.failed": OpenAI.AuditLogLogoutFailed.t() | nil,
          "organization.updated": OpenAI.AuditLogOrganizationUpdated.t() | nil,
          project: OpenAI.AuditLogProject.t() | nil,
          "project.archived": OpenAI.AuditLogProjectArchived.t() | nil,
          "project.created": OpenAI.AuditLogProjectCreated.t() | nil,
          "project.updated": OpenAI.AuditLogProjectUpdated.t() | nil,
          "rate_limit.deleted": OpenAI.AuditLogRateLimitDeleted.t() | nil,
          "rate_limit.updated": OpenAI.AuditLogRateLimitUpdated.t() | nil,
          "service_account.created": OpenAI.AuditLogServiceAccountCreated.t() | nil,
          "service_account.deleted": OpenAI.AuditLogServiceAccountDeleted.t() | nil,
          "service_account.updated": OpenAI.AuditLogServiceAccountUpdated.t() | nil,
          type: String.t(),
          "user.added": OpenAI.AuditLogUserAdded.t() | nil,
          "user.deleted": OpenAI.AuditLogUserDeleted.t() | nil,
          "user.updated": OpenAI.AuditLogUserUpdated.t() | nil
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
      actor: {OpenAI.AuditLogActor, :t},
      "api_key.created": {OpenAI.AuditLogApiKeyCreated, :t},
      "api_key.deleted": {OpenAI.AuditLogApiKeyDeleted, :t},
      "api_key.updated": {OpenAI.AuditLogApiKeyUpdated, :t},
      effective_at: :integer,
      id: :string,
      "invite.accepted": {OpenAI.AuditLogInviteAccepted, :t},
      "invite.deleted": {OpenAI.AuditLogInviteDeleted, :t},
      "invite.sent": {OpenAI.AuditLogInviteSent, :t},
      "login.failed": {OpenAI.AuditLogLoginFailed, :t},
      "logout.failed": {OpenAI.AuditLogLogoutFailed, :t},
      "organization.updated": {OpenAI.AuditLogOrganizationUpdated, :t},
      project: {OpenAI.AuditLogProject, :t},
      "project.archived": {OpenAI.AuditLogProjectArchived, :t},
      "project.created": {OpenAI.AuditLogProjectCreated, :t},
      "project.updated": {OpenAI.AuditLogProjectUpdated, :t},
      "rate_limit.deleted": {OpenAI.AuditLogRateLimitDeleted, :t},
      "rate_limit.updated": {OpenAI.AuditLogRateLimitUpdated, :t},
      "service_account.created": {OpenAI.AuditLogServiceAccountCreated, :t},
      "service_account.deleted": {OpenAI.AuditLogServiceAccountDeleted, :t},
      "service_account.updated": {OpenAI.AuditLogServiceAccountUpdated, :t},
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
      "user.added": {OpenAI.AuditLogUserAdded, :t},
      "user.deleted": {OpenAI.AuditLogUserDeleted, :t},
      "user.updated": {OpenAI.AuditLogUserUpdated, :t}
    ]
  end
end
