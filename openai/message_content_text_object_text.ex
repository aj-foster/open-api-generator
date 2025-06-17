defmodule MessageContentTextObjectText do
  @moduledoc """
  Provides struct and type for a MessageContentTextObjectText
  """

  @type t :: %__MODULE__{
          annotations: [
            MessageContentTextAnnotationsFileCitationObject.t()
            | MessageContentTextAnnotationsFilePathObject.t()
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
          {MessageContentTextAnnotationsFileCitationObject, :t},
          {MessageContentTextAnnotationsFilePathObject, :t}
        ]
      ],
      value: {:string, :generic}
    ]
  end
end
