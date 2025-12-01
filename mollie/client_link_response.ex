defmodule Mollie.ClientLinkResponse do
  @moduledoc """
  Provides struct and type for a ClientLinkResponse
  """

  @type t :: %__MODULE__{
          _links: Mollie.ClientLinkResponseLinks.t() | nil,
          address: Mollie.ClientLinkResponseAddress.t() | nil,
          id: String.t() | nil,
          name: String.t() | nil,
          owner: Mollie.ClientLinkResponseOwner.t() | nil,
          registrationNumber: String.t() | nil,
          resource: String.t() | nil,
          vatNumber: String.t() | nil
        }

  defstruct [:_links, :address, :id, :name, :owner, :registrationNumber, :resource, :vatNumber]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: {Mollie.ClientLinkResponseLinks, :t},
      address: {Mollie.ClientLinkResponseAddress, :t},
      id: :string,
      name: :string,
      owner: {Mollie.ClientLinkResponseOwner, :t},
      registrationNumber: {:union, [:string, :null]},
      resource: :string,
      vatNumber: {:union, [:string, :null]}
    ]
  end
end
