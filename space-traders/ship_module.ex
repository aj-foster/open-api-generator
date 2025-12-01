defmodule SpaceTraders.ShipModule do
  @moduledoc """
  Provides struct and type for a ShipModule
  """

  @type t :: %__MODULE__{
          capacity: integer | nil,
          description: String.t(),
          name: String.t(),
          range: integer | nil,
          requirements: SpaceTraders.ShipRequirements.t(),
          symbol: String.t()
        }

  defstruct [:capacity, :description, :name, :range, :requirements, :symbol]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      capacity: :integer,
      description: :string,
      name: :string,
      range: :integer,
      requirements: {SpaceTraders.ShipRequirements, :t},
      symbol:
        {:enum,
         [
           "MODULE_MINERAL_PROCESSOR_I",
           "MODULE_GAS_PROCESSOR_I",
           "MODULE_CARGO_HOLD_I",
           "MODULE_CARGO_HOLD_II",
           "MODULE_CARGO_HOLD_III",
           "MODULE_CREW_QUARTERS_I",
           "MODULE_ENVOY_QUARTERS_I",
           "MODULE_PASSENGER_CABIN_I",
           "MODULE_MICRO_REFINERY_I",
           "MODULE_ORE_REFINERY_I",
           "MODULE_FUEL_REFINERY_I",
           "MODULE_SCIENCE_LAB_I",
           "MODULE_JUMP_DRIVE_I",
           "MODULE_JUMP_DRIVE_II",
           "MODULE_JUMP_DRIVE_III",
           "MODULE_WARP_DRIVE_I",
           "MODULE_WARP_DRIVE_II",
           "MODULE_WARP_DRIVE_III",
           "MODULE_SHIELD_GENERATOR_I",
           "MODULE_SHIELD_GENERATOR_II"
         ]}
    ]
  end
end
