defmodule UpdateGuildChannelRequestPartial do
  @moduledoc """
  Provides struct and type for a UpdateGuildChannelRequestPartial
  """

  @type t :: %__MODULE__{
          available_tags: [map] | nil,
          bitrate: integer | nil,
          default_auto_archive_duration: integer | nil,
          default_forum_layout: integer | nil,
          default_reaction_emoji: UpdateDefaultReactionEmojiRequest.t() | nil,
          default_sort_order: integer | nil,
          default_thread_rate_limit_per_user: integer | nil,
          flags: integer | nil,
          name: String.t() | nil,
          nsfw: boolean | nil,
          parent_id: String.t() | nil,
          permission_overwrites: [map] | nil,
          position: integer | nil,
          rate_limit_per_user: integer | nil,
          rtc_region: String.t() | nil,
          topic: String.t() | nil,
          type: 0 | 2 | 4 | 5 | 13 | 14 | 15 | nil,
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
    :name,
    :nsfw,
    :parent_id,
    :permission_overwrites,
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
      default_reaction_emoji: {:union, [{UpdateDefaultReactionEmojiRequest, :t}, :null]},
      default_sort_order: {:union, [:integer, :null]},
      default_thread_rate_limit_per_user: {:union, [:integer, :null]},
      flags: {:union, [:integer, :null]},
      name: {:string, :generic},
      nsfw: {:union, [:boolean, :null]},
      parent_id: {:union, [{:string, :generic}, :null]},
      permission_overwrites: {:union, [[:map], :null]},
      position: {:union, [:integer, :null]},
      rate_limit_per_user: {:union, [:integer, :null]},
      rtc_region: {:union, [{:string, :generic}, :null]},
      topic: {:union, [{:string, :generic}, :null]},
      type: {:union, [{:enum, [0, 2, 4, 5, 13, 14, 15]}, :null]},
      user_limit: {:union, [:integer, :null]},
      video_quality_mode: {:union, [:integer, :null]}
    ]
  end
end
