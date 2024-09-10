defmodule MessageRoleSubscriptionDataResponse do
  @moduledoc """
  Provides struct and type for a MessageRoleSubscriptionDataResponse
  """

  @type t :: %__MODULE__{
          is_renewal: boolean,
          role_subscription_listing_id: String.t(),
          tier_name: String.t(),
          total_months_subscribed: integer
        }

  defstruct [:is_renewal, :role_subscription_listing_id, :tier_name, :total_months_subscribed]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      is_renewal: :boolean,
      role_subscription_listing_id: {:string, :generic},
      tier_name: {:string, :generic},
      total_months_subscribed: :integer
    ]
  end
end
