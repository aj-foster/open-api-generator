defmodule OpenAI.RunStepDetailsToolCallsFunctionObjectFunction do
  @moduledoc """
  Provides struct and type for a RunStepDetailsToolCallsFunctionObjectFunction
  """

  @type t :: %__MODULE__{arguments: String.t(), name: String.t(), output: String.t() | nil}

  defstruct [:arguments, :name, :output]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [arguments: :string, name: :string, output: :string]
  end
end
