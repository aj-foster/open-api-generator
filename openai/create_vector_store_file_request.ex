defmodule CreateVectorStoreFileRequest do
  @moduledoc """
  Provides struct and type for a CreateVectorStoreFileRequest
  """

  @type t :: %__MODULE__{
          attributes: VectorStoreFileAttributes.t() | nil,
          chunking_strategy:
            AutoChunkingStrategyRequestParam.t() | StaticChunkingStrategyRequestParam.t() | nil,
          file_id: String.t()
        }

  defstruct [:attributes, :chunking_strategy, :file_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {VectorStoreFileAttributes, :t},
      chunking_strategy:
        {:union,
         [{AutoChunkingStrategyRequestParam, :t}, {StaticChunkingStrategyRequestParam, :t}]},
      file_id: {:string, :generic}
    ]
  end
end
