defmodule OpenAI.ResponseFunctionCallArgumentsDoneEvent do
  @moduledoc """
  Provides struct and type for a ResponseFunctionCallArgumentsDoneEvent
  """

  @type t :: %__MODULE__{
          arguments: String.t(),
          item_id: String.t(),
          output_index: integer,
          type: String.t()
        }

  defstruct [:arguments, :item_id, :output_index, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      arguments: :string,
      item_id: :string,
      output_index: :integer,
      type: {:const, "response.function_call_arguments.done"}
    ]
  end
end
