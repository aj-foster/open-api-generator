defmodule SpaceTraders.Construction do
  @moduledoc """
  Provides struct and type for a Construction
  """

  @type t :: %__MODULE__{
          isComplete: boolean,
          materials: [SpaceTraders.ConstructionMaterial.t()],
          symbol: String.t()
        }

  defstruct [:isComplete, :materials, :symbol]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [isComplete: :boolean, materials: [{SpaceTraders.ConstructionMaterial, :t}], symbol: :string]
  end
end
