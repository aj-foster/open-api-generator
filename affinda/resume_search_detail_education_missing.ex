defmodule ResumeSearchDetailEducationMissing do
  @moduledoc """
  Provides struct and type for a ResumeSearchDetailEducationMissing
  """

  @type t :: %__MODULE__{
          currentStudent: boolean | nil,
          degrees: [String.t()] | nil,
          highestDegreeTypes: [String.t()] | nil,
          institutions: [String.t()] | nil,
          recentGraduate: boolean | nil
        }

  defstruct [:currentStudent, :degrees, :highestDegreeTypes, :institutions, :recentGraduate]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      currentStudent: :boolean,
      degrees: [string: :generic],
      highestDegreeTypes: [string: :generic],
      institutions: [string: :generic],
      recentGraduate: :boolean
    ]
  end
end
