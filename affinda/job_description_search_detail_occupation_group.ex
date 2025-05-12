defmodule JobDescriptionSearchDetailOccupationGroup do
  @moduledoc """
  Provides struct and type for a JobDescriptionSearchDetailOccupationGroup
  """

  @type t :: %__MODULE__{
          missing: [integer] | nil,
          value: JobDescriptionSearchDetailOccupationGroupValue.t() | nil
        }

  defstruct [:missing, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [missing: [:integer], value: {JobDescriptionSearchDetailOccupationGroupValue, :t}]
  end
end
