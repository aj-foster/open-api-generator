defmodule Klaviyo.Subscriptions do
  @moduledoc """
  Provides struct and type for a Subscriptions
  """

  @type t :: %__MODULE__{email: Klaviyo.EmailChannel.t() | nil, sms: Klaviyo.SMSChannel.t() | nil}

  defstruct [:email, :sms]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [email: {Klaviyo.EmailChannel, :t}, sms: {Klaviyo.SMSChannel, :t}]
  end
end
