defmodule Mollie.PaymentLinkResponseLinks do
  @moduledoc """
  Provides struct and type for a PaymentLinkResponseLinks
  """

  @type t :: %__MODULE__{paymentLink: Mollie.Url.t(), self: Mollie.Url.t()}

  defstruct [:paymentLink, :self]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [paymentLink: {Mollie.Url, :t}, self: {Mollie.Url, :t}]
  end
end
