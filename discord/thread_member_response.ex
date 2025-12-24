defmodule Discord.ThreadMemberResponse do
  @moduledoc """
  Provides struct and type for a ThreadMemberResponse
  """

  @type t :: %__MODULE__{
          flags: integer,
          id: String.t(),
          join_timestamp: DateTime.t(),
          member: Discord.GuildMemberResponse.t() | nil,
          user_id: String.t()
        }

  defstruct [:flags, :id, :join_timestamp, :member, :user_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      flags: {:integer, "int32"},
      id: {:string, "snowflake"},
      join_timestamp: {:string, "date-time"},
      member: {:union, [{Discord.GuildMemberResponse, :t}, :null]},
      user_id: {:string, "snowflake"}
    ]
  end
end
