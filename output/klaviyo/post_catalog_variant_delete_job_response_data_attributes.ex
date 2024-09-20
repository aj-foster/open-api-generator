defmodule PostCatalogVariantDeleteJobResponseDataAttributes do
  @moduledoc """
  Provides struct and type for a PostCatalogVariantDeleteJobResponseDataAttributes
  """

  @type t :: %__MODULE__{
          completed_at: DateTime.t() | nil,
          completed_count: integer | nil,
          created_at: DateTime.t(),
          errors: [APIJobErrorPayload.t()] | nil,
          expires_at: DateTime.t() | nil,
          failed_count: integer | nil,
          status: String.t(),
          total_count: integer
        }

  defstruct [
    :completed_at,
    :completed_count,
    :created_at,
    :errors,
    :expires_at,
    :failed_count,
    :status,
    :total_count
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      completed_at: {:string, :date_time},
      completed_count: :integer,
      created_at: {:string, :date_time},
      errors: [{APIJobErrorPayload, :t}],
      expires_at: {:string, :date_time},
      failed_count: :integer,
      status: {:enum, ["cancelled", "complete", "processing", "queued"]},
      total_count: :integer
    ]
  end
end
