defmodule Mollie.EntityRoute do
  @moduledoc """
  Provides struct and type for a EntityRoute
  """

  @type t :: %__MODULE__{
          _links: Mollie.EntityRouteLinks.t() | nil,
          amount: Mollie.Amount.t() | nil,
          description: String.t() | nil,
          destination: Mollie.EntityRouteDestination.t() | nil,
          id: Mollie.EntityRouteId.t() | nil,
          paymentId: Mollie.EntityRoutePaymentId.t() | nil,
          resource: String.t() | nil,
          testmode: boolean | nil
        }

  defstruct [:_links, :amount, :description, :destination, :id, :paymentId, :resource, :testmode]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: {Mollie.EntityRouteLinks, :t},
      amount: {Mollie.Amount, :t},
      description: :string,
      destination: {Mollie.EntityRouteDestination, :t},
      id: {Mollie.EntityRouteId, :t},
      paymentId: {Mollie.EntityRoutePaymentId, :t},
      resource: :string,
      testmode: {:union, [:boolean, :null]}
    ]
  end
end
