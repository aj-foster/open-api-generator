defmodule CreateMessageRequestAttachments do
  @moduledoc """
  Provides struct and type for a CreateMessageRequestAttachments
  """

  @type t :: %__MODULE__{
          file_id: String.t() | nil,
          tools: [AssistantToolsCode.t() | AssistantToolsFileSearchTypeOnly.t()] | nil
        }

  defstruct [:file_id, :tools]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      file_id: {:string, :generic},
      tools: [union: [{AssistantToolsCode, :t}, {AssistantToolsFileSearchTypeOnly, :t}]]
    ]
  end
end
