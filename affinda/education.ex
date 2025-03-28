defmodule Education do
  @moduledoc """
  Provides struct and type for a Education
  """

  @type t :: %__MODULE__{
          accreditation: Accreditation.t() | nil,
          dates: map | nil,
          grade: map | nil,
          id: integer | nil,
          location: Location.t() | nil,
          organization: String.t() | nil
        }

  defstruct [:accreditation, :dates, :grade, :id, :location, :organization]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      accreditation: {Accreditation, :t},
      dates: :map,
      grade: :map,
      id: :integer,
      location: {Location, :t},
      organization: {:string, :generic}
    ]
  end
end
