defmodule Mollie.Address do
  @moduledoc """
  Provides struct and type for a Address
  """

  @type t :: %__MODULE__{
          city: String.t(),
          country: String.t(),
          postalCode: String.t(),
          streetAndNumber: String.t()
        }

  defstruct [:city, :country, :postalCode, :streetAndNumber]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [city: :string, country: :string, postalCode: :string, streetAndNumber: :string]
  end
end
