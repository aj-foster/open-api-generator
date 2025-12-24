defmodule OpenAI.VectorStoreSearchResultItem do
  @moduledoc """
  Provides struct and type for a VectorStoreSearchResultItem
  """

  @type t :: %__MODULE__{
          attributes: map | nil,
          content: [OpenAI.VectorStoreSearchResultContentObject.t()],
          file_id: String.t(),
          filename: String.t(),
          score: number
        }

  defstruct [:attributes, :content, :file_id, :filename, :score]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: :map,
      content: [{OpenAI.VectorStoreSearchResultContentObject, :t}],
      file_id: :string,
      filename: :string,
      score: :number
    ]
  end
end
