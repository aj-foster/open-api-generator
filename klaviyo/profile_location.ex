defmodule Klaviyo.ProfileLocation do
  @moduledoc """
  Provides struct and type for a ProfileLocation
  """

  @type t :: %__MODULE__{
          address1: String.t() | nil,
          address2: String.t() | nil,
          city: String.t() | nil,
          country: String.t() | nil,
          ip: String.t() | nil,
          latitude: number | String.t() | nil,
          longitude: number | String.t() | nil,
          region: String.t() | nil,
          timezone: String.t() | nil,
          zip: String.t() | nil
        }

  defstruct [
    :address1,
    :address2,
    :city,
    :country,
    :ip,
    :latitude,
    :longitude,
    :region,
    :timezone,
    :zip
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      address1: :string,
      address2: :string,
      city: :string,
      country: :string,
      ip: :string,
      latitude: {:union, [:number, :string]},
      longitude: {:union, [:number, :string]},
      region: :string,
      timezone: :string,
      zip: :string
    ]
  end
end
