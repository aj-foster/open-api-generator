defmodule LocationAnnotationUpdateParsed do
  @moduledoc """
  Provides struct and type for a LocationAnnotationUpdateParsed
  """

  @type t :: %__MODULE__{
          apartmentNumber: String.t() | nil,
          city: String.t() | nil,
          country: String.t() | nil,
          countryCode: String.t() | nil,
          formatted: String.t() | nil,
          latitude: number | nil,
          longitude: number | nil,
          poBox: String.t() | nil,
          postalCode: String.t() | nil,
          rawInput: String.t() | nil,
          state: String.t() | nil,
          stateCode: String.t() | nil,
          street: String.t() | nil,
          streetNumber: String.t() | nil
        }

  defstruct [
    :apartmentNumber,
    :city,
    :country,
    :countryCode,
    :formatted,
    :latitude,
    :longitude,
    :poBox,
    :postalCode,
    :rawInput,
    :state,
    :stateCode,
    :street,
    :streetNumber
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      apartmentNumber: {:string, :generic},
      city: {:string, :generic},
      country: {:string, :generic},
      countryCode: {:string, :generic},
      formatted: {:string, :generic},
      latitude: :number,
      longitude: :number,
      poBox: {:string, :generic},
      postalCode: {:string, :generic},
      rawInput: {:string, :generic},
      state: {:string, :generic},
      stateCode: {:string, :generic},
      street: {:string, :generic},
      streetNumber: {:string, :generic}
    ]
  end
end
