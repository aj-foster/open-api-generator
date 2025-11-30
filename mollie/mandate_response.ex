defmodule Mollie.MandateResponse do
  @moduledoc """
  Provides struct and type for a MandateResponse
  """

  @type t :: %__MODULE__{
          _links: Mollie.MandateResponseLinks.t() | nil,
          consumerAccount: String.t() | nil,
          consumerBic: String.t() | nil,
          consumerEmail: String.t() | nil,
          consumerName: String.t() | nil,
          createdAt: String.t() | nil,
          customerId: Mollie.MandateResponseCustomerId.t() | nil,
          details: Mollie.MandateResponseDetails.t() | nil,
          id: Mollie.MandateResponseId.t() | nil,
          mandateReference: String.t() | nil,
          method: String.t() | nil,
          mode: String.t() | nil,
          payPalVaultId: String.t() | nil,
          paypalBillingAgreementId: String.t() | nil,
          resource: String.t() | nil,
          signatureDate: String.t() | nil,
          status: Mollie.MandateResponseStatus.t() | nil,
          testmode: boolean | nil
        }

  defstruct [
    :_links,
    :consumerAccount,
    :consumerBic,
    :consumerEmail,
    :consumerName,
    :createdAt,
    :customerId,
    :details,
    :id,
    :mandateReference,
    :method,
    :mode,
    :payPalVaultId,
    :paypalBillingAgreementId,
    :resource,
    :signatureDate,
    :status,
    :testmode
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: {Mollie.MandateResponseLinks, :t},
      consumerAccount: {:union, [:string, :null]},
      consumerBic: {:union, [:string, :null]},
      consumerEmail: {:union, [:string, :null]},
      consumerName: :string,
      createdAt: :string,
      customerId: {Mollie.MandateResponseCustomerId, :t},
      details: {Mollie.MandateResponseDetails, :t},
      id: {Mollie.MandateResponseId, :t},
      mandateReference: {:union, [:string, :null]},
      method: {:enum, ["creditcard", "directdebit", "paypal"]},
      mode: {:enum, ["live", "test"]},
      payPalVaultId: {:union, [:string, :null]},
      paypalBillingAgreementId: {:union, [:string, :null]},
      resource: :string,
      signatureDate: {:union, [:string, :null]},
      status: {Mollie.MandateResponseStatus, :t},
      testmode: {:union, [:boolean, :null]}
    ]
  end
end
