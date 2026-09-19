defmodule OpenAI.ChatCompletionRequestAssistantMessageAudio do
  @moduledoc """
  Provides struct and type for a ChatCompletionRequestAssistantMessageAudio
  """

  @type t :: %__MODULE__{id: String.t()}

  defstruct [:id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: :string]
  end
end
