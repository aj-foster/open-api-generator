defmodule PostProfileImportJobResponseDataAttributes do
  @moduledoc """
  Provides struct and type for a PostProfileImportJobResponseDataAttributes
  """

  @type t :: %__MODULE__{
          completed_at: DateTime.t() | nil,
          completed_count: integer | nil,
          created_at: DateTime.t(),
          expires_at: DateTime.t() | nil,
          failed_count: integer | nil,
          started_at: DateTime.t() | nil,
          status: String.t(),
          total_count: integer
        }

  defstruct [
    :completed_at,
    :completed_count,
    :created_at,
    :expires_at,
    :failed_count,
    :started_at,
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
      expires_at: {:string, :date_time},
      failed_count: :integer,
      started_at: {:string, :date_time},
      status: {:enum, ["cancelled", "complete", "processing", "queued"]},
      total_count: :integer
    ]
  end
end
