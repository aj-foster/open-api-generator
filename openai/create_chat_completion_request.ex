defmodule CreateChatCompletionRequest do
  @moduledoc """
  Provides struct and type for a CreateChatCompletionRequest
  """

  @type t :: %__MODULE__{
          audio: CreateChatCompletionRequestAudio.t() | nil,
          frequency_penalty: number | nil,
          function_call: ChatCompletionFunctionCallOption.t() | String.t() | nil,
          functions: [ChatCompletionFunctions.t()] | nil,
          logit_bias: CreateChatCompletionRequestLogitBias.t() | nil,
          logprobs: boolean | nil,
          max_completion_tokens: integer | nil,
          max_tokens: integer | nil,
          messages:
            [
              ChatCompletionRequestAssistantMessage.t()
              | ChatCompletionRequestDeveloperMessage.t()
              | ChatCompletionRequestFunctionMessage.t()
              | ChatCompletionRequestSystemMessage.t()
              | ChatCompletionRequestToolMessage.t()
              | ChatCompletionRequestUserMessage.t()
            ]
            | nil,
          modalities: [String.t()] | nil,
          n: integer | nil,
          parallel_tool_calls: boolean | nil,
          prediction: PredictionContent.t() | nil,
          presence_penalty: number | nil,
          reasoning_effort: String.t() | nil,
          response_format:
            ResponseFormatJsonObject.t()
            | ResponseFormatJsonSchema.t()
            | ResponseFormatText.t()
            | nil,
          seed: integer | nil,
          service_tier: String.t() | nil,
          stop: String.t() | [String.t()] | nil,
          store: boolean | nil,
          stream: boolean | nil,
          stream_options: ChatCompletionStreamOptions.t() | nil,
          tool_choice: ChatCompletionNamedToolChoice.t() | String.t() | nil,
          tools: [ChatCompletionTool.t()] | nil,
          top_logprobs: integer | nil,
          web_search_options: WebSearch.t() | nil
        }

  defstruct [
    :audio,
    :frequency_penalty,
    :function_call,
    :functions,
    :logit_bias,
    :logprobs,
    :max_completion_tokens,
    :max_tokens,
    :messages,
    :modalities,
    :n,
    :parallel_tool_calls,
    :prediction,
    :presence_penalty,
    :reasoning_effort,
    :response_format,
    :seed,
    :service_tier,
    :stop,
    :store,
    :stream,
    :stream_options,
    :tool_choice,
    :tools,
    :top_logprobs,
    :web_search_options
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      audio: {CreateChatCompletionRequestAudio, :t},
      frequency_penalty: :number,
      function_call: {:union, [{ChatCompletionFunctionCallOption, :t}, enum: ["none", "auto"]]},
      functions: [{ChatCompletionFunctions, :t}],
      logit_bias: {CreateChatCompletionRequestLogitBias, :t},
      logprobs: :boolean,
      max_completion_tokens: :integer,
      max_tokens: :integer,
      messages: [
        union: [
          {ChatCompletionRequestAssistantMessage, :t},
          {ChatCompletionRequestDeveloperMessage, :t},
          {ChatCompletionRequestFunctionMessage, :t},
          {ChatCompletionRequestSystemMessage, :t},
          {ChatCompletionRequestToolMessage, :t},
          {ChatCompletionRequestUserMessage, :t}
        ]
      ],
      modalities: [enum: ["text", "audio"]],
      n: :integer,
      parallel_tool_calls: :boolean,
      prediction: {PredictionContent, :t},
      presence_penalty: :number,
      reasoning_effort: {:enum, ["low", "medium", "high"]},
      response_format:
        {:union,
         [
           {ResponseFormatJsonObject, :t},
           {ResponseFormatJsonSchema, :t},
           {ResponseFormatText, :t}
         ]},
      seed: :integer,
      service_tier: {:enum, ["auto", "default"]},
      stop: {:union, [{:string, :generic}, [string: :generic]]},
      store: :boolean,
      stream: :boolean,
      stream_options: {ChatCompletionStreamOptions, :t},
      tool_choice:
        {:union, [{ChatCompletionNamedToolChoice, :t}, enum: ["none", "auto", "required"]]},
      tools: [{ChatCompletionTool, :t}],
      top_logprobs: :integer,
      web_search_options: {WebSearch, :t}
    ]
  end
end
