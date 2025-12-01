defmodule SpaceTraders.ScannedShipEngine do
  @moduledoc """
  Provides struct and type for a ScannedShipEngine
  """

  @type t :: %__MODULE__{symbol: String.t()}

  defstruct [:symbol]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [symbol: :string]
  end
end
