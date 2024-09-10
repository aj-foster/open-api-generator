defmodule MessageResponse do
  @moduledoc """
  Provides struct and type for a MessageResponse
  """

  @type t :: %__MODULE__{
          activity: map | nil,
          application: BasicApplicationResponse.t() | nil,
          application_id: String.t() | nil,
          attachments: [MessageAttachmentResponse.t()],
          author: UserResponse.t(),
          call: MessageCallResponse.t() | nil,
          channel_id: String.t(),
          components: [
            MessageComponentActionRowResponse.t()
            | MessageComponentButtonResponse.t()
            | MessageComponentChannelSelectResponse.t()
            | MessageComponentInputTextResponse.t()
            | MessageComponentMentionableSelectResponse.t()
            | MessageComponentRoleSelectResponse.t()
            | MessageComponentStringSelectResponse.t()
            | MessageComponentUserSelectResponse.t()
          ],
          content: String.t(),
          edited_timestamp: DateTime.t() | nil,
          embeds: [MessageEmbedResponse.t()],
          flags: integer,
          id: String.t(),
          interaction: MessageInteractionResponse.t() | nil,
          mention_channels: [map | nil] | nil,
          mention_everyone: boolean,
          mention_roles: [String.t()],
          mentions: [UserResponse.t()],
          message_reference: MessageReferenceResponse.t() | nil,
          nonce: integer | String.t() | nil,
          pinned: boolean,
          position: integer | nil,
          purchase_notification: PurchaseNotificationResponse.t() | nil,
          reactions: [map] | nil,
          referenced_message: BasicMessageResponse.t() | nil,
          resolved: ResolvedObjectsResponse.t() | nil,
          role_subscription_data: MessageRoleSubscriptionDataResponse.t() | nil,
          sticker_items: [map] | nil,
          stickers: [GuildStickerResponse.t() | StandardStickerResponse.t()] | nil,
          thread: ThreadResponse.t() | nil,
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
      application: {:union, [{BasicApplicationResponse, :t}, :null]},
      application_id: {:union, [{:string, :generic}, :null]},
      attachments: [{MessageAttachmentResponse, :t}],
      author: {UserResponse, :t},
      call: {:union, [{MessageCallResponse, :t}, :null]},
      channel_id: {:string, :generic},
      components: [
        union: [
          {MessageComponentActionRowResponse, :t},
          {MessageComponentButtonResponse, :t},
          {MessageComponentChannelSelectResponse, :t},
          {MessageComponentInputTextResponse, :t},
          {MessageComponentMentionableSelectResponse, :t},
          {MessageComponentRoleSelectResponse, :t},
          {MessageComponentStringSelectResponse, :t},
          {MessageComponentUserSelectResponse, :t}
        ]
      ],
      content: {:string, :generic},
      edited_timestamp: {:union, [{:string, :date_time}, :null]},
      embeds: [{MessageEmbedResponse, :t}],
      flags: :integer,
      id: {:string, :generic},
      interaction: {:union, [{MessageInteractionResponse, :t}, :null]},
      mention_channels: {:union, [[union: [:map, :null]], :null]},
      mention_everyone: :boolean,
      mention_roles: [string: :generic],
      mentions: [{UserResponse, :t}],
      message_reference: {:union, [{MessageReferenceResponse, :t}, :null]},
      nonce: {:union, [:integer, {:string, :generic}, :null]},
      pinned: :boolean,
      position: {:union, [:integer, :null]},
      purchase_notification: {:union, [{PurchaseNotificationResponse, :t}, :null]},
      reactions: {:union, [[:map], :null]},
      referenced_message: {:union, [{BasicMessageResponse, :t}, :null]},
      resolved: {:union, [{ResolvedObjectsResponse, :t}, :null]},
      role_subscription_data: {:union, [{MessageRoleSubscriptionDataResponse, :t}, :null]},
      sticker_items: {:union, [[:map], :null]},
      stickers:
        {:union, [[union: [{GuildStickerResponse, :t}, {StandardStickerResponse, :t}]], :null]},
      thread: {:union, [{ThreadResponse, :t}, :null]},
      timestamp: {:string, :date_time},
      tts: :boolean,
      type: :integer,
      webhook_id: {:union, [{:string, :generic}, :null]}
    ]
  end
end
