defmodule StabilityAI.TextPrompt do
  @moduledoc """
  Provides struct and type for a TextPrompt
  """

  @type t :: %__MODULE__{text: String.t(), weight: number | nil}

  defstruct [:text, :weight]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [text: :string, weight: {:number, "float"}]
  end
end
