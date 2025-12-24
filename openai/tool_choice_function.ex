defmodule OpenAI.ToolChoiceFunction do
  @moduledoc """
  Provides struct and type for a ToolChoiceFunction
  """

  @type t :: %__MODULE__{name: String.t(), type: String.t()}

  defstruct [:name, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [name: :string, type: {:const, "function"}]
  end
end
