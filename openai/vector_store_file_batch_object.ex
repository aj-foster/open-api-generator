defmodule OpenAI.VectorStoreFileBatchObject do
  @moduledoc """
  Provides struct and type for a VectorStoreFileBatchObject
  """

  @type t :: %__MODULE__{
          created_at: integer,
          file_counts: OpenAI.VectorStoreFileBatchObjectFileCounts.t(),
          id: String.t(),
          object: String.t(),
          status: String.t(),
          vector_store_id: String.t()
        }

  defstruct [:created_at, :file_counts, :id, :object, :status, :vector_store_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: :integer,
      file_counts: {OpenAI.VectorStoreFileBatchObjectFileCounts, :t},
      id: :string,
      object: {:const, "vector_store.files_batch"},
      status: {:enum, ["in_progress", "completed", "cancelled", "failed"]},
      vector_store_id: :string
    ]
  end
end
