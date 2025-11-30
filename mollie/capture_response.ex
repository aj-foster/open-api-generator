defmodule Mollie.CaptureResponse do
  @moduledoc """
  Provides struct and type for a CaptureResponse
  """

  @type t :: %__MODULE__{
          _links: Mollie.CaptureResponseLinks.t() | nil,
          amount: Mollie.AmountNullable.t() | nil,
          createdAt: String.t() | nil,
          description: String.t() | nil,
          id: Mollie.CaptureResponseId.t() | nil,
          metadata: map | String.t() | [String.t()] | nil,
          mode: String.t() | nil,
          paymentId: Mollie.CaptureResponsePaymentId.t() | nil,
          resource: String.t() | nil,
          settlementAmount: Mollie.CaptureResponseSettlementAmount.t() | nil,
          settlementId: String.t() | nil,
          shipmentId: String.t() | nil,
          status: Mollie.CaptureResponseStatus.t() | nil
        }

  defstruct [
    :_links,
    :amount,
    :createdAt,
    :description,
    :id,
    :metadata,
    :mode,
    :paymentId,
    :resource,
    :settlementAmount,
    :settlementId,
    :shipmentId,
    :status
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: {Mollie.CaptureResponseLinks, :t},
      amount: {:union, [{Mollie.AmountNullable, :t}, :null]},
      createdAt: {:string, :generic},
      description: {:string, :generic},
      id: {Mollie.CaptureResponseId, :t},
      metadata: {:union, [:map, {:string, :generic}, [string: :generic], :null]},
      mode: {:enum, ["live", "test"]},
      paymentId: {Mollie.CaptureResponsePaymentId, :t},
      resource: {:string, :generic},
      settlementAmount: {Mollie.CaptureResponseSettlementAmount, :t},
      settlementId: {:union, [{:string, :generic}, :null]},
      shipmentId: {:union, [{:string, :generic}, :null]},
      status: {Mollie.CaptureResponseStatus, :t}
    ]
  end
end
