defmodule SpaceTraders.ScannedSystem do
  @moduledoc """
  Provides struct and type for a ScannedSystem
  """

  @type t :: %__MODULE__{
          distance: integer,
          sectorSymbol: String.t(),
          symbol: String.t(),
          type: String.t(),
          x: integer,
          y: integer
        }

  defstruct [:distance, :sectorSymbol, :symbol, :type, :x, :y]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      distance: :integer,
      sectorSymbol: :string,
      symbol: :string,
      type:
        {:enum,
         [
           "NEUTRON_STAR",
           "RED_STAR",
           "ORANGE_STAR",
           "BLUE_STAR",
           "YOUNG_STAR",
           "WHITE_DWARF",
           "BLACK_HOLE",
           "HYPERGIANT",
           "NEBULA",
           "UNSTABLE"
         ]},
      x: :integer,
      y: :integer
    ]
  end
end
