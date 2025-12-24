defmodule SpaceTraders.WaypointModifier do
  @moduledoc """
  Provides struct and type for a WaypointModifier
  """

  @type t :: %__MODULE__{description: String.t(), name: String.t(), symbol: String.t()}

  defstruct [:description, :name, :symbol]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: :string,
      name: :string,
      symbol:
        {:enum, ["STRIPPED", "UNSTABLE", "RADIATION_LEAK", "CRITICAL_LIMIT", "CIVIL_UNREST"]}
    ]
  end
end
