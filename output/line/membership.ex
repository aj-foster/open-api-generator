defmodule Membership do
  @moduledoc """
  Provides struct and type for a Membership
  """

  @type t :: %__MODULE__{
          benefits: [String.t()],
          currency: String.t(),
          description: String.t(),
          isInAppPurchase: boolean,
          isPublished: boolean,
          memberCount: integer,
          memberLimit: integer | nil,
          membershipId: integer,
          price: number,
          title: String.t()
        }

  defstruct [
    :benefits,
    :currency,
    :description,
    :isInAppPurchase,
    :isPublished,
    :memberCount,
    :memberLimit,
    :membershipId,
    :price,
    :title
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      benefits: [string: :generic],
      currency: {:enum, ["JPY", "TWD", "THB"]},
      description: {:string, :generic},
      isInAppPurchase: :boolean,
      isPublished: :boolean,
      memberCount: :integer,
      memberLimit: :integer,
      membershipId: :integer,
      price: :number,
      title: {:string, :generic}
    ]
  end
end
