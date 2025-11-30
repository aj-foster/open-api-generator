defmodule Klaviyo.ProfileResponseObjectResourceAttributes do
  @moduledoc """
  Provides struct and type for a ProfileResponseObjectResourceAttributes
  """

  @type t :: %__MODULE__{
          created: DateTime.t() | nil,
          email: String.t() | nil,
          external_id: String.t() | nil,
          first_name: String.t() | nil,
          image: String.t() | nil,
          last_event_date: DateTime.t() | nil,
          last_name: String.t() | nil,
          location: Klaviyo.ProfileLocation.t() | nil,
          organization: String.t() | nil,
          phone_number: String.t() | nil,
          properties: map | nil,
          title: String.t() | nil,
          updated: DateTime.t() | nil
        }

  defstruct [
    :created,
    :email,
    :external_id,
    :first_name,
    :image,
    :last_event_date,
    :last_name,
    :location,
    :organization,
    :phone_number,
    :properties,
    :title,
    :updated
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created: {:string, "date-time"},
      email: :string,
      external_id: :string,
      first_name: :string,
      image: :string,
      last_event_date: {:string, "date-time"},
      last_name: :string,
      location: {Klaviyo.ProfileLocation, :t},
      organization: :string,
      phone_number: :string,
      properties: :map,
      title: :string,
      updated: {:string, "date-time"}
    ]
  end
end
