defmodule GuildChannelResponse do
  @moduledoc """
  Provides struct and type for a GuildChannelResponse
  """

  @type t :: %__MODULE__{
          available_tags: [map] | nil,
          bitrate: integer | nil,
          default_auto_archive_duration: integer | nil,
          default_forum_layout: integer | nil,
          default_reaction_emoji: DefaultReactionEmojiResponse.t() | nil,
          default_sort_order: integer | nil,
          default_thread_rate_limit_per_user: integer | nil,
          flags: integer,
          guild_id: String.t(),
          id: String.t(),
          last_message_id: String.t() | nil,
          last_pin_timestamp: DateTime.t() | nil,
          name: String.t(),
          nsfw: boolean | nil,
          parent_id: String.t() | nil,
          permission_overwrites: [ChannelPermissionOverwriteResponse.t()] | nil,
          permissions: String.t() | nil,
          position: integer,
          rate_limit_per_user: integer | nil,
          rtc_region: String.t() | nil,
          topic: String.t() | nil,
          type: 0 | 2 | 4 | 5 | 13 | 14 | 15,
          user_limit: integer | nil,
          video_quality_mode: integer | nil
        }

  defstruct [
    :available_tags,
    :bitrate,
    :default_auto_archive_duration,
    :default_forum_layout,
    :default_reaction_emoji,
    :default_sort_order,
    :default_thread_rate_limit_per_user,
    :flags,
    :guild_id,
    :id,
    :last_message_id,
    :last_pin_timestamp,
    :name,
    :nsfw,
    :parent_id,
    :permission_overwrites,
    :permissions,
    :position,
    :rate_limit_per_user,
    :rtc_region,
    :topic,
    :type,
    :user_limit,
    :video_quality_mode
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      available_tags: {:union, [[:map], :null]},
      bitrate: {:union, [:integer, :null]},
      default_auto_archive_duration: {:union, [:integer, :null]},
      default_forum_layout: {:union, [:integer, :null]},
      default_reaction_emoji: {:union, [{DefaultReactionEmojiResponse, :t}, :null]},
      default_sort_order: {:union, [:integer, :null]},
      default_thread_rate_limit_per_user: {:union, [:integer, :null]},
      flags: :integer,
      guild_id: {:string, :generic},
      id: {:string, :generic},
      last_message_id: {:union, [{:string, :generic}, :null]},
      last_pin_timestamp: {:union, [{:string, :date_time}, :null]},
      name: {:string, :generic},
      nsfw: {:union, [:boolean, :null]},
      parent_id: {:union, [{:string, :generic}, :null]},
      permission_overwrites: {:union, [[{ChannelPermissionOverwriteResponse, :t}], :null]},
      permissions: {:union, [{:string, :generic}, :null]},
      position: :integer,
      rate_limit_per_user: {:union, [:integer, :null]},
      rtc_region: {:union, [{:string, :generic}, :null]},
      topic: {:union, [{:string, :generic}, :null]},
      type: {:enum, [0, 2, 4, 5, 13, 14, 15]},
      user_limit: {:union, [:integer, :null]},
      video_quality_mode: {:union, [:integer, :null]}
    ]
  end
end
