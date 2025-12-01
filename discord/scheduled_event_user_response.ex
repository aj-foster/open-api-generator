defmodule Discord.ScheduledEventUserResponse do
  @moduledoc """
  Provides struct and type for a ScheduledEventUserResponse
  """

  @type t :: %__MODULE__{
          guild_scheduled_event_id: String.t(),
          member: Discord.GuildMemberResponse.t() | nil,
          user: Discord.UserResponse.t() | nil,
          user_id: String.t()
        }

  defstruct [:guild_scheduled_event_id, :member, :user, :user_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      guild_scheduled_event_id: {:string, "snowflake"},
      member: {:union, [{Discord.GuildMemberResponse, :t}, :null]},
      user: {:union, [{Discord.UserResponse, :t}, :null]},
      user_id: {:string, "snowflake"}
    ]
  end
end
