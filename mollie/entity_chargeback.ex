defmodule Mollie.EntityChargeback do
  @moduledoc """
  Provides struct and type for a EntityChargeback
  """

  @type t :: %__MODULE__{
          _links: Mollie.EntityChargebackLinks.t(),
          amount: Mollie.Amount.t(),
          createdAt: String.t(),
          id: Mollie.EntityChargebackId.t(),
          paymentId: Mollie.EntityChargebackPaymentId.t(),
          reason: Mollie.EntityChargebackReason.t() | nil,
          resource: String.t(),
          reversedAt: String.t() | nil,
          settlementAmount: Mollie.EntityChargebackSettlementAmount.t() | nil,
          settlementId: String.t() | nil
        }

  defstruct [
    :_links,
    :amount,
    :createdAt,
    :id,
    :paymentId,
    :reason,
    :resource,
    :reversedAt,
    :settlementAmount,
    :settlementId
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: {Mollie.EntityChargebackLinks, :t},
      amount: {Mollie.Amount, :t},
      createdAt: :string,
      id: {Mollie.EntityChargebackId, :t},
      paymentId: {Mollie.EntityChargebackPaymentId, :t},
      reason: {:union, [{Mollie.EntityChargebackReason, :t}, :null]},
      resource: :string,
      reversedAt: {:union, [:string, :null]},
      settlementAmount: {Mollie.EntityChargebackSettlementAmount, :t},
      settlementId: {:union, [:string, :null]}
    ]
  end
end
