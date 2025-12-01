defmodule OpenAI.AssistantObject do
  @moduledoc """
  Provides struct and type for a AssistantObject
  """

  @type t :: %__MODULE__{
          created_at: integer,
          description: String.t() | nil,
          id: String.t(),
          instructions: String.t() | nil,
          metadata: map | nil,
          model: String.t(),
          name: String.t() | nil,
          object: String.t(),
          response_format:
            OpenAI.ResponseFormatJsonObject.t()
            | OpenAI.ResponseFormatJsonSchema.t()
            | OpenAI.ResponseFormatText.t()
            | String.t()
            | nil,
          temperature: number | nil,
          tool_resources: OpenAI.AssistantObjectToolResources.t() | nil,
          tools: [
            OpenAI.AssistantToolsCode.t()
            | OpenAI.AssistantToolsFileSearch.t()
            | OpenAI.AssistantToolsFunction.t()
          ],
          top_p: number | nil
        }

  defstruct [
    :created_at,
    :description,
    :id,
    :instructions,
    :metadata,
    :model,
    :name,
    :object,
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
      created_at: :integer,
      description: :string,
      id: :string,
      instructions: :string,
      metadata: :map,
      model: :string,
      name: :string,
      object: {:const, "assistant"},
      response_format:
        {:union,
         [
           {OpenAI.ResponseFormatJsonObject, :t},
           {OpenAI.ResponseFormatJsonSchema, :t},
           {OpenAI.ResponseFormatText, :t},
           const: "auto"
         ]},
      temperature: :number,
      tool_resources: {OpenAI.AssistantObjectToolResources, :t},
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
