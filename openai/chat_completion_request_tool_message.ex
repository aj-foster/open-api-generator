defmodule OpenAI.ChatCompletionRequestToolMessage do
  @moduledoc """
  Provides struct and type for a ChatCompletionRequestToolMessage
  """

  @type t :: %__MODULE__{content: String.t() | [map], role: String.t(), tool_call_id: String.t()}

  defstruct [:content, :role, :tool_call_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [content: {:union, [:string, [:map]]}, role: {:const, "tool"}, tool_call_id: :string]
  end
end
