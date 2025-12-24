defmodule SpaceTraders.Siphon do
  @moduledoc """
  Provides struct and type for a Siphon
  """

  @type t :: %__MODULE__{shipSymbol: String.t(), yield: SpaceTraders.SiphonYield.t()}

  defstruct [:shipSymbol, :yield]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [shipSymbol: :string, yield: {SpaceTraders.SiphonYield, :t}]
  end
end
