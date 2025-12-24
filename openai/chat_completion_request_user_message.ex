defmodule OpenAI.ChatCompletionRequestUserMessage do
  @moduledoc """
  Provides struct and type for a ChatCompletionRequestUserMessage
  """

  @type t :: %__MODULE__{content: String.t() | [map], name: String.t() | nil, role: String.t()}

  defstruct [:content, :name, :role]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [content: {:union, [:string, [:map]]}, name: :string, role: {:const, "user"}]
  end
end
