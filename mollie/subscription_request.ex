defmodule Mollie.SubscriptionRequest do
  @moduledoc """
  Provides struct and type for a SubscriptionRequest
  """

  @type t :: %__MODULE__{
          _links: Mollie.SubscriptionRequestLinks.t() | nil,
          amount: Mollie.Amount.t() | nil,
          applicationFee: Mollie.SubscriptionRequestApplicationFee.t() | nil,
          canceledAt: String.t() | nil,
          createdAt: String.t() | nil,
          customerId: Mollie.SubscriptionRequestCustomerId.t() | nil,
          description: String.t() | nil,
          id: Mollie.SubscriptionRequestId.t() | nil,
          interval: String.t() | nil,
          mandateId: String.t() | nil,
          metadata: map | String.t() | [String.t()] | nil,
          method: String.t() | nil,
          mode: String.t() | nil,
          nextPaymentDate: String.t() | nil,
          resource: String.t() | nil,
          startDate: String.t() | nil,
          status: Mollie.SubscriptionRequestStatus.t() | nil,
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
      _links: {Mollie.SubscriptionRequestLinks, :t},
      amount: {Mollie.Amount, :t},
      applicationFee: {Mollie.SubscriptionRequestApplicationFee, :t},
      canceledAt: {:union, [:string, :null]},
      createdAt: :string,
      customerId: {Mollie.SubscriptionRequestCustomerId, :t},
      description: :string,
      id: {Mollie.SubscriptionRequestId, :t},
      interval: :string,
      mandateId: :string,
      metadata: {:union, [:map, :string, [:string], :null]},
      method: {:enum, ["creditcard", "directdebit", "paypal", nil]},
      mode: {:enum, ["live", "test"]},
      nextPaymentDate: {:union, [:string, :null]},
      resource: :string,
      startDate: :string,
      status: {Mollie.SubscriptionRequestStatus, :t},
      testmode: {:union, [:boolean, :null]},
      times: {:union, [:integer, :null]},
      timesRemaining: {:union, [:integer, :null]},
      webhookUrl: :string
    ]
  end
end
