defmodule Klaviyo.StreetAddress do
  @moduledoc """
  Provides struct and type for a StreetAddress
  """

  @type t :: %__MODULE__{
          address1: String.t(),
          address2: String.t(),
          city: String.t(),
          country: String.t(),
          region: String.t(),
          zip: String.t()
        }

  defstruct [:address1, :address2, :city, :country, :region, :zip]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      address1: :string,
      address2: :string,
      city: :string,
      country: :string,
      region: :string,
      zip: :string
    ]
  end
end
