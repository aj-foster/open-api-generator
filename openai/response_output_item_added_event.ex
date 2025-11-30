defmodule OpenAI.ResponseOutputItemAddedEvent do
  @moduledoc """
  Provides struct and type for a ResponseOutputItemAddedEvent
  """

  @type t :: %__MODULE__{
          item:
            OpenAI.ComputerToolCall.t()
            | OpenAI.FileSearchToolCall.t()
            | OpenAI.FunctionToolCall.t()
            | OpenAI.OutputMessage.t()
            | OpenAI.ReasoningItem.t()
            | OpenAI.WebSearchToolCall.t(),
          output_index: integer,
          type: String.t()
        }

  defstruct [:item, :output_index, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      item:
        {:union,
         [
           {OpenAI.ComputerToolCall, :t},
           {OpenAI.FileSearchToolCall, :t},
           {OpenAI.FunctionToolCall, :t},
           {OpenAI.OutputMessage, :t},
           {OpenAI.ReasoningItem, :t},
           {OpenAI.WebSearchToolCall, :t}
         ]},
      output_index: :integer,
      type: {:const, "response.output_item.added"}
    ]
  end
end
