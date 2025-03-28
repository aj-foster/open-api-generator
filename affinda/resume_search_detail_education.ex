defmodule ResumeSearchDetailEducation do
  @moduledoc """
  Provides struct and type for a ResumeSearchDetailEducation
  """

  @type t :: %__MODULE__{
          missing: ResumeSearchDetailEducationMissing.t() | nil,
          value: [ResumeSearchDetailEducationValue.t()] | nil
        }

  defstruct [:missing, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      missing: {ResumeSearchDetailEducationMissing, :t},
      value: [{ResumeSearchDetailEducationValue, :t}]
    ]
  end
end
