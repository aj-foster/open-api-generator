defmodule OpenAI.RunStepDetailsToolCallsFunctionObject do
  @moduledoc """
  Provides struct and type for a RunStepDetailsToolCallsFunctionObject
  """

  @type t :: %__MODULE__{
          function: OpenAI.RunStepDetailsToolCallsFunctionObjectFunction.t(),
          id: String.t(),
          type: String.t()
        }

  defstruct [:function, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      function: {OpenAI.RunStepDetailsToolCallsFunctionObjectFunction, :t},
      id: :string,
      type: {:const, "function"}
    ]
  end
end
