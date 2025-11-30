defmodule Mollie.PaymentResponseBillingAddress do
  @moduledoc """
  Provides struct and type for a PaymentResponseBillingAddress
  """

  @type t :: %__MODULE__{
          city: String.t() | nil,
          country: String.t() | nil,
          email: String.t() | nil,
          familyName: String.t() | nil,
          givenName: String.t() | nil,
          organizationName: map | nil,
          phone: String.t() | nil,
          postalCode: String.t() | nil,
          region: String.t() | nil,
          streetAdditional: String.t() | nil,
          streetAndNumber: String.t() | nil,
          title: String.t() | nil
        }

  defstruct [
    :city,
    :country,
    :email,
    :familyName,
    :givenName,
    :organizationName,
    :phone,
    :postalCode,
    :region,
    :streetAdditional,
    :streetAndNumber,
    :title
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      city: :string,
      country: :string,
      email: :string,
      familyName: :string,
      givenName: :string,
      organizationName: :map,
      phone: :string,
      postalCode: :string,
      region: :string,
      streetAdditional: :string,
      streetAndNumber: :string,
      title: :string
    ]
  end
end
