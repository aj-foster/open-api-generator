defmodule GitHub.User.MarketplacePurchase do
  @moduledoc """
  Provides struct and type for a User.MarketplacePurchase
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          account: GitHub.Marketplace.Account.t(),
          billing_cycle: String.t(),
          free_trial_ends_on: DateTime.t() | nil,
          next_billing_date: DateTime.t() | nil,
          on_free_trial: boolean,
          plan: GitHub.Marketplace.ListingPlan.t(),
          unit_count: integer | nil,
          updated_at: DateTime.t() | nil
        }

  defstruct [
    :__info__,
    :account,
    :billing_cycle,
    :free_trial_ends_on,
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
      account: {GitHub.Marketplace.Account, :t},
      billing_cycle: {:string, :generic},
      free_trial_ends_on: {:union, [{:string, :date_time}, :null]},
      next_billing_date: {:union, [{:string, :date_time}, :null]},
      on_free_trial: :boolean,
      plan: {GitHub.Marketplace.ListingPlan, :t},
      unit_count: {:union, [:integer, :null]},
      updated_at: {:union, [{:string, :date_time}, :null]}
    ]
  end
end
