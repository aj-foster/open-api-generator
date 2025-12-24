defmodule OpenAI.VectorStoreFileObject do
  @moduledoc """
  Provides struct and type for a VectorStoreFileObject
  """

  @type t :: %__MODULE__{
          attributes: map | nil,
          chunking_strategy:
            OpenAI.OtherChunkingStrategyResponseParam.t()
            | OpenAI.StaticChunkingStrategyResponseParam.t()
            | nil,
          created_at: integer,
          id: String.t(),
          last_error: OpenAI.VectorStoreFileObjectLastError.t() | nil,
          object: String.t(),
          status: String.t(),
          usage_bytes: integer,
          vector_store_id: String.t()
        }

  defstruct [
    :attributes,
    :chunking_strategy,
    :created_at,
    :id,
    :last_error,
    :object,
    :status,
    :usage_bytes,
    :vector_store_id
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: :map,
      chunking_strategy:
        {:union,
         [
           {OpenAI.OtherChunkingStrategyResponseParam, :t},
           {OpenAI.StaticChunkingStrategyResponseParam, :t}
         ]},
      created_at: :integer,
      id: :string,
      last_error: {OpenAI.VectorStoreFileObjectLastError, :t},
      object: {:const, "vector_store.file"},
      status: {:enum, ["in_progress", "completed", "cancelled", "failed"]},
      usage_bytes: :integer,
      vector_store_id: :string
    ]
  end
end
