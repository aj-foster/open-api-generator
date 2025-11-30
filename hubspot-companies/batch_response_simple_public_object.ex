defmodule HubSpot.Companies.BatchResponseSimplePublicObject do
  @moduledoc """
  Provides struct and type for a BatchResponseSimplePublicObject
  """

  @type t :: %__MODULE__{
          completedAt: DateTime.t(),
          links: map | nil,
          requestedAt: DateTime.t() | nil,
          results: [HubSpot.Companies.SimplePublicObject.t()],
          startedAt: DateTime.t(),
          status: String.t()
        }

  defstruct [:completedAt, :links, :requestedAt, :results, :startedAt, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      completedAt: {:string, :date_time},
      links: :map,
      requestedAt: {:string, :date_time},
      results: [{HubSpot.Companies.SimplePublicObject, :t}],
      startedAt: {:string, :date_time},
      status: {:enum, ["PENDING", "PROCESSING", "CANCELED", "COMPLETE"]}
    ]
  end
end
