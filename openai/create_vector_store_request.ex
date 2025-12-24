defmodule OpenAI.CreateVectorStoreRequest do
  @moduledoc """
  Provides struct and type for a CreateVectorStoreRequest
  """

  @type t :: %__MODULE__{
          chunking_strategy:
            OpenAI.AutoChunkingStrategyRequestParam.t()
            | OpenAI.StaticChunkingStrategyRequestParam.t()
            | nil,
          expires_after: OpenAI.VectorStoreExpirationAfter.t() | nil,
          file_ids: [String.t()] | nil,
          metadata: map | nil,
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
         [
           {OpenAI.AutoChunkingStrategyRequestParam, :t},
           {OpenAI.StaticChunkingStrategyRequestParam, :t}
         ]},
      expires_after: {OpenAI.VectorStoreExpirationAfter, :t},
      file_ids: [:string],
      metadata: :map,
      name: :string
    ]
  end
end
