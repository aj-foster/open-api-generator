defmodule Affinda.ResumeSearchDetailEducationValue do
  @moduledoc """
  Provides struct and type for a ResumeSearchDetailEducationValue
  """

  @type t :: %__MODULE__{
          accreditation: Affinda.Accreditation.t() | nil,
          dates: map | nil,
          grade: map | nil,
          id: integer | nil,
          location: Affinda.Location.t() | nil,
          match: boolean | nil,
          organization: String.t() | nil
        }

  defstruct [:accreditation, :dates, :grade, :id, :location, :match, :organization]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      accreditation: {Affinda.Accreditation, :t},
      dates: :map,
      grade: :map,
      id: :integer,
      location: {Affinda.Location, :t},
      match: :boolean,
      organization: :string
    ]
  end
end
