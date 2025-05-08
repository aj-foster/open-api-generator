defmodule TextAnnotation do
  @moduledoc """
  Provides struct and type for a TextAnnotation
  """

  @type t :: %__MODULE__{
          classificationConfidence: number | nil,
          confidence: number | nil,
          contentType: String.t() | nil,
          dataPoint: String.t() | nil,
          document: String.t() | nil,
          id: integer | nil,
          isAutoVerified: boolean | nil,
          isClientVerified: boolean | nil,
          isVerified: boolean | nil,
          pageIndex: integer | nil,
          parent: integer | nil,
          parsed: String.t() | nil,
          raw: String.t() | nil,
          rectangle: Rectangle.t() | nil,
          rectangles: [Rectangle.t()] | nil,
          textExtractionConfidence: number | nil
        }

  defstruct [
    :classificationConfidence,
    :confidence,
    :contentType,
    :dataPoint,
    :document,
    :id,
    :isAutoVerified,
    :isClientVerified,
    :isVerified,
    :pageIndex,
    :parent,
    :parsed,
    :raw,
    :rectangle,
    :rectangles,
    :textExtractionConfidence
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      classificationConfidence: :number,
      confidence: :number,
      contentType:
        {:enum,
         [
           "text",
           "integer",
           "float",
           "decimal",
           "date",
           "datetime",
           "daterange",
           "boolean",
           "enum",
           "location",
           "phonenumber",
           "json",
           "table",
           "expectedremuneration",
           "jobtitle",
           "language",
           "skill",
           "yearsexperience",
           "group",
           "table_deprecated",
           "url",
           "image"
         ]},
      dataPoint: {:string, :generic},
      document: {:string, :generic},
      id: :integer,
      isAutoVerified: :boolean,
      isClientVerified: :boolean,
      isVerified: :boolean,
      pageIndex: :integer,
      parent: :integer,
      parsed: {:string, :generic},
      raw: {:string, :generic},
      rectangle: {Rectangle, :t},
      rectangles: [{Rectangle, :t}],
      textExtractionConfidence: :number
    ]
  end
end
