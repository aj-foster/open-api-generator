defmodule Mollie.EntityBalance do
  @moduledoc """
  Provides struct and type for a EntityBalance
  """

  @type t :: %__MODULE__{
          _links: Mollie.EntityBalanceLinks.t(),
          availableAmount: Mollie.EntityBalanceAvailableAmount.t(),
          createdAt: String.t(),
          currency: Mollie.EntityBalanceCurrency.t(),
          description: String.t(),
          id: Mollie.EntityBalanceId.t(),
          mode: String.t(),
          pendingAmount: Mollie.EntityBalancePendingAmount.t(),
          resource: String.t(),
          status: Mollie.EntityBalanceStatus.t(),
          transferDestination: Mollie.EntityBalanceTransferDestination.t() | nil,
          transferFrequency: Mollie.EntityBalanceTransferFrequency.t() | nil,
          transferReference: String.t() | nil,
          transferThreshold: Mollie.EntityBalanceTransferThreshold.t() | nil
        }

  defstruct [
    :_links,
    :availableAmount,
    :createdAt,
    :currency,
    :description,
    :id,
    :mode,
    :pendingAmount,
    :resource,
    :status,
    :transferDestination,
    :transferFrequency,
    :transferReference,
    :transferThreshold
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: {Mollie.EntityBalanceLinks, :t},
      availableAmount: {Mollie.EntityBalanceAvailableAmount, :t},
      createdAt: :string,
      currency: {Mollie.EntityBalanceCurrency, :t},
      description: :string,
      id: {Mollie.EntityBalanceId, :t},
      mode: {:enum, ["live", "test"]},
      pendingAmount: {Mollie.EntityBalancePendingAmount, :t},
      resource: :string,
      status: {Mollie.EntityBalanceStatus, :t},
      transferDestination: {:union, [{Mollie.EntityBalanceTransferDestination, :t}, :null]},
      transferFrequency: {Mollie.EntityBalanceTransferFrequency, :t},
      transferReference: {:union, [:string, :null]},
      transferThreshold: {Mollie.EntityBalanceTransferThreshold, :t}
    ]
  end
end
