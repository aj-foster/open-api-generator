defmodule Affinda.Location do
  @moduledoc """
  Provides struct and type for a Location
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
          rawInput: String.t(),
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
      apartmentNumber: :string,
      city: :string,
      country: :string,
      countryCode: :string,
      formatted: :string,
      latitude: :number,
      longitude: :number,
      poBox: :string,
      postalCode: :string,
      rawInput: :string,
      state: :string,
      stateCode: :string,
      street: :string,
      streetNumber: :string
    ]
  end
end
