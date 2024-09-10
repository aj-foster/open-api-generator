defmodule Subscriptions do
  @moduledoc """
  Provides struct and type for a Subscriptions
  """

  @type t :: %__MODULE__{email: EmailChannel.t() | nil, sms: SMSChannel.t() | nil}

  defstruct [:email, :sms]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [email: {EmailChannel, :t}, sms: {SMSChannel, :t}]
  end
end
