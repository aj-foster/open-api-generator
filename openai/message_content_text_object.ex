defmodule OpenAI.MessageContentTextObject do
  @moduledoc """
  Provides struct and type for a MessageContentTextObject
  """

  @type t :: %__MODULE__{text: OpenAI.MessageContentTextObjectText.t(), type: String.t()}

  defstruct [:text, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [text: {OpenAI.MessageContentTextObjectText, :t}, type: {:const, "text"}]
  end
end
