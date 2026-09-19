defmodule Mollie.EntityMethod do
  @moduledoc """
  Provides struct and type for a EntityMethod
  """

  @type t :: %__MODULE__{
          _links: map,
          description: String.t(),
          id: String.t(),
          image: map,
          issuers: [map] | nil,
          maximumAmount: map,
          minimumAmount: map,
          resource: String.t(),
          status: String.t()
        }

  defstruct [
    :_links,
    :description,
    :id,
    :image,
    :issuers,
    :maximumAmount,
    :minimumAmount,
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
      resource: :string,
      status:
        {:enum,
         ["activated", "pending-boarding", "pending-review", "pending-external", "rejected"]}
    ]
  end
end
