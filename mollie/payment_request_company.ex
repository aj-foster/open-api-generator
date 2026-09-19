defmodule Mollie.PaymentRequestCompany do
  @moduledoc """
  Provides struct and type for a PaymentRequestCompany
  """

  @type t :: %__MODULE__{
          entityType: String.t() | nil,
          registrationNumber: String.t() | nil,
          vatNumber: String.t() | nil
        }

  defstruct [:entityType, :registrationNumber, :vatNumber]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [entityType: :string, registrationNumber: :string, vatNumber: :string]
  end
end
