defmodule OpenAI.Response do
  @moduledoc """
  Provides struct and type for a Response
  """

  @type t :: %__MODULE__{
          created_at: number | nil,
          error: OpenAI.ResponseError.t() | nil,
          id: String.t() | nil,
          incomplete_details: OpenAI.ResponseIncompleteDetails.t() | nil,
          instructions: String.t() | nil,
          max_output_tokens: integer | nil,
          metadata: map | nil,
          model: String.t() | nil,
          object: String.t() | nil,
          output:
            [
              OpenAI.ComputerToolCall.t()
              | OpenAI.FileSearchToolCall.t()
              | OpenAI.FunctionToolCall.t()
              | OpenAI.OutputMessage.t()
              | OpenAI.ReasoningItem.t()
              | OpenAI.WebSearchToolCall.t()
            ]
            | nil,
          output_text: String.t() | nil,
          parallel_tool_calls: boolean | nil,
          previous_response_id: String.t() | nil,
          reasoning: OpenAI.Reasoning.t() | nil,
          status: String.t() | nil,
          temperature: number | nil,
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
          top_p: number | nil,
          truncation: String.t() | nil,
          usage: OpenAI.ResponseUsage.t() | nil,
          user: String.t() | nil
        }

  defstruct [
    :created_at,
    :error,
    :id,
    :incomplete_details,
    :instructions,
    :max_output_tokens,
    :metadata,
    :model,
    :object,
    :output,
    :output_text,
    :parallel_tool_calls,
    :previous_response_id,
    :reasoning,
    :status,
    :temperature,
    :text,
    :tool_choice,
    :tools,
    :top_p,
    :truncation,
    :usage,
    :user
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: :number,
      error: {OpenAI.ResponseError, :t},
      id: :string,
      incomplete_details: {OpenAI.ResponseIncompleteDetails, :t},
      instructions: :string,
      max_output_tokens: :integer,
      metadata: :map,
      model:
        {:union,
         [
           :string,
           enum: [
             "o3-mini",
             "o3-mini-2025-01-31",
             "o1",
             "o1-2024-12-17",
             "o1-preview",
             "o1-preview-2024-09-12",
             "o1-mini",
             "o1-mini-2024-09-12",
             "computer-use-preview",
             "computer-use-preview-2025-02-04",
             "computer-use-preview-2025-03-11",
             "gpt-4.5-preview",
             "gpt-4.5-preview-2025-02-27",
             "gpt-4o",
             "gpt-4o-2024-11-20",
             "gpt-4o-2024-08-06",
             "gpt-4o-2024-05-13",
             "gpt-4o-audio-preview",
             "gpt-4o-audio-preview-2024-10-01",
             "gpt-4o-audio-preview-2024-12-17",
             "gpt-4o-mini-audio-preview",
             "gpt-4o-mini-audio-preview-2024-12-17",
             "chatgpt-4o-latest",
             "gpt-4o-mini",
             "gpt-4o-mini-2024-07-18",
             "gpt-4-turbo",
             "gpt-4-turbo-2024-04-09",
             "gpt-4-0125-preview",
             "gpt-4-turbo-preview",
             "gpt-4-1106-preview",
             "gpt-4-vision-preview",
             "gpt-4",
             "gpt-4-0314",
             "gpt-4-0613",
             "gpt-4-32k",
             "gpt-4-32k-0314",
             "gpt-4-32k-0613",
             "gpt-3.5-turbo",
             "gpt-3.5-turbo-16k",
             "gpt-3.5-turbo-0301",
             "gpt-3.5-turbo-0613",
             "gpt-3.5-turbo-1106",
             "gpt-3.5-turbo-0125",
             "gpt-3.5-turbo-16k-0613"
           ]
         ]},
      object: {:const, "response"},
      output: [
        union: [
          {OpenAI.ComputerToolCall, :t},
          {OpenAI.FileSearchToolCall, :t},
          {OpenAI.FunctionToolCall, :t},
          {OpenAI.OutputMessage, :t},
          {OpenAI.ReasoningItem, :t},
          {OpenAI.WebSearchToolCall, :t}
        ]
      ],
      output_text: :string,
      parallel_tool_calls: :boolean,
      previous_response_id: :string,
      reasoning: {OpenAI.Reasoning, :t},
      status: {:enum, ["completed", "failed", "in_progress", "incomplete"]},
      temperature: :number,
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
      top_p: :number,
      truncation: {:enum, ["auto", "disabled"]},
      usage: {OpenAI.ResponseUsage, :t},
      user: :string
    ]
  end
end
