defmodule SpaceTraders.ShipRegistration do
  @moduledoc """
  Provides struct and type for a ShipRegistration
  """

  @type t :: %__MODULE__{factionSymbol: String.t(), name: String.t(), role: String.t()}

  defstruct [:factionSymbol, :name, :role]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      factionSymbol: :string,
      name: :string,
      role:
        {:enum,
         [
           "FABRICATOR",
           "HARVESTER",
           "HAULER",
           "INTERCEPTOR",
           "EXCAVATOR",
           "TRANSPORT",
           "REPAIR",
           "SURVEYOR",
           "COMMAND",
           "CARRIER",
           "PATROL",
           "SATELLITE",
           "EXPLORER",
           "REFINERY"
         ]}
    ]
  end
end
