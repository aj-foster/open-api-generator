defmodule Affinda.ResumeDataWorkExperienceOccupation do
  @moduledoc """
  Provides struct and type for a ResumeDataWorkExperienceOccupation
  """

  @type t :: %__MODULE__{
          classification: Affinda.ResumeDataWorkExperienceOccupationClassification.t() | nil,
          emsiId: String.t() | nil,
          jobTitle: String.t() | nil,
          jobTitleNormalized: String.t() | nil,
          managementLevel: String.t() | nil
        }

  defstruct [:classification, :emsiId, :jobTitle, :jobTitleNormalized, :managementLevel]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      classification: {Affinda.ResumeDataWorkExperienceOccupationClassification, :t},
      emsiId: :string,
      jobTitle: :string,
      jobTitleNormalized: :string,
      managementLevel: {:enum, ["None", "Low", "Mid", "Upper"]}
    ]
  end
end
