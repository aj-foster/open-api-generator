defmodule Klaviyo.ProfilePartialUpdateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a ProfilePartialUpdateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          anonymous_id: String.t() | nil,
          email: String.t() | nil,
          external_id: String.t() | nil,
          first_name: String.t() | nil,
          image: String.t() | nil,
          last_name: String.t() | nil,
          location: Klaviyo.ProfileLocation.t() | nil,
          organization: String.t() | nil,
          phone_number: String.t() | nil,
          properties: map | nil,
          title: String.t() | nil
        }

  defstruct [
    :anonymous_id,
    :email,
    :external_id,
    :first_name,
    :image,
    :last_name,
    :location,
    :organization,
    :phone_number,
    :properties,
    :title
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      anonymous_id: :string,
      email: :string,
      external_id: :string,
      first_name: :string,
      image: :string,
      last_name: :string,
      location: {Klaviyo.ProfileLocation, :t},
      organization: :string,
      phone_number: :string,
      properties: :map,
      title: :string
    ]
  end
end
