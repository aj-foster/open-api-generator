defmodule CreateResponse do
  @moduledoc """
  Provides struct and type for a CreateResponse
  """

  @type t :: %__MODULE__{
          include: [String.t()] | nil,
          input:
            String.t()
            | [
                map
                | ComputerToolCall.t()
                | FileSearchToolCall.t()
                | FunctionToolCall.t()
                | OutputMessage.t()
                | ReasoningItem.t()
                | WebSearchToolCall.t()
              ]
            | nil,
          instructions: String.t() | nil,
          max_output_tokens: integer | nil,
          parallel_tool_calls: boolean | nil,
          previous_response_id: String.t() | nil,
          reasoning: Reasoning.t() | nil,
          store: boolean | nil,
          stream: boolean | nil,
          text: map | nil,
          tool_choice: ToolChoiceFunction.t() | ToolChoiceTypes.t() | String.t() | nil,
          tools:
            [ComputerTool.t() | FileSearchTool.t() | FunctionTool.t() | WebSearchTool.t()] | nil,
          truncation: String.t() | nil
        }

  defstruct [
    :include,
    :input,
    :instructions,
    :max_output_tokens,
    :parallel_tool_calls,
    :previous_response_id,
    :reasoning,
    :store,
    :stream,
    :text,
    :tool_choice,
    :tools,
    :truncation
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      include: [
        enum: [
          "file_search_call.results",
          "message.input_image.image_url",
          "computer_call_output.output.image_url"
        ]
      ],
      input:
        {:union,
         [
           {:string, :generic},
           [
             union: [
               :map,
               {ComputerToolCall, :t},
               {FileSearchToolCall, :t},
               {FunctionToolCall, :t},
               {OutputMessage, :t},
               {ReasoningItem, :t},
               {WebSearchToolCall, :t}
             ]
           ]
         ]},
      instructions: {:string, :generic},
      max_output_tokens: :integer,
      parallel_tool_calls: :boolean,
      previous_response_id: {:string, :generic},
      reasoning: {Reasoning, :t},
      store: :boolean,
      stream: :boolean,
      text: :map,
      tool_choice:
        {:union,
         [{ToolChoiceFunction, :t}, {ToolChoiceTypes, :t}, enum: ["none", "auto", "required"]]},
      tools: [
        union: [{ComputerTool, :t}, {FileSearchTool, :t}, {FunctionTool, :t}, {WebSearchTool, :t}]
      ],
      truncation: {:enum, ["auto", "disabled"]}
    ]
  end
end
