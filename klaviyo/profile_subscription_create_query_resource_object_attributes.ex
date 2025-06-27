defmodule ProfileSubscriptionCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a ProfileSubscriptionCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          email: String.t() | nil,
          phone_number: String.t() | nil,
          subscriptions: SubscriptionChannels.t() | nil
        }

  defstruct [:email, :phone_number, :subscriptions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      email: {:string, :generic},
      phone_number: {:string, :generic},
      subscriptions: {SubscriptionChannels, :t}
    ]
  end
end
