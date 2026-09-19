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
      email: :string,
      id: {Mollie.EntityOrganizationId, :t},
      locale: :string,
      name: :string,
      registrationNumber: :string,
      resource: :string,
      vatNumber: {:union, [:string, :null]},
      vatRegulation: {:enum, ["dutch", "british", "shifted"]}
    ]
  end
end
