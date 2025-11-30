defmodule Klaviyo.SMSChannel do
  @moduledoc """
  Provides struct and type for a SMSChannel
  """

  @type t :: %__MODULE__{marketing: Klaviyo.SMSMarketing.t() | nil}

  defstruct [:marketing]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [marketing: {Klaviyo.SMSMarketing, :t}]
  end
end
