defmodule Affinda.ResumeDataWorkExperience do
  @moduledoc """
  Provides struct and type for a ResumeDataWorkExperience
  """

  @type t :: %__MODULE__{
          dates: Affinda.ResumeDataWorkExperienceDates.t() | nil,
          id: integer | nil,
          industry: String.t() | nil,
          jobDescription: String.t() | nil,
          jobTitle: String.t() | nil,
          location: Affinda.Location.t() | nil,
          occupation: Affinda.ResumeDataWorkExperienceOccupation.t() | nil,
          organization: String.t() | nil,
          socCode: String.t() | nil,
          socName: String.t() | nil
        }

  defstruct [
    :dates,
    :id,
    :industry,
    :jobDescription,
    :jobTitle,
    :location,
    :occupation,
    :organization,
    :socCode,
    :socName
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      dates: {Affinda.ResumeDataWorkExperienceDates, :t},
      id: :integer,
      industry: :string,
      jobDescription: :string,
      jobTitle: :string,
      location: {Affinda.Location, :t},
      occupation: {Affinda.ResumeDataWorkExperienceOccupation, :t},
      organization: :string,
      socCode: :string,
      socName: :string
    ]
  end
end
