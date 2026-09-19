defmodule SpaceTraders.ShipMount do
  @moduledoc """
  Provides struct and type for a ShipMount
  """

  @type t :: %__MODULE__{
          deposits: [String.t()] | nil,
          description: String.t() | nil,
          name: String.t(),
          requirements: SpaceTraders.ShipRequirements.t(),
          strength: integer | nil,
          symbol: String.t()
        }

  defstruct [:deposits, :description, :name, :requirements, :strength, :symbol]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      deposits: [
        enum: [
          "QUARTZ_SAND",
          "SILICON_CRYSTALS",
          "PRECIOUS_STONES",
          "ICE_WATER",
          "AMMONIA_ICE",
          "IRON_ORE",
          "COPPER_ORE",
          "SILVER_ORE",
          "ALUMINUM_ORE",
          "GOLD_ORE",
          "PLATINUM_ORE",
          "DIAMONDS",
          "URANITE_ORE",
          "MERITIUM_ORE"
        ]
      ],
      description: :string,
      name: :string,
      requirements: {SpaceTraders.ShipRequirements, :t},
      strength: :integer,
      symbol:
        {:enum,
         [
           "MOUNT_GAS_SIPHON_I",
           "MOUNT_GAS_SIPHON_II",
           "MOUNT_GAS_SIPHON_III",
           "MOUNT_SURVEYOR_I",
           "MOUNT_SURVEYOR_II",
           "MOUNT_SURVEYOR_III",
           "MOUNT_SENSOR_ARRAY_I",
           "MOUNT_SENSOR_ARRAY_II",
           "MOUNT_SENSOR_ARRAY_III",
           "MOUNT_MINING_LASER_I",
           "MOUNT_MINING_LASER_II",
           "MOUNT_MINING_LASER_III",
           "MOUNT_LASER_CANNON_I",
           "MOUNT_MISSILE_LAUNCHER_I",
           "MOUNT_TURRET_I"
         ]}
    ]
  end
end
