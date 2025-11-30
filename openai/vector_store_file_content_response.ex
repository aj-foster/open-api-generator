defmodule OpenAI.VectorStoreFileContentResponse do
  @moduledoc """
  Provides struct and type for a VectorStoreFileContentResponse
  """

  @type t :: %__MODULE__{
          data: [OpenAI.VectorStoreFileContentResponseData.t()],
          has_more: boolean,
          next_page: String.t() | nil,
          object: String.t()
        }

  defstruct [:data, :has_more, :next_page, :object]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{OpenAI.VectorStoreFileContentResponseData, :t}],
      has_more: :boolean,
      next_page: :string,
      object: {:const, "vector_store.file_content.page"}
    ]
  end
end
