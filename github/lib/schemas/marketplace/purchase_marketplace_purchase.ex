defmodule GitHub.Marketplace.PurchaseMarketplacePurchase do
  @moduledoc """
  Provides struct and type for a Marketplace.PurchaseMarketplacePurchase
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          billing_cycle: String.t() | nil,
          free_trial_ends_on: String.t() | nil,
          is_installed: boolean | nil,
          next_billing_date: String.t() | nil,
          on_free_trial: boolean | nil,
          plan: GitHub.Marketplace.ListingPlan.t() | nil,
          unit_count: integer | nil,
          updated_at: String.t() | nil
        }

  defstruct [
    :__info__,
    :billing_cycle,
    :free_trial_ends_on,
    :is_installed,
    :next_billing_date,
    :on_free_trial,
    :plan,
    :unit_count,
    :updated_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      billing_cycle: {:string, :generic},
      free_trial_ends_on: {:union, [{:string, :generic}, :null]},
      is_installed: :boolean,
      next_billing_date: {:union, [{:string, :generic}, :null]},
      on_free_trial: :boolean,
      plan: {GitHub.Marketplace.ListingPlan, :t},
      unit_count: {:union, [:integer, :null]},
      updated_at: {:string, :generic}
    ]
  end
end
