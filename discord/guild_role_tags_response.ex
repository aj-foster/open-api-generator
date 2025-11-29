defmodule GuildRoleTagsResponse do
  @moduledoc """
  Provides struct and type for a GuildRoleTagsResponse
  """

  @type t :: %__MODULE__{
          available_for_purchase: nil,
          bot_id: String.t() | nil,
          guild_connections: nil,
          integration_id: String.t() | nil,
          premium_subscriber: nil,
          subscription_listing_id: String.t() | nil
        }

  defstruct [
    :available_for_purchase,
    :bot_id,
    :guild_connections,
    :integration_id,
    :premium_subscriber,
    :subscription_listing_id
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      available_for_purchase: :null,
      bot_id: {:union, [{:string, :generic}, :null]},
      guild_connections: :null,
      integration_id: {:union, [{:string, :generic}, :null]},
      premium_subscriber: :null,
      subscription_listing_id: {:union, [{:string, :generic}, :null]}
    ]
  end
end
