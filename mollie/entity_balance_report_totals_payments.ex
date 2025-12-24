defmodule Mollie.EntityBalanceReportTotalsPayments do
  @moduledoc """
  Provides struct and type for a EntityBalanceReportTotalsPayments
  """

  @type t :: %__MODULE__{
          immediatelyAvailable: Mollie.SubGroup.t() | nil,
          movedToAvailable: Mollie.SubGroup.t() | nil,
          pending: Mollie.SubGroup.t() | nil
        }

  defstruct [:immediatelyAvailable, :movedToAvailable, :pending]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      immediatelyAvailable: {Mollie.SubGroup, :t},
      movedToAvailable: {Mollie.SubGroup, :t},
      pending: {Mollie.SubGroup, :t}
    ]
  end
end
