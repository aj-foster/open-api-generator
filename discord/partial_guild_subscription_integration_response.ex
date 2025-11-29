defmodule PartialGuildSubscriptionIntegrationResponse do
  @moduledoc """
  Provides struct and type for a PartialGuildSubscriptionIntegrationResponse
  """

  @type t :: %__MODULE__{
          account: AccountResponse.t() | nil,
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
      account: {:union, [{AccountResponse, :t}, :null]},
      id: {:string, :generic},
      name: {:union, [{:string, :generic}, :null]},
      type: {:const, "guild_subscription"}
    ]
  end
end
