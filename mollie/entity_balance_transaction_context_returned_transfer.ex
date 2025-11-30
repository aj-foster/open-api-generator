defmodule Mollie.EntityBalanceTransactionContextReturnedTransfer do
  @moduledoc """
  Provides struct and type for a EntityBalanceTransactionContextReturnedTransfer
  """

  @type t :: %__MODULE__{settlementId: String.t() | nil, transferId: String.t() | nil}

  defstruct [:settlementId, :transferId]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [settlementId: :string, transferId: :string]
  end
end
