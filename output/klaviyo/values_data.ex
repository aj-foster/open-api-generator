defmodule ValuesData do
  @moduledoc """
  Provides struct and type for a ValuesData
  """

  @type t :: %__MODULE__{groupings: map, statistics: map}

  defstruct [:groupings, :statistics]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [groupings: :map, statistics: :map]
  end
end
