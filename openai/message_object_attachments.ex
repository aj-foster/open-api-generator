defmodule OpenAI.MessageObjectAttachments do
  @moduledoc """
  Provides struct and type for a MessageObjectAttachments
  """

  @type t :: %__MODULE__{
          file_id: String.t() | nil,
          tools:
            [OpenAI.AssistantToolsCode.t() | OpenAI.AssistantToolsFileSearchTypeOnly.t()] | nil
        }

  defstruct [:file_id, :tools]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      file_id: :string,
      tools: [
        union: [{OpenAI.AssistantToolsCode, :t}, {OpenAI.AssistantToolsFileSearchTypeOnly, :t}]
      ]
    ]
  end
end
