defmodule CreateRunRequest do
  @moduledoc """
  Provides struct and type for a CreateRunRequest
  """

  @type t :: %__MODULE__{
          additional_instructions: String.t() | nil,
          additional_messages: [CreateMessageRequest.t()] | nil,
          assistant_id: String.t(),
          instructions: String.t() | nil,
          max_completion_tokens: integer | nil,
          max_prompt_tokens: integer | nil,
          metadata: Metadata.t() | nil,
          model: String.t() | nil,
          parallel_tool_calls: boolean | nil,
          reasoning_effort: String.t() | nil,
          response_format:
            ResponseFormatJsonObject.t()
            | ResponseFormatJsonSchema.t()
            | ResponseFormatText.t()
            | String.t()
            | nil,
          stream: boolean | nil,
          temperature: number | nil,
          tool_choice: CreateRunRequestToolChoice.t() | nil,
          tools:
            [AssistantToolsCode.t() | AssistantToolsFileSearch.t() | AssistantToolsFunction.t()]
            | nil,
          top_p: number | nil,
          truncation_strategy: CreateRunRequestTruncationStrategy.t() | nil
        }

  defstruct [
    :additional_instructions,
    :additional_messages,
    :assistant_id,
    :instructions,
    :max_completion_tokens,
    :max_prompt_tokens,
    :metadata,
    :model,
    :parallel_tool_calls,
    :reasoning_effort,
    :response_format,
    :stream,
    :temperature,
    :tool_choice,
    :tools,
    :top_p,
    :truncation_strategy
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      additional_instructions: {:string, :generic},
      additional_messages: [{CreateMessageRequest, :t}],
      assistant_id: {:string, :generic},
      instructions: {:string, :generic},
      max_completion_tokens: :integer,
      max_prompt_tokens: :integer,
      metadata: {Metadata, :t},
      model:
        {:union,
         enum: [
           "o3-mini",
           "o3-mini-2025-01-31",
           "o1",
           "o1-2024-12-17",
           "gpt-4o",
           "gpt-4o-2024-11-20",
           "gpt-4o-2024-08-06",
           "gpt-4o-2024-05-13",
           "gpt-4o-mini",
           "gpt-4o-mini-2024-07-18",
           "gpt-4.5-preview",
           "gpt-4.5-preview-2025-02-27",
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
           "gpt-3.5-turbo-0613",
           "gpt-3.5-turbo-1106",
           "gpt-3.5-turbo-0125",
           "gpt-3.5-turbo-16k-0613"
         ],
         string: :generic},
      parallel_tool_calls: :boolean,
      reasoning_effort: {:enum, ["low", "medium", "high"]},
      response_format:
        {:union,
         [
           {ResponseFormatJsonObject, :t},
           {ResponseFormatJsonSchema, :t},
           {ResponseFormatText, :t},
           const: "auto"
         ]},
      stream: :boolean,
      temperature: :number,
      tool_choice: {CreateRunRequestToolChoice, :t},
      tools: [
        union: [
          {AssistantToolsCode, :t},
          {AssistantToolsFileSearch, :t},
          {AssistantToolsFunction, :t}
        ]
      ],
      top_p: :number,
      truncation_strategy: {CreateRunRequestTruncationStrategy, :t}
    ]
  end
end
