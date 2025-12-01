defmodule Mollie.EntityBalanceReportTotalsPendingBalance do
  @moduledoc """
  Provides struct and type for a EntityBalanceReportTotalsPendingBalance
  """

  @type t :: %__MODULE__{
          close: Mollie.SubGroup.t() | nil,
          movedToAvailable: Mollie.SubGroup.t() | nil,
          open: Mollie.SubGroup.t() | nil,
          pending: Mollie.SubGroup.t() | nil
        }

  defstruct [:close, :movedToAvailable, :open, :pending]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      close: {Mollie.SubGroup, :t},
      movedToAvailable: {Mollie.SubGroup, :t},
      open: {Mollie.SubGroup, :t},
      pending: {Mollie.SubGroup, :t}
    ]
  end
end
