defmodule SpaceTraders.ScrapTransaction do
  @moduledoc """
  Provides struct and type for a ScrapTransaction
  """

  @type t :: %__MODULE__{
          shipSymbol: String.t(),
          timestamp: DateTime.t(),
          totalPrice: integer,
          waypointSymbol: String.t()
        }

  defstruct [:shipSymbol, :timestamp, :totalPrice, :waypointSymbol]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      shipSymbol: :string,
      timestamp: {:string, "date-time"},
      totalPrice: :integer,
      waypointSymbol: :string
    ]
  end
end
