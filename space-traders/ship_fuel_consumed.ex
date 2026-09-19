defmodule SpaceTraders.ShipFuelConsumed do
  @moduledoc """
  Provides struct and type for a ShipFuelConsumed
  """

  @type t :: %__MODULE__{amount: integer, timestamp: DateTime.t()}

  defstruct [:amount, :timestamp]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [amount: :integer, timestamp: {:string, "date-time"}]
  end
end
