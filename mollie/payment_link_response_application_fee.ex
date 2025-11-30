defmodule Mollie.PaymentLinkResponseApplicationFee do
  @moduledoc """
  Provides struct and type for a PaymentLinkResponseApplicationFee
  """

  @type t :: %__MODULE__{amount: Mollie.Amount.t(), description: String.t()}

  defstruct [:amount, :description]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [amount: {Mollie.Amount, :t}, description: :string]
  end
end
