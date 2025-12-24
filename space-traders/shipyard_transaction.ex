defmodule SpaceTraders.ShipyardTransaction do
  @moduledoc """
  Provides struct and type for a ShipyardTransaction
  """

  @type t :: %__MODULE__{
          agentSymbol: String.t(),
          price: integer,
          shipSymbol: String.t(),
          shipType: String.t(),
          timestamp: DateTime.t(),
          waypointSymbol: String.t()
        }

  defstruct [:agentSymbol, :price, :shipSymbol, :shipType, :timestamp, :waypointSymbol]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      agentSymbol: :string,
      price: :integer,
      shipSymbol: :string,
      shipType: :string,
      timestamp: {:string, "date-time"},
      waypointSymbol: :string
    ]
  end
end
