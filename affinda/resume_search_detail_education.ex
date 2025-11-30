defmodule Affinda.ResumeSearchDetailEducation do
  @moduledoc """
  Provides struct and type for a ResumeSearchDetailEducation
  """

  @type t :: %__MODULE__{
          missing: Affinda.ResumeSearchDetailEducationMissing.t() | nil,
          value: [Affinda.ResumeSearchDetailEducationValue.t()] | nil
        }

  defstruct [:missing, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      missing: {Affinda.ResumeSearchDetailEducationMissing, :t},
      value: [{Affinda.ResumeSearchDetailEducationValue, :t}]
    ]
  end
end
