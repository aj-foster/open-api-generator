defmodule SpaceTraders.ShipCrew do
  @moduledoc """
  Provides struct and type for a ShipCrew
  """

  @type t :: %__MODULE__{
          capacity: integer,
          current: integer,
          morale: integer,
          required: integer,
          rotation: String.t(),
          wages: integer
        }

  defstruct [:capacity, :current, :morale, :required, :rotation, :wages]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      capacity: :integer,
      current: :integer,
      morale: :integer,
      required: :integer,
      rotation: {:enum, ["STRICT", "RELAXED"]},
      wages: :integer
    ]
  end
end
