defmodule OpenAI.CreateEmbeddingResponse do
  @moduledoc """
  Provides struct and type for a CreateEmbeddingResponse
  """

  @type t :: %__MODULE__{
          data: [OpenAI.Embedding.t()],
          model: String.t(),
          object: String.t(),
          usage: OpenAI.CreateEmbeddingResponseUsage.t()
        }

  defstruct [:data, :model, :object, :usage]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{OpenAI.Embedding, :t}],
      model: :string,
      object: {:const, "list"},
      usage: {OpenAI.CreateEmbeddingResponseUsage, :t}
    ]
  end
end
