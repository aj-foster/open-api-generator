defmodule OpenAI.CreateResponse do
  @moduledoc """
  Provides struct and type for a CreateResponse
  """

  @type t :: %__MODULE__{
          include: [String.t()] | nil,
          input:
            String.t()
            | [
                map
                | OpenAI.ComputerToolCall.t()
                | OpenAI.FileSearchToolCall.t()
                | OpenAI.FunctionToolCall.t()
                | OpenAI.OutputMessage.t()
                | OpenAI.ReasoningItem.t()
                | OpenAI.WebSearchToolCall.t()
              ]
            | nil,
          instructions: String.t() | nil,
          max_output_tokens: integer | nil,
          parallel_tool_calls: boolean | nil,
          previous_response_id: String.t() | nil,
          reasoning: OpenAI.Reasoning.t() | nil,
          store: boolean | nil,
          stream: boolean | nil,
          text: map | nil,
          tool_choice:
            OpenAI.ToolChoiceFunction.t() | OpenAI.ToolChoiceTypes.t() | String.t() | nil,
          tools:
            [
              OpenAI.ComputerTool.t()
              | OpenAI.FileSearchTool.t()
              | OpenAI.FunctionTool.t()
              | OpenAI.WebSearchTool.t()
            ]
            | nil,
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
           :string,
           [
             union: [
               :map,
               {OpenAI.ComputerToolCall, :t},
               {OpenAI.FileSearchToolCall, :t},
               {OpenAI.FunctionToolCall, :t},
               {OpenAI.OutputMessage, :t},
               {OpenAI.ReasoningItem, :t},
               {OpenAI.WebSearchToolCall, :t}
             ]
           ]
         ]},
      instructions: :string,
      max_output_tokens: :integer,
      parallel_tool_calls: :boolean,
      previous_response_id: :string,
      reasoning: {OpenAI.Reasoning, :t},
      store: :boolean,
      stream: :boolean,
      text: :map,
      tool_choice:
        {:union,
         [
           {OpenAI.ToolChoiceFunction, :t},
           {OpenAI.ToolChoiceTypes, :t},
           enum: ["none", "auto", "required"]
         ]},
      tools: [
        union: [
          {OpenAI.ComputerTool, :t},
          {OpenAI.FileSearchTool, :t},
          {OpenAI.FunctionTool, :t},
          {OpenAI.WebSearchTool, :t}
        ]
      ],
      truncation: {:enum, ["auto", "disabled"]}
    ]
  end
end
