defmodule SpaceTraders.ShipRequirements do
  @moduledoc """
  Provides struct and type for a ShipRequirements
  """

  @type t :: %__MODULE__{crew: integer | nil, power: integer | nil, slots: integer | nil}

  defstruct [:crew, :power, :slots]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [crew: :integer, power: :integer, slots: :integer]
  end
end
