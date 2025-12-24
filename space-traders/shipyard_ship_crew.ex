defmodule SpaceTraders.ShipyardShipCrew do
  @moduledoc """
  Provides struct and type for a ShipyardShipCrew
  """

  @type t :: %__MODULE__{capacity: integer, required: integer}

  defstruct [:capacity, :required]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [capacity: :integer, required: :integer]
  end
end
