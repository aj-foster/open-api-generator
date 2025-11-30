defmodule Mollie.RefundRequest do
  @moduledoc """
  Provides struct and type for a RefundRequest
  """

  @type t :: %__MODULE__{
          _links: Mollie.RefundRequestLinks.t() | nil,
          amount: Mollie.Amount.t() | nil,
          createdAt: String.t() | nil,
          description: String.t() | nil,
          externalReference: Mollie.RefundRequestExternalReference.t() | nil,
          id: Mollie.RefundRequestId.t() | nil,
          metadata: map | String.t() | [String.t()] | nil,
          mode: String.t() | nil,
          paymentId: Mollie.RefundRequestPaymentId.t() | nil,
          resource: String.t() | nil,
          reverseRouting: boolean | nil,
          routingReversals: [map] | nil,
          settlementAmount: Mollie.RefundRequestSettlementAmount.t() | nil,
          settlementId: String.t() | nil,
          status: Mollie.RefundRequestStatus.t() | nil,
          testmode: boolean | nil
        }

  defstruct [
    :_links,
    :amount,
    :createdAt,
    :description,
    :externalReference,
    :id,
    :metadata,
    :mode,
    :paymentId,
    :resource,
    :reverseRouting,
    :routingReversals,
    :settlementAmount,
    :settlementId,
    :status,
    :testmode
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: {Mollie.RefundRequestLinks, :t},
      amount: {Mollie.Amount, :t},
      createdAt: :string,
      description: :string,
      externalReference: {Mollie.RefundRequestExternalReference, :t},
      id: {Mollie.RefundRequestId, :t},
      metadata: {:union, [:map, :string, [:string], :null]},
      mode: {:enum, ["live", "test"]},
      paymentId: {Mollie.RefundRequestPaymentId, :t},
      resource: :string,
      reverseRouting: {:union, [:boolean, :null]},
      routingReversals: {:union, [[:map], :null]},
      settlementAmount: {Mollie.RefundRequestSettlementAmount, :t},
      settlementId: {:union, [:string, :null]},
      status: {Mollie.RefundRequestStatus, :t},
      testmode: {:union, [:boolean, :null]}
    ]
  end
end
