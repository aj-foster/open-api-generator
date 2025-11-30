defmodule OpenAI.CreateChatCompletionRequest do
  @moduledoc """
  Provides struct and type for a CreateChatCompletionRequest
  """

  @type t :: %__MODULE__{
          audio: OpenAI.CreateChatCompletionRequestAudio.t() | nil,
          frequency_penalty: number | nil,
          function_call: OpenAI.ChatCompletionFunctionCallOption.t() | String.t() | nil,
          functions: [OpenAI.ChatCompletionFunctions.t()] | nil,
          logit_bias: map | nil,
          logprobs: boolean | nil,
          max_completion_tokens: integer | nil,
          max_tokens: integer | nil,
          messages:
            [
              OpenAI.ChatCompletionRequestAssistantMessage.t()
              | OpenAI.ChatCompletionRequestDeveloperMessage.t()
              | OpenAI.ChatCompletionRequestFunctionMessage.t()
              | OpenAI.ChatCompletionRequestSystemMessage.t()
              | OpenAI.ChatCompletionRequestToolMessage.t()
              | OpenAI.ChatCompletionRequestUserMessage.t()
            ]
            | nil,
          modalities: [String.t()] | nil,
          n: integer | nil,
          parallel_tool_calls: boolean | nil,
          prediction: OpenAI.PredictionContent.t() | nil,
          presence_penalty: number | nil,
          reasoning_effort: String.t() | nil,
          response_format:
            OpenAI.ResponseFormatJsonObject.t()
            | OpenAI.ResponseFormatJsonSchema.t()
            | OpenAI.ResponseFormatText.t()
            | nil,
          seed: integer | nil,
          service_tier: String.t() | nil,
          stop: String.t() | [String.t()] | nil,
          store: boolean | nil,
          stream: boolean | nil,
          stream_options: OpenAI.ChatCompletionStreamOptions.t() | nil,
          tool_choice: OpenAI.ChatCompletionNamedToolChoice.t() | String.t() | nil,
          tools: [OpenAI.ChatCompletionTool.t()] | nil,
          top_logprobs: integer | nil,
          web_search_options: OpenAI.WebSearch.t() | nil
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
      audio: {OpenAI.CreateChatCompletionRequestAudio, :t},
      frequency_penalty: :number,
      function_call:
        {:union, [{OpenAI.ChatCompletionFunctionCallOption, :t}, enum: ["none", "auto"]]},
      functions: [{OpenAI.ChatCompletionFunctions, :t}],
      logit_bias: :map,
      logprobs: :boolean,
      max_completion_tokens: :integer,
      max_tokens: :integer,
      messages: [
        union: [
          {OpenAI.ChatCompletionRequestAssistantMessage, :t},
          {OpenAI.ChatCompletionRequestDeveloperMessage, :t},
          {OpenAI.ChatCompletionRequestFunctionMessage, :t},
          {OpenAI.ChatCompletionRequestSystemMessage, :t},
          {OpenAI.ChatCompletionRequestToolMessage, :t},
          {OpenAI.ChatCompletionRequestUserMessage, :t}
        ]
      ],
      modalities: [enum: ["text", "audio"]],
      n: :integer,
      parallel_tool_calls: :boolean,
      prediction: {OpenAI.PredictionContent, :t},
      presence_penalty: :number,
      reasoning_effort: {:enum, ["low", "medium", "high"]},
      response_format:
        {:union,
         [
           {OpenAI.ResponseFormatJsonObject, :t},
           {OpenAI.ResponseFormatJsonSchema, :t},
           {OpenAI.ResponseFormatText, :t}
         ]},
      seed: :integer,
      service_tier: {:enum, ["auto", "default"]},
      stop: {:union, [:string, [:string]]},
      store: :boolean,
      stream: :boolean,
      stream_options: {OpenAI.ChatCompletionStreamOptions, :t},
      tool_choice:
        {:union, [{OpenAI.ChatCompletionNamedToolChoice, :t}, enum: ["none", "auto", "required"]]},
      tools: [{OpenAI.ChatCompletionTool, :t}],
      top_logprobs: :integer,
      web_search_options: {OpenAI.WebSearch, :t}
    ]
  end
end
