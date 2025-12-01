defmodule OpenAI.ComputerToolCallSafetyCheck do
  @moduledoc """
  Provides struct and type for a ComputerToolCallSafetyCheck
  """

  @type t :: %__MODULE__{code: String.t(), id: String.t(), message: String.t()}

  defstruct [:code, :id, :message]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [code: :string, id: :string, message: :string]
  end
end
