defmodule Mollie.EntityBalanceTransferResponseStatusReason do
  @moduledoc """
  Provides struct and type for a EntityBalanceTransferResponseStatusReason
  """

  @type t :: %__MODULE__{code: String.t(), message: String.t()}

  defstruct [:code, :message]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code:
        {:enum,
         [
           "request_created",
           "success",
           "source_not_allowed",
           "destination_not_allowed",
           "insufficient_funds",
           "invalid_source_balance",
           "invalid_destination_balance",
           "transfer_request_expired",
           "transfer_limit_reached"
         ]},
      message: :string
    ]
  end
end
