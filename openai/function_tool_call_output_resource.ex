defmodule OpenAI.FunctionToolCallOutputResource do
  @moduledoc """
  Provides struct and type for a FunctionToolCallOutputResource
  """

  @type t :: %__MODULE__{
          call_id: String.t() | nil,
          id: String.t() | nil,
          output: String.t() | nil,
          status: String.t() | nil,
          type: String.t() | nil
        }

  defstruct [:call_id, :id, :output, :status, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      call_id: :string,
      id: :string,
      output: :string,
      status: {:enum, ["in_progress", "completed", "incomplete"]},
      type: {:const, "function_call_output"}
    ]
  end
end
