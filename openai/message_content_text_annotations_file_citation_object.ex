defmodule MessageContentTextAnnotationsFileCitationObject do
  @moduledoc """
  Provides struct and type for a MessageContentTextAnnotationsFileCitationObject
  """

  @type t :: %__MODULE__{
          end_index: integer,
          file_citation: MessageContentTextAnnotationsFileCitationObjectFileCitation.t(),
          start_index: integer,
          text: String.t(),
          type: String.t()
        }

  defstruct [:end_index, :file_citation, :start_index, :text, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      end_index: :integer,
      file_citation: {MessageContentTextAnnotationsFileCitationObjectFileCitation, :t},
      start_index: :integer,
      text: {:string, :generic},
      type: {:const, "file_citation"}
    ]
  end
end
