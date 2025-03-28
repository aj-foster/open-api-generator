defmodule ResumeDataPhoneNumberDetails do
  @moduledoc """
  Provides struct and type for a ResumeDataPhoneNumberDetails
  """

  @type t :: %__MODULE__{
          countryCode: String.t() | nil,
          formattedNumber: String.t() | nil,
          internationalCountryCode: integer | nil,
          nationalNumber: String.t() | nil,
          rawText: String.t() | nil
        }

  defstruct [:countryCode, :formattedNumber, :internationalCountryCode, :nationalNumber, :rawText]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      countryCode: {:string, :generic},
      formattedNumber: {:string, :generic},
      internationalCountryCode: :integer,
      nationalNumber: {:string, :generic},
      rawText: {:string, :generic}
    ]
  end
end
