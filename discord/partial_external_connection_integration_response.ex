defmodule Discord.PartialExternalConnectionIntegrationResponse do
  @moduledoc """
  Provides struct and type for a PartialExternalConnectionIntegrationResponse
  """

  @type t :: %__MODULE__{
          account: Discord.AccountResponse.t() | nil,
          id: String.t(),
          name: String.t() | nil,
          type: String.t()
        }

  defstruct [:account, :id, :name, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      account: {:union, [{Discord.AccountResponse, :t}, :null]},
      id: {:string, "snowflake"},
      name: {:union, [:string, :null]},
      type: {:enum, ["twitch", "youtube"]}
    ]
  end
end
