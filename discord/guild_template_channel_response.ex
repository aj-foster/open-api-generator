defmodule GuildTemplateChannelResponse do
  @moduledoc """
  Provides struct and type for a GuildTemplateChannelResponse
  """

  @type t :: %__MODULE__{
          available_tags: [map] | nil,
          bitrate: integer,
          default_auto_archive_duration: integer | nil,
          default_forum_layout: integer | nil,
          default_reaction_emoji: DefaultReactionEmojiResponse.t() | nil,
          default_sort_order: integer | nil,
          default_thread_rate_limit_per_user: integer | nil,
          icon_emoji: map | nil,
          id: integer | nil,
          name: String.t() | nil,
          nsfw: boolean,
          parent_id: String.t() | nil,
          permission_overwrites: [ChannelPermissionOverwriteResponse.t() | nil],
          position: integer | nil,
          rate_limit_per_user: integer,
          template: String.t(),
          theme_color: integer | nil,
          topic: String.t() | nil,
          type: 0 | 2 | 4,
          user_limit: integer
        }

  defstruct [
    :available_tags,
    :bitrate,
    :default_auto_archive_duration,
    :default_forum_layout,
    :default_reaction_emoji,
    :default_sort_order,
    :default_thread_rate_limit_per_user,
    :icon_emoji,
    :id,
    :name,
    :nsfw,
    :parent_id,
    :permission_overwrites,
    :position,
    :rate_limit_per_user,
    :template,
    :theme_color,
    :topic,
    :type,
    :user_limit
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      available_tags: {:union, [[:map], :null]},
      bitrate: :integer,
      default_auto_archive_duration: {:union, [:integer, :null]},
      default_forum_layout: {:union, [:integer, :null]},
      default_reaction_emoji: {:union, [{DefaultReactionEmojiResponse, :t}, :null]},
      default_sort_order: {:union, [:integer, :null]},
      default_thread_rate_limit_per_user: {:union, [:integer, :null]},
      icon_emoji: {:union, [:map, :null]},
      id: {:union, [:integer, :null]},
      name: {:union, [{:string, :generic}, :null]},
      nsfw: :boolean,
      parent_id: {:union, [{:string, :generic}, :null]},
      permission_overwrites: [union: [{ChannelPermissionOverwriteResponse, :t}, :null]],
      position: {:union, [:integer, :null]},
      rate_limit_per_user: :integer,
      template: {:string, :generic},
      theme_color: {:union, [:integer, :null]},
      topic: {:union, [{:string, :generic}, :null]},
      type: {:enum, [0, 2, 4]},
      user_limit: :integer
    ]
  end
end
