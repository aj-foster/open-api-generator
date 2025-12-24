defmodule Discord.PrivateGroupChannelResponse do
  @moduledoc """
  Provides struct and type for a PrivateGroupChannelResponse
  """

  @type t :: %__MODULE__{
          application_id: String.t() | nil,
          flags: integer,
          icon: String.t() | nil,
          id: String.t(),
          last_message_id: String.t() | nil,
          last_pin_timestamp: DateTime.t() | nil,
          managed: boolean | nil,
          name: String.t() | nil,
          owner_id: String.t() | nil,
          recipients: [Discord.UserResponse.t()],
          type: 3
        }

  defstruct [
    :application_id,
    :flags,
    :icon,
    :id,
    :last_message_id,
    :last_pin_timestamp,
    :managed,
    :name,
    :owner_id,
    :recipients,
    :type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      application_id: {:union, [{:string, "snowflake"}, :null]},
      flags: {:integer, "int32"},
      icon: {:union, [:string, :null]},
      id: {:string, "snowflake"},
      last_message_id: {:union, [{:string, "snowflake"}, :null]},
      last_pin_timestamp: {:union, [{:string, "date-time"}, :null]},
      managed: {:union, [:boolean, :null]},
      name: {:union, [:string, :null]},
      owner_id: {:union, [{:string, "snowflake"}, :null]},
      recipients: [{Discord.UserResponse, :t}],
      type: {:const, 3}
    ]
  end
end
