defmodule OpenAI.ResponseTextAnnotationDeltaEvent do
  @moduledoc """
  Provides struct and type for a ResponseTextAnnotationDeltaEvent
  """

  @type t :: %__MODULE__{
          annotation: OpenAI.FileCitation.t() | OpenAI.FilePath.t() | OpenAI.UrlCitation.t(),
          annotation_index: integer,
          content_index: integer,
          item_id: String.t(),
          output_index: integer,
          type: String.t()
        }

  defstruct [:annotation, :annotation_index, :content_index, :item_id, :output_index, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      annotation:
        {:union, [{OpenAI.FileCitation, :t}, {OpenAI.FilePath, :t}, {OpenAI.UrlCitation, :t}]},
      annotation_index: :integer,
      content_index: :integer,
      item_id: :string,
      output_index: :integer,
      type: {:const, "response.output_text.annotation.added"}
    ]
  end
end
