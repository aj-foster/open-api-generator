defmodule BatchResponseSimplePublicObjectWithErrors do
  @moduledoc """
  Provides struct and type for a BatchResponseSimplePublicObjectWithErrors
  """

  @type t :: %__MODULE__{
          completedAt: DateTime.t(),
          errors: [StandardError.t()] | nil,
          links: BatchResponseSimplePublicObjectWithErrorsLinks.t() | nil,
          numErrors: integer | nil,
          requestedAt: DateTime.t() | nil,
          results: [SimplePublicObject.t()],
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
      completedAt: {:string, :date_time},
      errors: [{StandardError, :t}],
      links: {BatchResponseSimplePublicObjectWithErrorsLinks, :t},
      numErrors: :integer,
      requestedAt: {:string, :date_time},
      results: [{SimplePublicObject, :t}],
      startedAt: {:string, :date_time},
      status: {:enum, ["PENDING", "PROCESSING", "CANCELED", "COMPLETE"]}
    ]
  end
end
