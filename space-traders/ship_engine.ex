defmodule SpaceTraders.ShipEngine do
  @moduledoc """
  Provides struct and type for a ShipEngine
  """

  @type t :: %__MODULE__{
          condition: number,
          description: String.t(),
          integrity: number,
          name: String.t(),
          quality: number,
          requirements: SpaceTraders.ShipRequirements.t(),
          speed: integer,
          symbol: String.t()
        }

  defstruct [
    :condition,
    :description,
    :integrity,
    :name,
    :quality,
    :requirements,
    :speed,
    :symbol
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      condition: {:number, "double"},
      description: :string,
      integrity: {:number, "double"},
      name: :string,
      quality: {:number, "integer"},
      requirements: {SpaceTraders.ShipRequirements, :t},
      speed: :integer,
      symbol:
        {:enum,
         [
           "ENGINE_IMPULSE_DRIVE_I",
           "ENGINE_ION_DRIVE_I",
           "ENGINE_ION_DRIVE_II",
           "ENGINE_HYPER_DRIVE_I"
         ]}
    ]
  end
end
