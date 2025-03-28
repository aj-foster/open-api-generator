defmodule SubscriptionChannels do
  @moduledoc """
  Provides struct and type for a SubscriptionChannels
  """

  @type t :: %__MODULE__{
          email: EmailSubscriptionParameters.t() | nil,
          sms: SMSSubscriptionParameters.t() | nil
        }

  defstruct [:email, :sms]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [email: {EmailSubscriptionParameters, :t}, sms: {SMSSubscriptionParameters, :t}]
  end
end
