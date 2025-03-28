defmodule RunObjectRequiredActionSubmitToolOutputs do
  @moduledoc """
  Provides struct and type for a RunObjectRequiredActionSubmitToolOutputs
  """

  @type t :: %__MODULE__{tool_calls: [RunToolCallObject.t()]}

  defstruct [:tool_calls]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [tool_calls: [{RunToolCallObject, :t}]]
  end
end
