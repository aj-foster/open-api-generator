defmodule Mollie.EntityBalanceReport do
  @moduledoc """
  Provides struct and type for a EntityBalanceReport
  """

  @type t :: %__MODULE__{
          _links: Mollie.EntityBalanceReportLinks.t(),
          balanceId: String.t(),
          from: String.t(),
          grouping: String.t(),
          resource: String.t(),
          timeZone: String.t(),
          totals: Mollie.EntityBalanceReportTotals.t(),
          until: String.t()
        }

  defstruct [:_links, :balanceId, :from, :grouping, :resource, :timeZone, :totals, :until]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: {Mollie.EntityBalanceReportLinks, :t},
      balanceId: {:string, :generic},
      from: {:string, :generic},
      grouping: {:enum, ["status-balances", "transaction-categories"]},
      resource: {:string, :generic},
      timeZone: {:string, :generic},
      totals: {Mollie.EntityBalanceReportTotals, :t},
      until: {:string, :generic}
    ]
  end
end
