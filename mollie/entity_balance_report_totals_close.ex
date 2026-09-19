defmodule Mollie.EntityBalanceReportTotalsClose do
  @moduledoc """
  Provides struct and type for a EntityBalanceReportTotalsClose
  """

  @type t :: %__MODULE__{available: Mollie.SubGroup.t() | nil, pending: Mollie.SubGroup.t() | nil}

  defstruct [:available, :pending]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [available: {Mollie.SubGroup, :t}, pending: {Mollie.SubGroup, :t}]
  end
end
