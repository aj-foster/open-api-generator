defmodule Affinda.JobDescriptionSearchDetailOccupationGroup do
  @moduledoc """
  Provides struct and type for a JobDescriptionSearchDetailOccupationGroup
  """

  @type t :: %__MODULE__{
          missing: [integer] | nil,
          value: Affinda.JobDescriptionSearchDetailOccupationGroupValue.t() | nil
        }

  defstruct [:missing, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [missing: [:integer], value: {Affinda.JobDescriptionSearchDetailOccupationGroupValue, :t}]
  end
end
