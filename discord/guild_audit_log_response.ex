defmodule Discord.GuildAuditLogResponse do
  @moduledoc """
  Provides struct and type for a GuildAuditLogResponse
  """

  @type t :: %__MODULE__{
          application_commands: [Discord.ApplicationCommandResponse.t()],
          audit_log_entries: [Discord.AuditLogEntryResponse.t()],
          auto_moderation_rules: [
            Discord.DefaultKeywordRuleResponse.t()
            | Discord.KeywordRuleResponse.t()
            | Discord.MLSpamRuleResponse.t()
            | Discord.MentionSpamRuleResponse.t()
            | Discord.SpamLinkRuleResponse.t()
            | nil
          ],
          guild_scheduled_events: [
            Discord.ExternalScheduledEventResponse.t()
            | Discord.StageScheduledEventResponse.t()
            | Discord.VoiceScheduledEventResponse.t()
          ],
          integrations: [
            Discord.PartialDiscordIntegrationResponse.t()
            | Discord.PartialExternalConnectionIntegrationResponse.t()
            | Discord.PartialGuildSubscriptionIntegrationResponse.t()
          ],
          threads: [Discord.ThreadResponse.t()],
          users: [Discord.UserResponse.t()],
          webhooks: [
            Discord.ApplicationIncomingWebhookResponse.t()
            | Discord.ChannelFollowerWebhookResponse.t()
            | Discord.GuildIncomingWebhookResponse.t()
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
      application_commands: [{Discord.ApplicationCommandResponse, :t}],
      audit_log_entries: [{Discord.AuditLogEntryResponse, :t}],
      auto_moderation_rules: [
        union: [
          {Discord.DefaultKeywordRuleResponse, :t},
          {Discord.KeywordRuleResponse, :t},
          {Discord.MLSpamRuleResponse, :t},
          {Discord.MentionSpamRuleResponse, :t},
          {Discord.SpamLinkRuleResponse, :t},
          :null
        ]
      ],
      guild_scheduled_events: [
        union: [
          {Discord.ExternalScheduledEventResponse, :t},
          {Discord.StageScheduledEventResponse, :t},
          {Discord.VoiceScheduledEventResponse, :t}
        ]
      ],
      integrations: [
        union: [
          {Discord.PartialDiscordIntegrationResponse, :t},
          {Discord.PartialExternalConnectionIntegrationResponse, :t},
          {Discord.PartialGuildSubscriptionIntegrationResponse, :t}
        ]
      ],
      threads: [{Discord.ThreadResponse, :t}],
      users: [{Discord.UserResponse, :t}],
      webhooks: [
        union: [
          {Discord.ApplicationIncomingWebhookResponse, :t},
          {Discord.ChannelFollowerWebhookResponse, :t},
          {Discord.GuildIncomingWebhookResponse, :t}
        ]
      ]
    ]
  end
end
