defmodule Mollie.EntityBalanceTransferResponse do
  @moduledoc """
  Provides struct and type for a EntityBalanceTransferResponse
  """

  @type t :: %__MODULE__{
          amount: Mollie.Amount.t(),
          category: String.t() | nil,
          createdAt: String.t(),
          description: String.t(),
          destination: Mollie.EntityBalanceTransferPartyResponse.t(),
          executedAt: String.t() | nil,
          id: Mollie.EntityBalanceTransferResponseId.t(),
          mode: String.t(),
          resource: String.t(),
          source: Mollie.EntityBalanceTransferPartyResponse.t(),
          status: String.t(),
          statusReason: Mollie.EntityBalanceTransferResponseStatusReason.t(),
          testmode: boolean | nil
        }

  defstruct [
    :amount,
    :category,
    :createdAt,
    :description,
    :destination,
    :executedAt,
    :id,
    :mode,
    :resource,
    :source,
    :status,
    :statusReason,
    :testmode
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount: {Mollie.Amount, :t},
      category:
        {:enum,
         [
           "invoice_collection",
           "purchase",
           "chargeback",
           "refund",
           "service_penalty",
           "discount_compensation",
           "manual_correction",
           "other_fee"
         ]},
      createdAt: :string,
      description: :string,
      destination: {Mollie.EntityBalanceTransferPartyResponse, :t},
      executedAt: {:union, [:string, :null]},
      id: {Mollie.EntityBalanceTransferResponseId, :t},
      mode: {:enum, ["live", "test"]},
      resource: :string,
      source: {Mollie.EntityBalanceTransferPartyResponse, :t},
      status: {:enum, ["created", "failed", "succeeded"]},
      statusReason: {Mollie.EntityBalanceTransferResponseStatusReason, :t},
      testmode: {:union, [:boolean, :null]}
    ]
  end
end
