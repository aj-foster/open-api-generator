defmodule ChannelFollowerWebhookResponse do
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
          source_channel: WebhookSourceChannelResponse.t() | nil,
          source_guild: WebhookSourceGuildResponse.t() | nil,
          type: 2,
          user: UserResponse.t() | nil
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
      application_id: {:union, [{:string, :generic}, :null]},
      avatar: {:union, [{:string, :generic}, :null]},
      channel_id: {:union, [{:string, :generic}, :null]},
      guild_id: {:union, [{:string, :generic}, :null]},
      id: {:string, :generic},
      name: {:string, :generic},
      source_channel: {:union, [{WebhookSourceChannelResponse, :t}, :null]},
      source_guild: {:union, [{WebhookSourceGuildResponse, :t}, :null]},
      type: {:const, 2},
      user: {:union, [{UserResponse, :t}, :null]}
    ]
  end
end
