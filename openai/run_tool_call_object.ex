defmodule OpenAI.RunToolCallObject do
  @moduledoc """
  Provides struct and type for a RunToolCallObject
  """

  @type t :: %__MODULE__{
          function: OpenAI.RunToolCallObjectFunction.t(),
          id: String.t(),
          type: String.t()
        }

  defstruct [:function, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [function: {OpenAI.RunToolCallObjectFunction, :t}, id: :string, type: {:const, "function"}]
  end
end
