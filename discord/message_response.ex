defmodule Discord.MessageResponse do
  @moduledoc """
  Provides struct and type for a MessageResponse
  """

  @type t :: %__MODULE__{
          activity: map | nil,
          application: Discord.BasicApplicationResponse.t() | nil,
          application_id: String.t() | nil,
          attachments: [Discord.MessageAttachmentResponse.t()],
          author: Discord.UserResponse.t(),
          call: Discord.MessageCallResponse.t() | nil,
          channel_id: String.t(),
          components: [
            Discord.MessageComponentActionRowResponse.t()
            | Discord.MessageComponentButtonResponse.t()
            | Discord.MessageComponentChannelSelectResponse.t()
            | Discord.MessageComponentInputTextResponse.t()
            | Discord.MessageComponentMentionableSelectResponse.t()
            | Discord.MessageComponentRoleSelectResponse.t()
            | Discord.MessageComponentStringSelectResponse.t()
            | Discord.MessageComponentUserSelectResponse.t()
          ],
          content: String.t(),
          edited_timestamp: DateTime.t() | nil,
          embeds: [Discord.MessageEmbedResponse.t()],
          flags: integer,
          id: String.t(),
          interaction: Discord.MessageInteractionResponse.t() | nil,
          mention_channels: [map | nil] | nil,
          mention_everyone: boolean,
          mention_roles: [String.t()],
          mentions: [Discord.UserResponse.t()],
          message_reference: Discord.MessageReferenceResponse.t() | nil,
          nonce: integer | String.t() | nil,
          pinned: boolean,
          position: integer | nil,
          purchase_notification: Discord.PurchaseNotificationResponse.t() | nil,
          reactions: [map] | nil,
          referenced_message: Discord.BasicMessageResponse.t() | nil,
          resolved: Discord.ResolvedObjectsResponse.t() | nil,
          role_subscription_data: Discord.MessageRoleSubscriptionDataResponse.t() | nil,
          sticker_items: [map] | nil,
          stickers:
            [Discord.GuildStickerResponse.t() | Discord.StandardStickerResponse.t()] | nil,
          thread: Discord.ThreadResponse.t() | nil,
          timestamp: DateTime.t(),
          tts: boolean,
          type: integer,
          webhook_id: String.t() | nil
        }

  defstruct [
    :activity,
    :application,
    :application_id,
    :attachments,
    :author,
    :call,
    :channel_id,
    :components,
    :content,
    :edited_timestamp,
    :embeds,
    :flags,
    :id,
    :interaction,
    :mention_channels,
    :mention_everyone,
    :mention_roles,
    :mentions,
    :message_reference,
    :nonce,
    :pinned,
    :position,
    :purchase_notification,
    :reactions,
    :referenced_message,
    :resolved,
    :role_subscription_data,
    :sticker_items,
    :stickers,
    :thread,
    :timestamp,
    :tts,
    :type,
    :webhook_id
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      activity: {:union, [:map, :null]},
      application: {:union, [{Discord.BasicApplicationResponse, :t}, :null]},
      application_id: {:union, [{:string, "snowflake"}, :null]},
      attachments: [{Discord.MessageAttachmentResponse, :t}],
      author: {Discord.UserResponse, :t},
      call: {:union, [{Discord.MessageCallResponse, :t}, :null]},
      channel_id: {:string, "snowflake"},
      components: [
        union: [
          {Discord.MessageComponentActionRowResponse, :t},
          {Discord.MessageComponentButtonResponse, :t},
          {Discord.MessageComponentChannelSelectResponse, :t},
          {Discord.MessageComponentInputTextResponse, :t},
          {Discord.MessageComponentMentionableSelectResponse, :t},
          {Discord.MessageComponentRoleSelectResponse, :t},
          {Discord.MessageComponentStringSelectResponse, :t},
          {Discord.MessageComponentUserSelectResponse, :t}
        ]
      ],
      content: :string,
      edited_timestamp: {:union, [{:string, "date-time"}, :null]},
      embeds: [{Discord.MessageEmbedResponse, :t}],
      flags: {:integer, "int32"},
      id: {:string, "snowflake"},
      interaction: {:union, [{Discord.MessageInteractionResponse, :t}, :null]},
      mention_channels: {:union, [[union: [:map, :null]], :null]},
      mention_everyone: :boolean,
      mention_roles: [string: "snowflake"],
      mentions: [{Discord.UserResponse, :t}],
      message_reference: {:union, [{Discord.MessageReferenceResponse, :t}, :null]},
      nonce: {:union, [{:integer, "int64"}, {:string, "nonce"}, :null]},
      pinned: :boolean,
      position: {:union, [{:integer, "int32"}, :null]},
      purchase_notification: {:union, [{Discord.PurchaseNotificationResponse, :t}, :null]},
      reactions: {:union, [[:map], :null]},
      referenced_message: {:union, [{Discord.BasicMessageResponse, :t}, :null]},
      resolved: {:union, [{Discord.ResolvedObjectsResponse, :t}, :null]},
      role_subscription_data:
        {:union, [{Discord.MessageRoleSubscriptionDataResponse, :t}, :null]},
      sticker_items: {:union, [[:map], :null]},
      stickers:
        {:union,
         [
           [union: [{Discord.GuildStickerResponse, :t}, {Discord.StandardStickerResponse, :t}]],
           :null
         ]},
      thread: {:union, [{Discord.ThreadResponse, :t}, :null]},
      timestamp: {:string, "date-time"},
      tts: :boolean,
      type: {:integer, "int32"},
      webhook_id: {:union, [{:string, "snowflake"}, :null]}
    ]
  end
end
