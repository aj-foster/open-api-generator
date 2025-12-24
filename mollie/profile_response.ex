defmodule Mollie.ProfileResponse do
  @moduledoc """
  Provides struct and type for a ProfileResponse
  """

  @type t :: %__MODULE__{
          _links: Mollie.ProfileResponseLinks.t() | nil,
          businessCategory: String.t() | nil,
          countriesOfActivity: [String.t()] | nil,
          createdAt: String.t() | nil,
          description: String.t() | nil,
          email: String.t() | nil,
          id: String.t() | nil,
          mode: String.t() | nil,
          name: String.t() | nil,
          phone: String.t() | nil,
          resource: String.t() | nil,
          review: Mollie.ProfileResponseReview.t() | nil,
          status: Mollie.ProfileResponseStatus.t() | nil,
          website: String.t() | nil
        }

  defstruct [
    :_links,
    :businessCategory,
    :countriesOfActivity,
    :createdAt,
    :description,
    :email,
    :id,
    :mode,
    :name,
    :phone,
    :resource,
    :review,
    :status,
    :website
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: {Mollie.ProfileResponseLinks, :t},
      businessCategory: :string,
      countriesOfActivity: [:string],
      createdAt: :string,
      description: :string,
      email: :string,
      id: :string,
      mode: {:enum, ["live", "test"]},
      name: :string,
      phone: :string,
      resource: :string,
      review: {Mollie.ProfileResponseReview, :t},
      status: {Mollie.ProfileResponseStatus, :t},
      website: :string
    ]
  end
end
