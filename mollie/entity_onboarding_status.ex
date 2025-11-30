defmodule Mollie.EntityOnboardingStatus do
  @moduledoc """
  Provides struct and type for a EntityOnboardingStatus
  """

  @type t :: %__MODULE__{
          _links: Mollie.EntityOnboardingStatusLinks.t(),
          canReceivePayments: boolean,
          canReceiveSettlements: boolean,
          name: String.t(),
          resource: String.t(),
          signedUpAt: String.t(),
          status: Mollie.EntityOnboardingStatusStatus.t()
        }

  defstruct [
    :_links,
    :canReceivePayments,
    :canReceiveSettlements,
    :name,
    :resource,
    :signedUpAt,
    :status
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: {Mollie.EntityOnboardingStatusLinks, :t},
      canReceivePayments: :boolean,
      canReceiveSettlements: :boolean,
      name: :string,
      resource: :string,
      signedUpAt: :string,
      status: {Mollie.EntityOnboardingStatusStatus, :t}
    ]
  end
end
