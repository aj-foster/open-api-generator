defmodule Mollie.MandateRequest do
  @moduledoc """
  Provides struct and type for a MandateRequest
  """

  @type t :: %__MODULE__{
          _links: Mollie.MandateRequestLinks.t() | nil,
          consumerAccount: String.t() | nil,
          consumerBic: String.t() | nil,
          consumerEmail: String.t() | nil,
          consumerName: String.t() | nil,
          createdAt: String.t() | nil,
          customerId: Mollie.MandateRequestCustomerId.t() | nil,
          details: Mollie.MandateRequestDetails.t() | nil,
          id: Mollie.MandateRequestId.t() | nil,
          mandateReference: String.t() | nil,
          method: String.t() | nil,
          mode: String.t() | nil,
          payPalVaultId: String.t() | nil,
          paypalBillingAgreementId: String.t() | nil,
          resource: String.t() | nil,
          signatureDate: String.t() | nil,
          status: Mollie.MandateRequestStatus.t() | nil,
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
      _links: {Mollie.MandateRequestLinks, :t},
      consumerAccount: {:union, [{:string, :generic}, :null]},
      consumerBic: {:union, [{:string, :generic}, :null]},
      consumerEmail: {:union, [{:string, :generic}, :null]},
      consumerName: {:string, :generic},
      createdAt: {:string, :generic},
      customerId: {Mollie.MandateRequestCustomerId, :t},
      details: {Mollie.MandateRequestDetails, :t},
      id: {Mollie.MandateRequestId, :t},
      mandateReference: {:union, [{:string, :generic}, :null]},
      method: {:enum, ["creditcard", "directdebit", "paypal"]},
      mode: {:enum, ["live", "test"]},
      payPalVaultId: {:union, [{:string, :generic}, :null]},
      paypalBillingAgreementId: {:union, [{:string, :generic}, :null]},
      resource: {:string, :generic},
      signatureDate: {:union, [{:string, :generic}, :null]},
      status: {Mollie.MandateRequestStatus, :t},
      testmode: {:union, [:boolean, :null]}
    ]
  end
end
