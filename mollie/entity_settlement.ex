defmodule Mollie.EntitySettlement do
  @moduledoc """
  Provides struct and type for a EntitySettlement
  """

  @type t :: %__MODULE__{
          _links: Mollie.EntitySettlementLinks.t(),
          amount: Mollie.EntitySettlementAmount.t(),
          balanceId: Mollie.EntitySettlementBalanceId.t(),
          createdAt: String.t() | nil,
          id: Mollie.EntitySettlementId.t(),
          invoiceId: String.t() | nil,
          periods: map | nil,
          reference: String.t() | nil,
          resource: String.t(),
          settledAt: String.t() | nil,
          status: Mollie.EntitySettlementStatus.t()
        }

  defstruct [
    :_links,
    :amount,
    :balanceId,
    :createdAt,
    :id,
    :invoiceId,
    :periods,
    :reference,
    :resource,
    :settledAt,
    :status
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: {Mollie.EntitySettlementLinks, :t},
      amount: {Mollie.EntitySettlementAmount, :t},
      balanceId: {Mollie.EntitySettlementBalanceId, :t},
      createdAt: {:string, :generic},
      id: {Mollie.EntitySettlementId, :t},
      invoiceId: {:union, [{:string, :generic}, :null]},
      periods: :map,
      reference: {:union, [{:string, :generic}, :null]},
      resource: {:string, :generic},
      settledAt: {:union, [{:string, :generic}, :null]},
      status: {Mollie.EntitySettlementStatus, :t}
    ]
  end
end
