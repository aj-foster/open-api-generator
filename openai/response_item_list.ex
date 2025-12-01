defmodule OpenAI.ResponseItemList do
  @moduledoc """
  Provides struct and type for a ResponseItemList
  """

  @type t :: %__MODULE__{
          data: [
            OpenAI.ComputerToolCall.t()
            | OpenAI.ComputerToolCallOutputResource.t()
            | OpenAI.FileSearchToolCall.t()
            | OpenAI.FunctionToolCall.t()
            | OpenAI.FunctionToolCallOutputResource.t()
            | OpenAI.InputMessageResource.t()
            | OpenAI.OutputMessage.t()
            | OpenAI.WebSearchToolCall.t()
          ],
          first_id: String.t(),
          has_more: boolean,
          last_id: String.t(),
          object: String.t()
        }

  defstruct [:data, :first_id, :has_more, :last_id, :object]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [
        union: [
          {OpenAI.ComputerToolCall, :t},
          {OpenAI.ComputerToolCallOutputResource, :t},
          {OpenAI.FileSearchToolCall, :t},
          {OpenAI.FunctionToolCall, :t},
          {OpenAI.FunctionToolCallOutputResource, :t},
          {OpenAI.InputMessageResource, :t},
          {OpenAI.OutputMessage, :t},
          {OpenAI.WebSearchToolCall, :t}
        ]
      ],
      first_id: :string,
      has_more: :boolean,
      last_id: :string,
      object: {:const, "list"}
    ]
  end
end
