defmodule GitHub.Marketplace.ListingPlan do
  @moduledoc """
  Provides struct and type for a Marketplace.ListingPlan
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          accounts_url: String.t(),
          bullets: [String.t()],
          description: String.t(),
          has_free_trial: boolean,
          id: integer,
          monthly_price_in_cents: integer,
          name: String.t(),
          number: integer,
          price_model: String.t(),
          state: String.t(),
          unit_name: String.t() | nil,
          url: String.t(),
          yearly_price_in_cents: integer
        }

  defstruct [
    :__info__,
    :accounts_url,
    :bullets,
    :description,
    :has_free_trial,
    :id,
    :monthly_price_in_cents,
    :name,
    :number,
    :price_model,
    :state,
    :unit_name,
    :url,
    :yearly_price_in_cents
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      accounts_url: {:string, :uri},
      bullets: [string: :generic],
      description: {:string, :generic},
      has_free_trial: :boolean,
      id: :integer,
      monthly_price_in_cents: :integer,
      name: {:string, :generic},
      number: :integer,
      price_model: {:enum, ["FREE", "FLAT_RATE", "PER_UNIT"]},
      state: {:string, :generic},
      unit_name: {:union, [{:string, :generic}, :null]},
      url: {:string, :uri},
      yearly_price_in_cents: :integer
    ]
  end
end
