defmodule ResponseOutputItemAddedEvent do
  @moduledoc """
  Provides struct and type for a ResponseOutputItemAddedEvent
  """

  @type t :: %__MODULE__{
          item:
            ComputerToolCall.t()
            | FileSearchToolCall.t()
            | FunctionToolCall.t()
            | OutputMessage.t()
            | ReasoningItem.t()
            | WebSearchToolCall.t(),
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
           {ComputerToolCall, :t},
           {FileSearchToolCall, :t},
           {FunctionToolCall, :t},
           {OutputMessage, :t},
           {ReasoningItem, :t},
           {WebSearchToolCall, :t}
         ]},
      output_index: :integer,
      type: {:const, "response.output_item.added"}
    ]
  end
end
