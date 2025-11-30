defmodule Affinda.ResumeSearchParametersLocation do
  @moduledoc """
  Provides struct and type for a ResumeSearchParametersLocation
  """

  @type t :: %__MODULE__{
          coordinates: Affinda.ResumeSearchParametersLocationCoordinates.t() | nil,
          distance: integer | nil,
          name: String.t() | nil,
          unit: String.t() | nil
        }

  defstruct [:coordinates, :distance, :name, :unit]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      coordinates: {Affinda.ResumeSearchParametersLocationCoordinates, :t},
      distance: :integer,
      name: :string,
      unit: {:enum, ["km", "mi"]}
    ]
  end
end
