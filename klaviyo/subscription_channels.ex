defmodule Klaviyo.SubscriptionChannels do
  @moduledoc """
  Provides struct and type for a SubscriptionChannels
  """

  @type t :: %__MODULE__{
          email: Klaviyo.EmailSubscriptionParameters.t() | nil,
          sms: Klaviyo.SMSSubscriptionParameters.t() | nil
        }

  defstruct [:email, :sms]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      email: {Klaviyo.EmailSubscriptionParameters, :t},
      sms: {Klaviyo.SMSSubscriptionParameters, :t}
    ]
  end
end
