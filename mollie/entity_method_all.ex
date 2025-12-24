defmodule Mollie.EntityMethodAll do
  @moduledoc """
  Provides struct and type for a EntityMethodAll
  """

  @type t :: %__MODULE__{
          _links: map | nil,
          description: String.t() | nil,
          id: String.t() | nil,
          image: map | nil,
          issuers: [map] | nil,
          maximumAmount: map | nil,
          minimumAmount: map | nil,
          pricing: [Mollie.EntityMethodAllPricing.t()] | nil,
          resource: String.t() | nil,
          status: String.t() | nil
        }

  defstruct [
    :_links,
    :description,
    :id,
    :image,
    :issuers,
    :maximumAmount,
    :minimumAmount,
    :pricing,
    :resource,
    :status
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: :map,
      description: :string,
      id: :string,
      image: :map,
      issuers: [:map],
      maximumAmount: :map,
      minimumAmount: :map,
      pricing: [{Mollie.EntityMethodAllPricing, :t}],
      resource: :string,
      status:
        {:enum,
         ["activated", "pending-boarding", "pending-review", "pending-external", "rejected"]}
    ]
  end
end
