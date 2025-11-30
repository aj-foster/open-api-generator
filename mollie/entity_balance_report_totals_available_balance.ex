defmodule Mollie.EntityBalanceReportTotalsAvailableBalance do
  @moduledoc """
  Provides struct and type for a EntityBalanceReportTotalsAvailableBalance
  """

  @type t :: %__MODULE__{
          close: Mollie.SubGroup.t() | nil,
          immediatelyAvailable: Mollie.SubGroup.t() | nil,
          movedFromPending: Mollie.SubGroup.t() | nil,
          open: Mollie.SubGroup.t() | nil
        }

  defstruct [:close, :immediatelyAvailable, :movedFromPending, :open]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      close: {Mollie.SubGroup, :t},
      immediatelyAvailable: {Mollie.SubGroup, :t},
      movedFromPending: {Mollie.SubGroup, :t},
      open: {Mollie.SubGroup, :t}
    ]
  end
end
