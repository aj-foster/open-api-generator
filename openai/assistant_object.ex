defmodule AssistantObject do
  @moduledoc """
  Provides struct and type for a AssistantObject
  """

  @type t :: %__MODULE__{
          created_at: integer,
          description: String.t() | nil,
          id: String.t(),
          instructions: String.t() | nil,
          metadata: map,
          model: String.t(),
          name: String.t() | nil,
          object: String.t(),
          response_format:
            ResponseFormatJsonObject.t()
            | ResponseFormatJsonSchema.t()
            | ResponseFormatText.t()
            | String.t()
            | nil,
          temperature: number | nil,
          tool_resources: AssistantObjectToolResources.t() | nil,
          tools: [
            AssistantToolsCode.t() | AssistantToolsFileSearch.t() | AssistantToolsFunction.t()
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
      description: {:string, :generic},
      id: {:string, :generic},
      instructions: {:string, :generic},
      metadata: :map,
      model: {:string, :generic},
      name: {:string, :generic},
      object: {:const, "assistant"},
      response_format:
        {:union,
         [
           {ResponseFormatJsonObject, :t},
           {ResponseFormatJsonSchema, :t},
           {ResponseFormatText, :t},
           const: "auto"
         ]},
      temperature: :number,
      tool_resources: {AssistantObjectToolResources, :t},
      tools: [
        union: [
          {AssistantToolsCode, :t},
          {AssistantToolsFileSearch, :t},
          {AssistantToolsFunction, :t}
        ]
      ],
      top_p: :number
    ]
  end
end
