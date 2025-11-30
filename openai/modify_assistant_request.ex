defmodule OpenAI.ModifyAssistantRequest do
  @moduledoc """
  Provides struct and type for a ModifyAssistantRequest
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          instructions: String.t() | nil,
          metadata: map | nil,
          model: String.t() | nil,
          name: String.t() | nil,
          reasoning_effort: String.t() | nil,
          response_format:
            OpenAI.ResponseFormatJsonObject.t()
            | OpenAI.ResponseFormatJsonSchema.t()
            | OpenAI.ResponseFormatText.t()
            | String.t()
            | nil,
          temperature: number | nil,
          tool_resources: OpenAI.ModifyAssistantRequestToolResources.t() | nil,
          tools:
            [
              OpenAI.AssistantToolsCode.t()
              | OpenAI.AssistantToolsFileSearch.t()
              | OpenAI.AssistantToolsFunction.t()
            ]
            | nil,
          top_p: number | nil
        }

  defstruct [
    :description,
    :instructions,
    :metadata,
    :model,
    :name,
    :reasoning_effort,
    :response_format,
    :temperature,
    :tool_resources,
    :tools,
    :top_p
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: :string,
      instructions: :string,
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
           ]
         ]},
      name: :string,
      reasoning_effort: {:enum, ["low", "medium", "high"]},
      response_format:
        {:union,
         [
           {OpenAI.ResponseFormatJsonObject, :t},
           {OpenAI.ResponseFormatJsonSchema, :t},
           {OpenAI.ResponseFormatText, :t},
           const: "auto"
         ]},
      temperature: :number,
      tool_resources: {OpenAI.ModifyAssistantRequestToolResources, :t},
      tools: [
        union: [
          {OpenAI.AssistantToolsCode, :t},
          {OpenAI.AssistantToolsFileSearch, :t},
          {OpenAI.AssistantToolsFunction, :t}
        ]
      ],
      top_p: :number
    ]
  end
end
