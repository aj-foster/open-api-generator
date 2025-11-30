defmodule SpaceTraders.WaypointFaction do
  @moduledoc """
  Provides struct and type for a WaypointFaction
  """

  @type t :: %__MODULE__{symbol: String.t()}

  defstruct [:symbol]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      symbol:
        {:enum,
         [
           "COSMIC",
           "VOID",
           "GALACTIC",
           "QUANTUM",
           "DOMINION",
           "ASTRO",
           "CORSAIRS",
           "OBSIDIAN",
           "AEGIS",
           "UNITED",
           "SOLITARY",
           "COBALT",
           "OMEGA",
           "ECHO",
           "LORDS",
           "CULT",
           "ANCIENTS",
           "SHADOW",
           "ETHEREAL"
         ]}
    ]
  end
end
