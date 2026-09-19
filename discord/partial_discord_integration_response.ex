defmodule Discord.PartialDiscordIntegrationResponse do
  @moduledoc """
  Provides struct and type for a PartialDiscordIntegrationResponse
  """

  @type t :: %__MODULE__{
          account: Discord.AccountResponse.t() | nil,
          application_id: String.t(),
          id: String.t(),
          name: String.t() | nil,
          type: String.t()
        }

  defstruct [:account, :application_id, :id, :name, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      account: {:union, [{Discord.AccountResponse, :t}, :null]},
      application_id: {:string, "snowflake"},
      id: {:string, "snowflake"},
      name: {:union, [:string, :null]},
      type: {:const, "discord"}
    ]
  end
end
