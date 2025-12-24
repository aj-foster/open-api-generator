defmodule Mollie.EntityBalanceTransferDestination do
  @moduledoc """
  Provides struct and type for a EntityBalanceTransferDestination
  """

  @type t :: %__MODULE__{
          bankAccount: String.t() | nil,
          beneficiaryName: String.t() | nil,
          type: String.t() | nil
        }

  defstruct [:bankAccount, :beneficiaryName, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [bankAccount: :string, beneficiaryName: :string, type: {:const, "bank-account"}]
  end
end
