defmodule SpaceTraders.ShipFuel do
  @moduledoc """
  Provides struct and type for a ShipFuel
  """

  @type t :: %__MODULE__{
          capacity: integer,
          consumed: SpaceTraders.ShipFuelConsumed.t() | nil,
          current: integer
        }

  defstruct [:capacity, :consumed, :current]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [capacity: :integer, consumed: {SpaceTraders.ShipFuelConsumed, :t}, current: :integer]
  end
end
