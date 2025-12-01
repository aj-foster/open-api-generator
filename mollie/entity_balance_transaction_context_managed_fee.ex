defmodule Mollie.EntityBalanceTransactionContextManagedFee do
  @moduledoc """
  Provides struct and type for a EntityBalanceTransactionContextManagedFee
  """

  @type t :: %__MODULE__{feeId: String.t() | nil, feeType: String.t() | nil}

  defstruct [:feeId, :feeType]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [feeId: :string, feeType: :string]
  end
end
