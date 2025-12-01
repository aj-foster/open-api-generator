defmodule Mollie.PaymentRequestDetailsReceipt do
  @moduledoc """
  Provides struct and type for a PaymentRequestDetailsReceipt
  """

  @type t :: %__MODULE__{
          applicationIdentifier: String.t() | nil,
          authorizationCode: String.t() | nil,
          cardReadMethod: String.t() | nil,
          cardVerificationMethod: String.t() | nil
        }

  defstruct [:applicationIdentifier, :authorizationCode, :cardReadMethod, :cardVerificationMethod]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      applicationIdentifier: {:union, [:string, :null]},
      authorizationCode: {:union, [:string, :null]},
      cardReadMethod:
        {:enum, ["chip", "magnetic-stripe", "near-field-communication", "contactless", "moto"]},
      cardVerificationMethod:
        {:enum,
         [
           "no-cvm-required",
           "online-pin",
           "offline-pin",
           "consumer-device",
           "signature",
           "signature-and-online-pin",
           "online-pin-and-signature",
           "none",
           "failed"
         ]}
    ]
  end
end
