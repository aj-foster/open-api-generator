defmodule VectorStoreObject do
  @moduledoc """
  Provides struct and type for a VectorStoreObject
  """

  @type t :: %__MODULE__{
          created_at: integer,
          expires_after: VectorStoreExpirationAfter.t() | nil,
          expires_at: integer | nil,
          file_counts: VectorStoreObjectFileCounts.t(),
          id: String.t(),
          last_active_at: integer | nil,
          metadata: map,
          name: String.t(),
          object: String.t(),
          status: String.t(),
          usage_bytes: integer
        }

  defstruct [
    :created_at,
    :expires_after,
    :expires_at,
    :file_counts,
    :id,
    :last_active_at,
    :metadata,
    :name,
    :object,
    :status,
    :usage_bytes
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: :integer,
      expires_after: {VectorStoreExpirationAfter, :t},
      expires_at: :integer,
      file_counts: {VectorStoreObjectFileCounts, :t},
      id: {:string, :generic},
      last_active_at: :integer,
      metadata: :map,
      name: {:string, :generic},
      object: {:const, "vector_store"},
      status: {:enum, ["expired", "in_progress", "completed"]},
      usage_bytes: :integer
    ]
  end
end
