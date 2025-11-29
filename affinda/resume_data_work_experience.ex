defmodule ResumeDataWorkExperience do
  @moduledoc """
  Provides struct and type for a ResumeDataWorkExperience
  """

  @type t :: %__MODULE__{
          dates: ResumeDataWorkExperienceDates.t() | nil,
          id: integer | nil,
          industry: String.t() | nil,
          jobDescription: String.t() | nil,
          jobTitle: String.t() | nil,
          location: Location.t() | nil,
          occupation: ResumeDataWorkExperienceOccupation.t() | nil,
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
      dates: {ResumeDataWorkExperienceDates, :t},
      id: :integer,
      industry: {:string, :generic},
      jobDescription: {:string, :generic},
      jobTitle: {:string, :generic},
      location: {Location, :t},
      occupation: {ResumeDataWorkExperienceOccupation, :t},
      organization: {:string, :generic},
      socCode: {:string, :generic},
      socName: {:string, :generic}
    ]
  end
end
