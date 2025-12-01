defmodule OpenAI.CreateVectorStoreFileRequest do
  @moduledoc """
  Provides struct and type for a CreateVectorStoreFileRequest
  """

  @type t :: %__MODULE__{
          attributes: map | nil,
          chunking_strategy:
            OpenAI.AutoChunkingStrategyRequestParam.t()
            | OpenAI.StaticChunkingStrategyRequestParam.t()
            | nil,
          file_id: String.t()
        }

  defstruct [:attributes, :chunking_strategy, :file_id]

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
      file_id: :string
    ]
  end
end
