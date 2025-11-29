defmodule ProfileCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a ProfileCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          email: String.t() | nil,
          external_id: String.t() | nil,
          first_name: String.t() | nil,
          image: String.t() | nil,
          last_name: String.t() | nil,
          location: ProfileLocation.t() | nil,
          organization: String.t() | nil,
          phone_number: String.t() | nil,
          properties: map | nil,
          title: String.t() | nil
        }

  defstruct [
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
      email: {:string, :generic},
      external_id: {:string, :generic},
      first_name: {:string, :generic},
      image: {:string, :generic},
      last_name: {:string, :generic},
      location: {ProfileLocation, :t},
      organization: {:string, :generic},
      phone_number: {:string, :generic},
      properties: :map,
      title: {:string, :generic}
    ]
  end
end
