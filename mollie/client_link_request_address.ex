defmodule Mollie.ClientLinkRequestAddress do
  @moduledoc """
  Provides struct and type for a ClientLinkRequestAddress
  """

  @type t :: %__MODULE__{
          city: String.t() | nil,
          country: String.t(),
          postalCode: String.t() | nil,
          streetAndNumber: String.t() | nil
        }

  defstruct [:city, :country, :postalCode, :streetAndNumber]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      city: {:union, [:string, :null]},
      country: :string,
      postalCode: {:union, [:string, :null]},
      streetAndNumber: {:union, [:string, :null]}
    ]
  end
end
