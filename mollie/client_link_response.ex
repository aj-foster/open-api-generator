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
      id: {:string, :generic},
      name: {:string, :generic},
      owner: {Mollie.ClientLinkResponseOwner, :t},
      registrationNumber: {:union, [{:string, :generic}, :null]},
      resource: {:string, :generic},
      vatNumber: {:union, [{:string, :generic}, :null]}
    ]
  end
end
