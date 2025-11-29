defmodule JobDescriptionSearchDetailEducation do
  @moduledoc """
  Provides struct and type for a JobDescriptionSearchDetailEducation
  """

  @type t :: %__MODULE__{
          missing: JobDescriptionSearchDetailEducationMissing.t() | nil,
          value: JobDescriptionSearchDetailEducationValue.t() | nil
        }

  defstruct [:missing, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      missing: {JobDescriptionSearchDetailEducationMissing, :t},
      value: {JobDescriptionSearchDetailEducationValue, :t}
    ]
  end
end
