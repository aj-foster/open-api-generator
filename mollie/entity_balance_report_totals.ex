defmodule Mollie.EntityBalanceReportTotals do
  @moduledoc """
  Provides struct and type for a EntityBalanceReportTotals
  """

  @type t :: %__MODULE__{
          availableBalance: Mollie.EntityBalanceReportTotalsAvailableBalance.t() | nil,
          capital: Mollie.EntityBalanceReportTotalsCapital.t() | nil,
          chargebacks: Mollie.EntityBalanceReportTotalsChargebacks.t() | nil,
          close: Mollie.EntityBalanceReportTotalsClose.t() | nil,
          corrections: Mollie.EntityBalanceReportTotalsCorrections.t() | nil,
          "fee-prepayments": Mollie.EntityBalanceReportTotalsFeePrepayments.t() | nil,
          open: Mollie.EntityBalanceReportTotalsOpen.t() | nil,
          payments: Mollie.EntityBalanceReportTotalsPayments.t() | nil,
          pendingBalance: Mollie.EntityBalanceReportTotalsPendingBalance.t() | nil,
          refunds: Mollie.EntityBalanceReportTotalsRefunds.t() | nil,
          topups: Mollie.EntityBalanceReportTotalsTopups.t() | nil,
          transfers: Mollie.EntityBalanceReportTotalsTransfers.t() | nil
        }

  defstruct [
    :availableBalance,
    :capital,
    :chargebacks,
    :close,
    :corrections,
    :"fee-prepayments",
    :open,
    :payments,
    :pendingBalance,
    :refunds,
    :topups,
    :transfers
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      availableBalance: {:union, [{Mollie.EntityBalanceReportTotalsAvailableBalance, :t}, :null]},
      capital: {Mollie.EntityBalanceReportTotalsCapital, :t},
      chargebacks: {Mollie.EntityBalanceReportTotalsChargebacks, :t},
      close: {Mollie.EntityBalanceReportTotalsClose, :t},
      corrections: {Mollie.EntityBalanceReportTotalsCorrections, :t},
      "fee-prepayments": {Mollie.EntityBalanceReportTotalsFeePrepayments, :t},
      open: {Mollie.EntityBalanceReportTotalsOpen, :t},
      payments: {Mollie.EntityBalanceReportTotalsPayments, :t},
      pendingBalance: {:union, [{Mollie.EntityBalanceReportTotalsPendingBalance, :t}, :null]},
      refunds: {Mollie.EntityBalanceReportTotalsRefunds, :t},
      topups: {Mollie.EntityBalanceReportTotalsTopups, :t},
      transfers: {Mollie.EntityBalanceReportTotalsTransfers, :t}
    ]
  end
end
