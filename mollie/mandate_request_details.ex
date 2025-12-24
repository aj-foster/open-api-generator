defmodule Mollie.MandateRequestDetails do
  @moduledoc """
  Provides struct and type for a MandateRequestDetails
  """

  @type t :: %__MODULE__{
          cardExpiryDate: String.t() | nil,
          cardFingerprint: String.t() | nil,
          cardHolder: String.t() | nil,
          cardLabel: String.t() | nil,
          cardNumber: String.t() | nil,
          consumerAccount: String.t() | nil,
          consumerBic: String.t() | nil,
          consumerName: String.t() | nil
        }

  defstruct [
    :cardExpiryDate,
    :cardFingerprint,
    :cardHolder,
    :cardLabel,
    :cardNumber,
    :consumerAccount,
    :consumerBic,
    :consumerName
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      cardExpiryDate: {:union, [:string, :null]},
      cardFingerprint: {:union, [:string, :null]},
      cardHolder: {:union, [:string, :null]},
      cardLabel:
        {:enum,
         [
           "American Express",
           "Carta Si",
           "Carte Bleue",
           "Dankort",
           "Diners Club",
           "Discover",
           "JCB",
           "Laser",
           "Maestro",
           "Mastercard",
           "Unionpay",
           "Visa"
         ]},
      cardNumber: {:union, [:string, :null]},
      consumerAccount: {:union, [:string, :null]},
      consumerBic: {:union, [:string, :null]},
      consumerName: {:union, [:string, :null]}
    ]
  end
end
