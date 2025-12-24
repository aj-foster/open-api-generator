defmodule Mollie.EntityBalanceTransactionContextApplicationFee do
  @moduledoc """
  Provides struct and type for a EntityBalanceTransactionContextApplicationFee
  """

  @type t :: %__MODULE__{
          payingOwner: String.t() | nil,
          paymentDescription: String.t() | nil,
          paymentId: String.t() | nil
        }

  defstruct [:payingOwner, :paymentDescription, :paymentId]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [payingOwner: :string, paymentDescription: :string, paymentId: :string]
  end
end
