defmodule OpenAI.Embedding do
  @moduledoc """
  Provides struct and type for a Embedding
  """

  @type t :: %__MODULE__{embedding: [number], index: integer, object: String.t()}

  defstruct [:embedding, :index, :object]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [embedding: [:number], index: :integer, object: {:const, "embedding"}]
  end
end
