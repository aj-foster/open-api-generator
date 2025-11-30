defmodule Mollie.EntityOrganization do
  @moduledoc """
  Provides struct and type for a EntityOrganization
  """

  @type t :: %__MODULE__{
          _links: Mollie.EntityOrganizationLinks.t(),
          address: Mollie.Address.t(),
          email: String.t(),
          id: Mollie.EntityOrganizationId.t(),
          locale: String.t(),
          name: String.t(),
          registrationNumber: String.t(),
          resource: String.t(),
          vatNumber: String.t() | nil,
          vatRegulation: String.t() | nil
        }

  defstruct [
    :_links,
    :address,
    :email,
    :id,
    :locale,
    :name,
    :registrationNumber,
    :resource,
    :vatNumber,
    :vatRegulation
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: {Mollie.EntityOrganizationLinks, :t},
      address: {Mollie.Address, :t},
      email: {:string, :generic},
      id: {Mollie.EntityOrganizationId, :t},
      locale: {:string, :generic},
      name: {:string, :generic},
      registrationNumber: {:string, :generic},
      resource: {:string, :generic},
      vatNumber: {:union, [{:string, :generic}, :null]},
      vatRegulation: {:enum, ["dutch", "british", "shifted"]}
    ]
  end
end
