defmodule Mollie.EntityCapture do
  @moduledoc """
  Provides struct and type for a EntityCapture
  """

  @type t :: %__MODULE__{
          _links: Mollie.EntityCaptureLinks.t() | nil,
          amount: Mollie.AmountNullable.t() | nil,
          createdAt: String.t() | nil,
          description: String.t() | nil,
          id: Mollie.EntityCaptureId.t() | nil,
          metadata: map | String.t() | [String.t()] | nil,
          mode: String.t() | nil,
          paymentId: Mollie.EntityCapturePaymentId.t() | nil,
          resource: String.t() | nil,
          settlementAmount: Mollie.EntityCaptureSettlementAmount.t() | nil,
          settlementId: String.t() | nil,
          shipmentId: String.t() | nil,
          status: Mollie.EntityCaptureStatus.t() | nil
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
      _links: {Mollie.EntityCaptureLinks, :t},
      amount: {:union, [{Mollie.AmountNullable, :t}, :null]},
      createdAt: :string,
      description: :string,
      id: {Mollie.EntityCaptureId, :t},
      metadata: {:union, [:map, :string, [:string], :null]},
      mode: {:enum, ["live", "test"]},
      paymentId: {Mollie.EntityCapturePaymentId, :t},
      resource: :string,
      settlementAmount: {Mollie.EntityCaptureSettlementAmount, :t},
      settlementId: {:union, [:string, :null]},
      shipmentId: {:union, [:string, :null]},
      status: {Mollie.EntityCaptureStatus, :t}
    ]
  end
end
