defmodule Discord.ChannelFollowerWebhookResponse do
  @moduledoc """
  Provides struct and type for a ChannelFollowerWebhookResponse
  """

  @type t :: %__MODULE__{
          application_id: String.t() | nil,
          avatar: String.t() | nil,
          channel_id: String.t() | nil,
          guild_id: String.t() | nil,
          id: String.t(),
          name: String.t(),
          source_channel: Discord.WebhookSourceChannelResponse.t() | nil,
          source_guild: Discord.WebhookSourceGuildResponse.t() | nil,
          type: 2,
          user: Discord.UserResponse.t() | nil
        }

  defstruct [
    :application_id,
    :avatar,
    :channel_id,
    :guild_id,
    :id,
    :name,
    :source_channel,
    :source_guild,
    :type,
    :user
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      application_id: {:union, [{:string, "snowflake"}, :null]},
      avatar: {:union, [:string, :null]},
      channel_id: {:union, [{:string, "snowflake"}, :null]},
      guild_id: {:union, [{:string, "snowflake"}, :null]},
      id: {:string, "snowflake"},
      name: :string,
      source_channel: {:union, [{Discord.WebhookSourceChannelResponse, :t}, :null]},
      source_guild: {:union, [{Discord.WebhookSourceGuildResponse, :t}, :null]},
      type: {:const, 2},
      user: {:union, [{Discord.UserResponse, :t}, :null]}
    ]
  end
end
