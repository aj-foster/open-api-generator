defmodule OpenAI.FunctionToolCall do
  @moduledoc """
  Provides struct and type for a FunctionToolCall
  """

  @type t :: %__MODULE__{
          arguments: String.t(),
          call_id: String.t(),
          id: String.t(),
          name: String.t(),
          status: String.t() | nil,
          type: String.t()
        }

  defstruct [:arguments, :call_id, :id, :name, :status, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      arguments: :string,
      call_id: :string,
      id: :string,
      name: :string,
      status: {:enum, ["in_progress", "completed", "incomplete"]},
      type: {:const, "function_call"}
    ]
  end
end
