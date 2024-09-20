defmodule GuildAuditLogResponse do
  @moduledoc """
  Provides struct and type for a GuildAuditLogResponse
  """

  @type t :: %__MODULE__{
          application_commands: [ApplicationCommandResponse.t()],
          audit_log_entries: [AuditLogEntryResponse.t()],
          auto_moderation_rules: [
            DefaultKeywordRuleResponse.t()
            | KeywordRuleResponse.t()
            | MLSpamRuleResponse.t()
            | MentionSpamRuleResponse.t()
            | SpamLinkRuleResponse.t()
            | nil
          ],
          guild_scheduled_events: [
            ExternalScheduledEventResponse.t()
            | StageScheduledEventResponse.t()
            | VoiceScheduledEventResponse.t()
          ],
          integrations: [
            PartialDiscordIntegrationResponse.t()
            | PartialExternalConnectionIntegrationResponse.t()
            | PartialGuildSubscriptionIntegrationResponse.t()
          ],
          threads: [ThreadResponse.t()],
          users: [UserResponse.t()],
          webhooks: [
            ApplicationIncomingWebhookResponse.t()
            | ChannelFollowerWebhookResponse.t()
            | GuildIncomingWebhookResponse.t()
          ]
        }

  defstruct [
    :application_commands,
    :audit_log_entries,
    :auto_moderation_rules,
    :guild_scheduled_events,
    :integrations,
    :threads,
    :users,
    :webhooks
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      application_commands: [{ApplicationCommandResponse, :t}],
      audit_log_entries: [{AuditLogEntryResponse, :t}],
      auto_moderation_rules: [
        union: [
          {DefaultKeywordRuleResponse, :t},
          {KeywordRuleResponse, :t},
          {MLSpamRuleResponse, :t},
          {MentionSpamRuleResponse, :t},
          {SpamLinkRuleResponse, :t},
          :null
        ]
      ],
      guild_scheduled_events: [
        union: [
          {ExternalScheduledEventResponse, :t},
          {StageScheduledEventResponse, :t},
          {VoiceScheduledEventResponse, :t}
        ]
      ],
      integrations: [
        union: [
          {PartialDiscordIntegrationResponse, :t},
          {PartialExternalConnectionIntegrationResponse, :t},
          {PartialGuildSubscriptionIntegrationResponse, :t}
        ]
      ],
      threads: [{ThreadResponse, :t}],
      users: [{UserResponse, :t}],
      webhooks: [
        union: [
          {ApplicationIncomingWebhookResponse, :t},
          {ChannelFollowerWebhookResponse, :t},
          {GuildIncomingWebhookResponse, :t}
        ]
      ]
    ]
  end
end
