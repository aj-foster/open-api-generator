defmodule Mollie.EntityMethodAllPricing do
  @moduledoc """
  Provides struct and type for a EntityMethodAllPricing
  """

  @type t :: %__MODULE__{
          description: String.t(),
          feeRegion: String.t() | nil,
          fixed: Mollie.Amount.t(),
          variable: String.t()
        }

  defstruct [:description, :feeRegion, :fixed, :variable]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: :string,
      feeRegion: {:union, [:string, :null]},
      fixed: {Mollie.Amount, :t},
      variable: :string
    ]
  end
end
