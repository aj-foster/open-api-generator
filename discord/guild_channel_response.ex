defmodule Discord.GuildChannelResponse do
  @moduledoc """
  Provides struct and type for a GuildChannelResponse
  """

  @type t :: %__MODULE__{
          available_tags: [map] | nil,
          bitrate: integer | nil,
          default_auto_archive_duration: integer | nil,
          default_forum_layout: integer | nil,
          default_reaction_emoji: Discord.DefaultReactionEmojiResponse.t() | nil,
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
          permission_overwrites: [Discord.ChannelPermissionOverwriteResponse.t()] | nil,
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
      bitrate: {:union, [{:integer, "int32"}, :null]},
      default_auto_archive_duration: {:union, [{:integer, "int32"}, :null]},
      default_forum_layout: {:union, [{:integer, "int32"}, :null]},
      default_reaction_emoji: {:union, [{Discord.DefaultReactionEmojiResponse, :t}, :null]},
      default_sort_order: {:union, [{:integer, "int32"}, :null]},
      default_thread_rate_limit_per_user: {:union, [{:integer, "int32"}, :null]},
      flags: {:integer, "int32"},
      guild_id: {:string, "snowflake"},
      id: {:string, "snowflake"},
      last_message_id: {:union, [{:string, "snowflake"}, :null]},
      last_pin_timestamp: {:union, [{:string, "date-time"}, :null]},
      name: :string,
      nsfw: {:union, [:boolean, :null]},
      parent_id: {:union, [{:string, "snowflake"}, :null]},
      permission_overwrites:
        {:union, [[{Discord.ChannelPermissionOverwriteResponse, :t}], :null]},
      permissions: {:union, [:string, :null]},
      position: {:integer, "int32"},
      rate_limit_per_user: {:union, [{:integer, "int32"}, :null]},
      rtc_region: {:union, [:string, :null]},
      topic: {:union, [:string, :null]},
      type: {:enum, [0, 2, 4, 5, 13, 14, 15]},
      user_limit: {:union, [{:integer, "int32"}, :null]},
      video_quality_mode: {:union, [{:integer, "int32"}, :null]}
    ]
  end
end
