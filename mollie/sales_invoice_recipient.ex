defmodule Mollie.SalesInvoiceRecipient do
  @moduledoc """
  Provides struct and type for a SalesInvoiceRecipient
  """

  @type t :: %__MODULE__{
          city: String.t(),
          country: String.t(),
          email: String.t(),
          familyName: String.t() | nil,
          givenName: String.t() | nil,
          locale: String.t(),
          organizationName: String.t() | nil,
          organizationNumber: String.t() | nil,
          phone: String.t() | nil,
          postalCode: String.t(),
          region: String.t() | nil,
          streetAdditional: String.t() | nil,
          streetAndNumber: String.t(),
          title: String.t() | nil,
          type: String.t(),
          vatNumber: String.t() | nil
        }

  defstruct [
    :city,
    :country,
    :email,
    :familyName,
    :givenName,
    :locale,
    :organizationName,
    :organizationNumber,
    :phone,
    :postalCode,
    :region,
    :streetAdditional,
    :streetAndNumber,
    :title,
    :type,
    :vatNumber
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      city: :string,
      country: :string,
      email: :string,
      familyName: {:union, [:string, :null]},
      givenName: {:union, [:string, :null]},
      locale:
        {:enum, ["en_US", "en_GB", "nl_NL", "nl_BE", "de_DE", "de_AT", "de_CH", "fr_FR", "fr_BE"]},
      organizationName: {:union, [:string, :null]},
      organizationNumber: {:union, [:string, :null]},
      phone: {:union, [:string, :null]},
      postalCode: :string,
      region: {:union, [:string, :null]},
      streetAdditional: {:union, [:string, :null]},
      streetAndNumber: :string,
      title: {:union, [:string, :null]},
      type: {:enum, ["consumer", "business"]},
      vatNumber: {:union, [:string, :null]}
    ]
  end
end
