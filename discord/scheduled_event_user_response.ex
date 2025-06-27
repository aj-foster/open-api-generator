defmodule ScheduledEventUserResponse do
  @moduledoc """
  Provides struct and type for a ScheduledEventUserResponse
  """

  @type t :: %__MODULE__{
          guild_scheduled_event_id: String.t(),
          member: GuildMemberResponse.t() | nil,
          user: UserResponse.t() | nil,
          user_id: String.t()
        }

  defstruct [:guild_scheduled_event_id, :member, :user, :user_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      guild_scheduled_event_id: {:string, :generic},
      member: {:union, [{GuildMemberResponse, :t}, :null]},
      user: {:union, [{UserResponse, :t}, :null]},
      user_id: {:string, :generic}
    ]
  end
end
