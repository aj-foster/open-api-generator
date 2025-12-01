defmodule Discord.GuildInviteResponse do
  @moduledoc """
  Provides struct and type for a GuildInviteResponse
  """

  @type t :: %__MODULE__{
          approximate_member_count: integer | nil,
          approximate_presence_count: integer | nil,
          channel: Discord.InviteChannelResponse.t() | nil,
          code: String.t(),
          created_at: DateTime.t() | nil,
          expires_at: DateTime.t() | nil,
          flags: integer | nil,
          guild: Discord.InviteGuildResponse.t() | nil,
          guild_id: String.t() | nil,
          guild_scheduled_event: Discord.ScheduledEventResponse.t() | nil,
          inviter: Discord.UserResponse.t() | nil,
          is_contact: boolean | nil,
          max_age: integer | nil,
          max_uses: integer | nil,
          stage_instance: Discord.InviteStageInstanceResponse.t() | nil,
          target_application: Discord.InviteApplicationResponse.t() | nil,
          target_type: integer | nil,
          target_user: Discord.UserResponse.t() | nil,
          temporary: boolean | nil,
          type: 0 | nil,
          uses: integer | nil
        }

  defstruct [
    :approximate_member_count,
    :approximate_presence_count,
    :channel,
    :code,
    :created_at,
    :expires_at,
    :flags,
    :guild,
    :guild_id,
    :guild_scheduled_event,
    :inviter,
    :is_contact,
    :max_age,
    :max_uses,
    :stage_instance,
    :target_application,
    :target_type,
    :target_user,
    :temporary,
    :type,
    :uses
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      approximate_member_count: {:union, [{:integer, "int32"}, :null]},
      approximate_presence_count: {:union, [{:integer, "int32"}, :null]},
      channel: {:union, [{Discord.InviteChannelResponse, :t}, :null]},
      code: :string,
      created_at: {:union, [{:string, "date-time"}, :null]},
      expires_at: {:union, [{:string, "date-time"}, :null]},
      flags: {:union, [{:integer, "int32"}, :null]},
      guild: {:union, [{Discord.InviteGuildResponse, :t}, :null]},
      guild_id: {:union, [{:string, "snowflake"}, :null]},
      guild_scheduled_event: {:union, [{Discord.ScheduledEventResponse, :t}, :null]},
      inviter: {:union, [{Discord.UserResponse, :t}, :null]},
      is_contact: {:union, [:boolean, :null]},
      max_age: {:union, [{:integer, "int32"}, :null]},
      max_uses: {:union, [{:integer, "int32"}, :null]},
      stage_instance: {:union, [{Discord.InviteStageInstanceResponse, :t}, :null]},
      target_application: {:union, [{Discord.InviteApplicationResponse, :t}, :null]},
      target_type: {:union, [{:integer, "int32"}, :null]},
      target_user: {:union, [{Discord.UserResponse, :t}, :null]},
      temporary: {:union, [:boolean, :null]},
      type: {:union, [{:const, 0}, :null]},
      uses: {:union, [{:integer, "int32"}, :null]}
    ]
  end
end
