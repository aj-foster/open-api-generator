defmodule LanguageAnnotationUpdate do
  @moduledoc """
  Provides struct and type for a LanguageAnnotationUpdate
  """

  @type t :: %__MODULE__{
          classificationConfidence: number | nil,
          confidence: number | nil,
          contentType: String.t() | nil,
          dataPoint: String.t() | nil,
          id: integer | nil,
          isAutoVerified: boolean | nil,
          isClientVerified: boolean | nil,
          isVerified: boolean | nil,
          pageIndex: integer | nil,
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
    :id,
    :isAutoVerified,
    :isClientVerified,
    :isVerified,
    :pageIndex,
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
      contentType: {:string, :generic},
      dataPoint: {:string, :generic},
      id: :integer,
      isAutoVerified: :boolean,
      isClientVerified: :boolean,
      isVerified: :boolean,
      pageIndex: :integer,
      parsed: {:string, :generic},
      raw: {:string, :generic},
      rectangle: {Rectangle, :t},
      rectangles: [{Rectangle, :t}],
      textExtractionConfidence: :number
    ]
  end
end
