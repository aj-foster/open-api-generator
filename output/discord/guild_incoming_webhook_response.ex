defmodule GuildIncomingWebhookResponse do
  @moduledoc """
  Provides struct and type for a GuildIncomingWebhookResponse
  """

  @type t :: %__MODULE__{
          application_id: String.t() | nil,
          avatar: String.t() | nil,
          channel_id: String.t() | nil,
          guild_id: String.t() | nil,
          id: String.t(),
          name: String.t(),
          token: String.t() | nil,
          type: 1,
          url: String.t() | nil,
          user: UserResponse.t() | nil
        }

  defstruct [
    :application_id,
    :avatar,
    :channel_id,
    :guild_id,
    :id,
    :name,
    :token,
    :type,
    :url,
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
      token: {:union, [{:string, :generic}, :null]},
      type: {:const, 1},
      url: {:union, [{:string, :uri}, :null]},
      user: {:union, [{UserResponse, :t}, :null]}
    ]
  end
end
