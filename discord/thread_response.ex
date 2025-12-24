defmodule Discord.ThreadResponse do
  @moduledoc """
  Provides struct and type for a ThreadResponse
  """

  @type t :: %__MODULE__{
          applied_tags: [String.t()] | nil,
          bitrate: integer | nil,
          flags: integer,
          guild_id: String.t(),
          id: String.t(),
          last_message_id: String.t() | nil,
          last_pin_timestamp: DateTime.t() | nil,
          member: Discord.ThreadMemberResponse.t() | nil,
          member_count: integer,
          message_count: integer,
          name: String.t(),
          owner_id: String.t(),
          parent_id: String.t() | nil,
          permissions: String.t() | nil,
          rate_limit_per_user: integer | nil,
          rtc_region: String.t() | nil,
          thread_metadata: Discord.ThreadMetadataResponse.t() | nil,
          total_message_sent: integer,
          type: 10 | 11 | 12,
          user_limit: integer | nil,
          video_quality_mode: integer | nil
        }

  defstruct [
    :applied_tags,
    :bitrate,
    :flags,
    :guild_id,
    :id,
    :last_message_id,
    :last_pin_timestamp,
    :member,
    :member_count,
    :message_count,
    :name,
    :owner_id,
    :parent_id,
    :permissions,
    :rate_limit_per_user,
    :rtc_region,
    :thread_metadata,
    :total_message_sent,
    :type,
    :user_limit,
    :video_quality_mode
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      applied_tags: {:union, [[string: "snowflake"], :null]},
      bitrate: {:union, [{:integer, "int32"}, :null]},
      flags: {:integer, "int32"},
      guild_id: {:string, "snowflake"},
      id: {:string, "snowflake"},
      last_message_id: {:union, [{:string, "snowflake"}, :null]},
      last_pin_timestamp: {:union, [{:string, "date-time"}, :null]},
      member: {:union, [{Discord.ThreadMemberResponse, :t}, :null]},
      member_count: {:integer, "int32"},
      message_count: {:integer, "int32"},
      name: :string,
      owner_id: {:string, "snowflake"},
      parent_id: {:union, [{:string, "snowflake"}, :null]},
      permissions: {:union, [:string, :null]},
      rate_limit_per_user: {:union, [{:integer, "int32"}, :null]},
      rtc_region: {:union, [:string, :null]},
      thread_metadata: {:union, [{Discord.ThreadMetadataResponse, :t}, :null]},
      total_message_sent: {:integer, "int32"},
      type: {:enum, ~c"
"},
      user_limit: {:union, [{:integer, "int32"}, :null]},
      video_quality_mode: {:union, [{:integer, "int32"}, :null]}
    ]
  end
end
