defmodule RedactConfig do
  @moduledoc """
  Provides struct and type for a RedactConfig
  """

  @type t :: %__MODULE__{
          redactDates: boolean | nil,
          redactEducationDetails: boolean | nil,
          redactGender: boolean | nil,
          redactHeadshot: boolean | nil,
          redactLocations: boolean | nil,
          redactPersonalDetails: boolean | nil,
          redactReferees: boolean | nil,
          redactWorkDetails: boolean | nil
        }

  defstruct [
    :redactDates,
    :redactEducationDetails,
    :redactGender,
    :redactHeadshot,
    :redactLocations,
    :redactPersonalDetails,
    :redactReferees,
    :redactWorkDetails
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      redactDates: :boolean,
      redactEducationDetails: :boolean,
      redactGender: :boolean,
      redactHeadshot: :boolean,
      redactLocations: :boolean,
      redactPersonalDetails: :boolean,
      redactReferees: :boolean,
      redactWorkDetails: :boolean
    ]
  end
end
