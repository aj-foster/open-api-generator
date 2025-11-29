defmodule SubscribedMembershipPlan do
  @moduledoc """
  Provides struct and type for a SubscribedMembershipPlan
  """

  @type t :: %__MODULE__{
          benefits: [String.t()],
          currency: String.t(),
          description: String.t(),
          membershipId: integer,
          price: number,
          title: String.t()
        }

  defstruct [:benefits, :currency, :description, :membershipId, :price, :title]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      benefits: [string: :generic],
      currency: {:enum, ["JPY", "TWD", "THB"]},
      description: {:string, :generic},
      membershipId: :integer,
      price: :number,
      title: {:string, :generic}
    ]
  end
end
