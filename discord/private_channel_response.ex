defmodule Discord.PrivateChannelResponse do
  @moduledoc """
  Provides struct and type for a PrivateChannelResponse
  """

  @type t :: %__MODULE__{
          flags: integer,
          id: String.t(),
          last_message_id: String.t() | nil,
          last_pin_timestamp: DateTime.t() | nil,
          recipients: [Discord.UserResponse.t()],
          type: 1
        }

  defstruct [:flags, :id, :last_message_id, :last_pin_timestamp, :recipients, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      flags: {:integer, "int32"},
      id: {:string, "snowflake"},
      last_message_id: {:union, [{:string, "snowflake"}, :null]},
      last_pin_timestamp: {:union, [{:string, "date-time"}, :null]},
      recipients: [{Discord.UserResponse, :t}],
      type: {:const, 1}
    ]
  end
end
