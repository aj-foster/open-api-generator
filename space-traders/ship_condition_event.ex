defmodule SpaceTraders.ShipConditionEvent do
  @moduledoc """
  Provides struct and type for a ShipConditionEvent
  """

  @type t :: %__MODULE__{
          component: String.t(),
          description: String.t(),
          name: String.t(),
          symbol: String.t()
        }

  defstruct [:component, :description, :name, :symbol]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      component: {:enum, ["FRAME", "REACTOR", "ENGINE"]},
      description: :string,
      name: :string,
      symbol:
        {:enum,
         [
           "REACTOR_OVERLOAD",
           "ENERGY_SPIKE_FROM_MINERAL",
           "SOLAR_FLARE_INTERFERENCE",
           "COOLANT_LEAK",
           "POWER_DISTRIBUTION_FLUCTUATION",
           "MAGNETIC_FIELD_DISRUPTION",
           "HULL_MICROMETEORITE_STRIKES",
           "STRUCTURAL_STRESS_FRACTURES",
           "CORROSIVE_MINERAL_CONTAMINATION",
           "THERMAL_EXPANSION_MISMATCH",
           "VIBRATION_DAMAGE_FROM_DRILLING",
           "ELECTROMAGNETIC_FIELD_INTERFERENCE",
           "IMPACT_WITH_EXTRACTED_DEBRIS",
           "FUEL_EFFICIENCY_DEGRADATION",
           "COOLANT_SYSTEM_AGEING",
           "DUST_MICROABRASIONS",
           "THRUSTER_NOZZLE_WEAR",
           "EXHAUST_PORT_CLOGGING",
           "BEARING_LUBRICATION_FADE",
           "SENSOR_CALIBRATION_DRIFT",
           "HULL_MICROMETEORITE_DAMAGE",
           "SPACE_DEBRIS_COLLISION",
           "THERMAL_STRESS",
           "VIBRATION_OVERLOAD",
           "PRESSURE_DIFFERENTIAL_STRESS",
           "ELECTROMAGNETIC_SURGE_EFFECTS",
           "ATMOSPHERIC_ENTRY_HEAT"
         ]}
    ]
  end
end
