defmodule ResumeSearchParametersLocationCoordinates do
  @moduledoc """
  Provides struct and type for a ResumeSearchParametersLocationCoordinates
  """

  @type t :: %__MODULE__{latitude: number | nil, longitude: number | nil}

  defstruct [:latitude, :longitude]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [latitude: :number, longitude: :number]
  end
end
