defmodule Discord.ApplicationIncomingWebhookResponse do
  @moduledoc """
  Provides struct and type for a ApplicationIncomingWebhookResponse
  """

  @type t :: %__MODULE__{
          application_id: String.t() | nil,
          avatar: String.t() | nil,
          channel_id: String.t() | nil,
          guild_id: String.t() | nil,
          id: String.t(),
          name: String.t(),
          type: 3,
          user: Discord.UserResponse.t() | nil
        }

  defstruct [:application_id, :avatar, :channel_id, :guild_id, :id, :name, :type, :user]

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
      type: {:const, 3},
      user: {:union, [{Discord.UserResponse, :t}, :null]}
    ]
  end
end
