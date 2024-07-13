defmodule OccupationGroup do
  @moduledoc """
  Provides struct and type for a OccupationGroup
  """

  @type t :: %__MODULE__{children: [OccupationGroup.t()], code: integer, name: String.t()}

  defstruct [:children, :code, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [children: [{OccupationGroup, :t}], code: :integer, name: {:string, :generic}]
  end
end
