defmodule Mollie.EntityRefundResponse do
  @moduledoc """
  Provides struct and type for a EntityRefundResponse
  """

  @type t :: %__MODULE__{
          _links: Mollie.EntityRefundResponseLinks.t(),
          amount: Mollie.Amount.t(),
          createdAt: String.t(),
          description: String.t(),
          externalReference: Mollie.EntityRefundResponseExternalReference.t() | nil,
          id: Mollie.EntityRefundResponseId.t(),
          metadata: map | String.t() | [String.t()] | nil,
          mode: String.t(),
          paymentId: Mollie.EntityRefundResponsePaymentId.t() | nil,
          resource: String.t(),
          reverseRouting: boolean | nil,
          routingReversals: [map] | nil,
          settlementAmount: Mollie.EntityRefundResponseSettlementAmount.t() | nil,
          settlementId: String.t() | nil,
          status: Mollie.EntityRefundResponseStatus.t(),
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
      _links: {Mollie.EntityRefundResponseLinks, :t},
      amount: {Mollie.Amount, :t},
      createdAt: :string,
      description: :string,
      externalReference: {Mollie.EntityRefundResponseExternalReference, :t},
      id: {Mollie.EntityRefundResponseId, :t},
      metadata: {:union, [:map, :string, [:string], :null]},
      mode: {:enum, ["live", "test"]},
      paymentId: {Mollie.EntityRefundResponsePaymentId, :t},
      resource: :string,
      reverseRouting: {:union, [:boolean, :null]},
      routingReversals: {:union, [[:map], :null]},
      settlementAmount: {Mollie.EntityRefundResponseSettlementAmount, :t},
      settlementId: {:union, [:string, :null]},
      status: {Mollie.EntityRefundResponseStatus, :t},
      testmode: {:union, [:boolean, :null]}
    ]
  end
end
