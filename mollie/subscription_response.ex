defmodule Mollie.SubscriptionResponse do
  @moduledoc """
  Provides struct and type for a SubscriptionResponse
  """

  @type t :: %__MODULE__{
          _links: Mollie.SubscriptionResponseLinks.t() | nil,
          amount: Mollie.Amount.t() | nil,
          applicationFee: Mollie.SubscriptionResponseApplicationFee.t() | nil,
          canceledAt: String.t() | nil,
          createdAt: String.t() | nil,
          customerId: Mollie.SubscriptionResponseCustomerId.t() | nil,
          description: String.t() | nil,
          id: Mollie.SubscriptionResponseId.t() | nil,
          interval: String.t() | nil,
          mandateId: String.t() | nil,
          metadata: map | String.t() | [String.t()] | nil,
          method: String.t() | nil,
          mode: String.t() | nil,
          nextPaymentDate: String.t() | nil,
          resource: String.t() | nil,
          startDate: String.t() | nil,
          status: Mollie.SubscriptionResponseStatus.t() | nil,
          testmode: boolean | nil,
          times: integer | nil,
          timesRemaining: integer | nil,
          webhookUrl: String.t() | nil
        }

  defstruct [
    :_links,
    :amount,
    :applicationFee,
    :canceledAt,
    :createdAt,
    :customerId,
    :description,
    :id,
    :interval,
    :mandateId,
    :metadata,
    :method,
    :mode,
    :nextPaymentDate,
    :resource,
    :startDate,
    :status,
    :testmode,
    :times,
    :timesRemaining,
    :webhookUrl
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: {Mollie.SubscriptionResponseLinks, :t},
      amount: {Mollie.Amount, :t},
      applicationFee: {Mollie.SubscriptionResponseApplicationFee, :t},
      canceledAt: {:union, [:string, :null]},
      createdAt: :string,
      customerId: {Mollie.SubscriptionResponseCustomerId, :t},
      description: :string,
      id: {Mollie.SubscriptionResponseId, :t},
      interval: :string,
      mandateId: :string,
      metadata: {:union, [:map, :string, [:string], :null]},
      method: {:enum, ["creditcard", "directdebit", "paypal", nil]},
      mode: {:enum, ["live", "test"]},
      nextPaymentDate: {:union, [:string, :null]},
      resource: :string,
      startDate: :string,
      status: {Mollie.SubscriptionResponseStatus, :t},
      testmode: {:union, [:boolean, :null]},
      times: {:union, [:integer, :null]},
      timesRemaining: {:union, [:integer, :null]},
      webhookUrl: :string
    ]
  end
end
