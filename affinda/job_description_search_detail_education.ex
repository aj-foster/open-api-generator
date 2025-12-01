defmodule Affinda.JobDescriptionSearchDetailEducation do
  @moduledoc """
  Provides struct and type for a JobDescriptionSearchDetailEducation
  """

  @type t :: %__MODULE__{
          missing: Affinda.JobDescriptionSearchDetailEducationMissing.t() | nil,
          value: Affinda.JobDescriptionSearchDetailEducationValue.t() | nil
        }

  defstruct [:missing, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      missing: {Affinda.JobDescriptionSearchDetailEducationMissing, :t},
      value: {Affinda.JobDescriptionSearchDetailEducationValue, :t}
    ]
  end
end
