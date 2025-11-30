defmodule OpenAI.CreateVectorStoreFileBatchRequest do
  @moduledoc """
  Provides struct and type for a CreateVectorStoreFileBatchRequest
  """

  @type t :: %__MODULE__{
          attributes: map | nil,
          chunking_strategy:
            OpenAI.AutoChunkingStrategyRequestParam.t()
            | OpenAI.StaticChunkingStrategyRequestParam.t()
            | nil,
          file_ids: [String.t()]
        }

  defstruct [:attributes, :chunking_strategy, :file_ids]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: :map,
      chunking_strategy:
        {:union,
         [
           {OpenAI.AutoChunkingStrategyRequestParam, :t},
           {OpenAI.StaticChunkingStrategyRequestParam, :t}
         ]},
      file_ids: [:string]
    ]
  end
end
