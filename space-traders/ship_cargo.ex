defmodule SpaceTraders.ShipCargo do
  @moduledoc """
  Provides struct and type for a ShipCargo
  """

  @type t :: %__MODULE__{
          capacity: integer,
          inventory: [SpaceTraders.ShipCargoItem.t()],
          units: integer
        }

  defstruct [:capacity, :inventory, :units]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [capacity: :integer, inventory: [{SpaceTraders.ShipCargoItem, :t}], units: :integer]
  end
end
