defmodule Mollie.ClientLinkRequest do
  @moduledoc """
  Provides struct and type for a ClientLinkRequest
  """

  @type t :: %__MODULE__{
          _links: Mollie.ClientLinkRequestLinks.t() | nil,
          address: Mollie.ClientLinkRequestAddress.t() | nil,
          id: String.t() | nil,
          name: String.t() | nil,
          owner: Mollie.ClientLinkRequestOwner.t() | nil,
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
      _links: {Mollie.ClientLinkRequestLinks, :t},
      address: {Mollie.ClientLinkRequestAddress, :t},
      id: :string,
      name: :string,
      owner: {Mollie.ClientLinkRequestOwner, :t},
      registrationNumber: {:union, [:string, :null]},
      resource: :string,
      vatNumber: {:union, [:string, :null]}
    ]
  end
end
