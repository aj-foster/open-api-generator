defmodule Mollie.RouteGetResponse do
  @moduledoc """
  Provides struct and type for a RouteGetResponse
  """

  @type t :: %__MODULE__{
          _links: map | nil,
          amount: Mollie.Amount.t() | nil,
          createdAt: String.t() | nil,
          description: String.t() | nil,
          destination: map | nil,
          id: map | nil,
          paymentId: map | nil,
          resource: String.t() | nil,
          testmode: boolean | nil
        }

  defstruct [
    :_links,
    :amount,
    :createdAt,
    :description,
    :destination,
    :id,
    :paymentId,
    :resource,
    :testmode
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: :map,
      amount: {Mollie.Amount, :t},
      createdAt: {:string, :generic},
      description: {:string, :generic},
      destination: :map,
      id: :map,
      paymentId: :map,
      resource: {:string, :generic},
      testmode: {:union, [:boolean, :null]}
    ]
  end
end
