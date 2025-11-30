defmodule OpenAI.CodeInterpreterTextOutput do
  @moduledoc """
  Provides struct and type for a CodeInterpreterTextOutput
  """

  @type t :: %__MODULE__{logs: String.t(), type: String.t()}

  defstruct [:logs, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [logs: :string, type: {:const, "logs"}]
  end
end
