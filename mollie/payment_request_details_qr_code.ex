defmodule Mollie.PaymentRequestDetailsQrCode do
  @moduledoc """
  Provides struct and type for a PaymentRequestDetailsQrCode
  """

  @type t :: %__MODULE__{height: integer | nil, src: String.t() | nil, width: integer | nil}

  defstruct [:height, :src, :width]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [height: :integer, src: :string, width: :integer]
  end
end
