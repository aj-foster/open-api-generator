defmodule OpenAI.MessageContentTextObjectText do
  @moduledoc """
  Provides struct and type for a MessageContentTextObjectText
  """

  @type t :: %__MODULE__{
          annotations: [
            OpenAI.MessageContentTextAnnotationsFileCitationObject.t()
            | OpenAI.MessageContentTextAnnotationsFilePathObject.t()
          ],
          value: String.t()
        }

  defstruct [:annotations, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      annotations: [
        union: [
          {OpenAI.MessageContentTextAnnotationsFileCitationObject, :t},
          {OpenAI.MessageContentTextAnnotationsFilePathObject, :t}
        ]
      ],
      value: :string
    ]
  end
end
