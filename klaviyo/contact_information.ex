defmodule ContactInformation do
  @moduledoc """
  Provides struct and type for a ContactInformation
  """

  @type t :: %__MODULE__{
          default_sender_email: String.t(),
          default_sender_name: String.t(),
          organization_name: String.t(),
          street_address: StreetAddress.t(),
          website_url: String.t()
        }

  defstruct [
    :default_sender_email,
    :default_sender_name,
    :organization_name,
    :street_address,
    :website_url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      default_sender_email: {:string, :generic},
      default_sender_name: {:string, :generic},
      organization_name: {:string, :generic},
      street_address: {StreetAddress, :t},
      website_url: {:string, :generic}
    ]
  end
end
