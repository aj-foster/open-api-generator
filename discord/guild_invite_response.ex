defmodule GuildInviteResponse do
  @moduledoc """
  Provides struct and type for a GuildInviteResponse
  """

  @type t :: %__MODULE__{
          approximate_member_count: integer | nil,
          approximate_presence_count: integer | nil,
          channel: InviteChannelResponse.t() | nil,
          code: String.t(),
          created_at: DateTime.t() | nil,
          expires_at: DateTime.t() | nil,
          flags: integer | nil,
          guild: InviteGuildResponse.t() | nil,
          guild_id: String.t() | nil,
          guild_scheduled_event: ScheduledEventResponse.t() | nil,
          inviter: UserResponse.t() | nil,
          is_contact: boolean | nil,
          max_age: integer | nil,
          max_uses: integer | nil,
          stage_instance: InviteStageInstanceResponse.t() | nil,
          target_application: InviteApplicationResponse.t() | nil,
          target_type: integer | nil,
          target_user: UserResponse.t() | nil,
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
      approximate_member_count: {:union, [:integer, :null]},
      approximate_presence_count: {:union, [:integer, :null]},
      channel: {:union, [{InviteChannelResponse, :t}, :null]},
      code: {:string, :generic},
      created_at: {:union, [{:string, :date_time}, :null]},
      expires_at: {:union, [{:string, :date_time}, :null]},
      flags: {:union, [:integer, :null]},
      guild: {:union, [{InviteGuildResponse, :t}, :null]},
      guild_id: {:union, [{:string, :generic}, :null]},
      guild_scheduled_event: {:union, [{ScheduledEventResponse, :t}, :null]},
      inviter: {:union, [{UserResponse, :t}, :null]},
      is_contact: {:union, [:boolean, :null]},
      max_age: {:union, [:integer, :null]},
      max_uses: {:union, [:integer, :null]},
      stage_instance: {:union, [{InviteStageInstanceResponse, :t}, :null]},
      target_application: {:union, [{InviteApplicationResponse, :t}, :null]},
      target_type: {:union, [:integer, :null]},
      target_user: {:union, [{UserResponse, :t}, :null]},
      temporary: {:union, [:boolean, :null]},
      type: {:union, [{:const, 0}, :null]},
      uses: {:union, [:integer, :null]}
    ]
  end
end
