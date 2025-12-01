defmodule Klaviyo.ProfileSubscriptionCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a ProfileSubscriptionCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          email: String.t() | nil,
          phone_number: String.t() | nil,
          subscriptions: Klaviyo.SubscriptionChannels.t() | nil
        }

  defstruct [:email, :phone_number, :subscriptions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [email: :string, phone_number: :string, subscriptions: {Klaviyo.SubscriptionChannels, :t}]
  end
end
