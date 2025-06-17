defmodule CreateVectorStoreRequest do
  @moduledoc """
  Provides struct and type for a CreateVectorStoreRequest
  """

  @type t :: %__MODULE__{
          chunking_strategy:
            AutoChunkingStrategyRequestParam.t() | StaticChunkingStrategyRequestParam.t() | nil,
          expires_after: VectorStoreExpirationAfter.t() | nil,
          file_ids: [String.t()] | nil,
          metadata: Metadata.t() | nil,
          name: String.t() | nil
        }

  defstruct [:chunking_strategy, :expires_after, :file_ids, :metadata, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      chunking_strategy:
        {:union,
         [{AutoChunkingStrategyRequestParam, :t}, {StaticChunkingStrategyRequestParam, :t}]},
      expires_after: {VectorStoreExpirationAfter, :t},
      file_ids: [string: :generic],
      metadata: {Metadata, :t},
      name: {:string, :generic}
    ]
  end
end
