defmodule OpenAI.ChatCompletionFunctions do
  @moduledoc """
  Provides struct and type for a ChatCompletionFunctions
  """

  @type t :: %__MODULE__{description: String.t() | nil, name: String.t(), parameters: map | nil}

  defstruct [:description, :name, :parameters]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [description: :string, name: :string, parameters: :map]
  end
end
