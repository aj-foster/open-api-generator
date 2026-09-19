defmodule Mollie.RouteCreateResponse do
  @moduledoc """
  Provides struct and type for a RouteCreateResponse
  """

  @type t :: %__MODULE__{
          _links: map | nil,
          amount: Mollie.Amount.t() | nil,
          description: String.t() | nil,
          destination: map | nil,
          id: map | nil,
          paymentId: map | nil,
          resource: String.t() | nil,
          testmode: boolean | nil
        }

  defstruct [:_links, :amount, :description, :destination, :id, :paymentId, :resource, :testmode]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: :map,
      amount: {Mollie.Amount, :t},
      description: :string,
      destination: :map,
      id: :map,
      paymentId: :map,
      resource: :string,
      testmode: {:union, [:boolean, :null]}
    ]
  end
end
