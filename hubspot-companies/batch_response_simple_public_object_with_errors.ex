defmodule HubSpot.Companies.BatchResponseSimplePublicObjectWithErrors do
  @moduledoc """
  Provides struct and type for a BatchResponseSimplePublicObjectWithErrors
  """

  @type t :: %__MODULE__{
          completedAt: DateTime.t(),
          errors: [HubSpot.Companies.StandardError.t()] | nil,
          links: map | nil,
          numErrors: integer | nil,
          requestedAt: DateTime.t() | nil,
          results: [HubSpot.Companies.SimplePublicObject.t()],
          startedAt: DateTime.t(),
          status: String.t()
        }

  defstruct [
    :completedAt,
    :errors,
    :links,
    :numErrors,
    :requestedAt,
    :results,
    :startedAt,
    :status
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      completedAt: {:string, "date-time"},
      errors: [{HubSpot.Companies.StandardError, :t}],
      links: :map,
      numErrors: {:integer, "int32"},
      requestedAt: {:string, "date-time"},
      results: [{HubSpot.Companies.SimplePublicObject, :t}],
      startedAt: {:string, "date-time"},
      status: {:enum, ["PENDING", "PROCESSING", "CANCELED", "COMPLETE"]}
    ]
  end
end
