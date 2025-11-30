defmodule Discord.GuildHomeSettingsResponse do
  @moduledoc """
  Provides struct and type for a GuildHomeSettingsResponse
  """

  @type t :: %__MODULE__{
          enabled: boolean,
          guild_id: String.t(),
          new_member_actions: [map | nil] | nil,
          resource_channels: [map | nil] | nil,
          welcome_message: Discord.WelcomeMessageResponse.t() | nil
        }

  defstruct [:enabled, :guild_id, :new_member_actions, :resource_channels, :welcome_message]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      enabled: :boolean,
      guild_id: {:string, "snowflake"},
      new_member_actions: {:union, [[union: [:map, :null]], :null]},
      resource_channels: {:union, [[union: [:map, :null]], :null]},
      welcome_message: {:union, [{Discord.WelcomeMessageResponse, :t}, :null]}
    ]
  end
end
