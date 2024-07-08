defmodule RegionBias do
  @moduledoc """
  Provides struct and type for a RegionBias
  """

  @type t :: %__MODULE__{
          countries: [String.t()] | nil,
          country: String.t() | nil,
          squareCoordinates: [number] | nil,
          strict: boolean | nil
        }

  defstruct [:countries, :country, :squareCoordinates, :strict]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      countries: [string: :generic],
      country: {:string, :generic},
      squareCoordinates: [:number],
      strict: :boolean
    ]
  end
end
