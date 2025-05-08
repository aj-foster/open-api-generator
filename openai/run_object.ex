defmodule RunObject do
  @moduledoc """
  Provides struct and type for a RunObject
  """

  @type t :: %__MODULE__{
          assistant_id: String.t(),
          cancelled_at: integer | nil,
          completed_at: integer | nil,
          created_at: integer,
          expires_at: integer | nil,
          failed_at: integer | nil,
          id: String.t(),
          incomplete_details: RunObjectIncompleteDetails.t() | nil,
          instructions: String.t(),
          last_error: RunObjectLastError.t() | nil,
          max_completion_tokens: integer | nil,
          max_prompt_tokens: integer | nil,
          metadata: Metadata.t(),
          model: String.t(),
          object: String.t(),
          parallel_tool_calls: boolean,
          required_action: RunObjectRequiredAction.t() | nil,
          response_format:
            ResponseFormatJsonObject.t()
            | ResponseFormatJsonSchema.t()
            | ResponseFormatText.t()
            | String.t(),
          started_at: integer | nil,
          status: String.t(),
          temperature: number | nil,
          thread_id: String.t(),
          tool_choice: RunObjectToolChoice.t(),
          tools: [
            AssistantToolsCode.t() | AssistantToolsFileSearch.t() | AssistantToolsFunction.t()
          ],
          top_p: number | nil,
          truncation_strategy: RunObjectTruncationStrategy.t(),
          usage: RunCompletionUsage.t()
        }

  defstruct [
    :assistant_id,
    :cancelled_at,
    :completed_at,
    :created_at,
    :expires_at,
    :failed_at,
    :id,
    :incomplete_details,
    :instructions,
    :last_error,
    :max_completion_tokens,
    :max_prompt_tokens,
    :metadata,
    :model,
    :object,
    :parallel_tool_calls,
    :required_action,
    :response_format,
    :started_at,
    :status,
    :temperature,
    :thread_id,
    :tool_choice,
    :tools,
    :top_p,
    :truncation_strategy,
    :usage
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      assistant_id: {:string, :generic},
      cancelled_at: :integer,
      completed_at: :integer,
      created_at: :integer,
      expires_at: :integer,
      failed_at: :integer,
      id: {:string, :generic},
      incomplete_details: {RunObjectIncompleteDetails, :t},
      instructions: {:string, :generic},
      last_error: {RunObjectLastError, :t},
      max_completion_tokens: :integer,
      max_prompt_tokens: :integer,
      metadata: {Metadata, :t},
      model: {:string, :generic},
      object: {:const, "thread.run"},
      parallel_tool_calls: :boolean,
      required_action: {RunObjectRequiredAction, :t},
      response_format:
        {:union,
         [
           {ResponseFormatJsonObject, :t},
           {ResponseFormatJsonSchema, :t},
           {ResponseFormatText, :t},
           const: "auto"
         ]},
      started_at: :integer,
      status:
        {:enum,
         [
           "queued",
           "in_progress",
           "requires_action",
           "cancelling",
           "cancelled",
           "failed",
           "completed",
           "incomplete",
           "expired"
         ]},
      temperature: :number,
      thread_id: {:string, :generic},
      tool_choice: {RunObjectToolChoice, :t},
      tools: [
        union: [
          {AssistantToolsCode, :t},
          {AssistantToolsFileSearch, :t},
          {AssistantToolsFunction, :t}
        ]
      ],
      top_p: :number,
      truncation_strategy: {RunObjectTruncationStrategy, :t},
      usage: {RunCompletionUsage, :t}
    ]
  end
end
