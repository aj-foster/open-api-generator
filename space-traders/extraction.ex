defmodule SpaceTraders.Extraction do
  @moduledoc """
  Provides struct and type for a Extraction
  """

  @type t :: %__MODULE__{shipSymbol: String.t(), yield: SpaceTraders.ExtractionYield.t()}

  defstruct [:shipSymbol, :yield]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [shipSymbol: :string, yield: {SpaceTraders.ExtractionYield, :t}]
  end
end
