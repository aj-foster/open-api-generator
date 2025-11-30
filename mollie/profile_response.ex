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
      businessCategory: {:string, :generic},
      countriesOfActivity: [string: :generic],
      createdAt: {:string, :generic},
      description: {:string, :generic},
      email: {:string, :generic},
      id: {:string, :generic},
      mode: {:enum, ["live", "test"]},
      name: {:string, :generic},
      phone: {:string, :generic},
      resource: {:string, :generic},
      review: {Mollie.ProfileResponseReview, :t},
      status: {Mollie.ProfileResponseStatus, :t},
      website: {:string, :generic}
    ]
  end
end
