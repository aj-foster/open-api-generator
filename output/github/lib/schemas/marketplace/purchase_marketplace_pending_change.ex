defmodule GitHub.Marketplace.PurchaseMarketplacePendingChange do
  @moduledoc """
  Provides struct and type for a Marketplace.PurchaseMarketplacePendingChange
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          effective_date: String.t() | nil,
          id: integer | nil,
          is_installed: boolean | nil,
          plan: GitHub.Marketplace.ListingPlan.t() | nil,
          unit_count: integer | nil
        }

  defstruct [:__info__, :effective_date, :id, :is_installed, :plan, :unit_count]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      effective_date: {:string, :generic},
      id: :integer,
      is_installed: :boolean,
      plan: {GitHub.Marketplace.ListingPlan, :t},
      unit_count: {:union, [:integer, :null]}
    ]
  end
end
