defmodule CreateEmbeddingResponse do
  @moduledoc """
  Provides struct and type for a CreateEmbeddingResponse
  """

  @type t :: %__MODULE__{
          data: [Embedding.t()],
          model: String.t(),
          object: String.t(),
          usage: CreateEmbeddingResponseUsage.t()
        }

  defstruct [:data, :model, :object, :usage]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{Embedding, :t}],
      model: {:string, :generic},
      object: {:const, "list"},
      usage: {CreateEmbeddingResponseUsage, :t}
    ]
  end
end
