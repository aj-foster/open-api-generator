defmodule Mollie.EntityBalanceTransactionContextCaptureRollingReserveRelease do
  @moduledoc """
  Provides struct and type for a EntityBalanceTransactionContextCaptureRollingReserveRelease
  """

  @type t :: %__MODULE__{
          captureDescription: String.t() | nil,
          captureId: String.t() | nil,
          paymentDescription: String.t() | nil,
          paymentId: String.t() | nil
        }

  defstruct [:captureDescription, :captureId, :paymentDescription, :paymentId]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      captureDescription: :string,
      captureId: :string,
      paymentDescription: :string,
      paymentId: :string
    ]
  end
end
