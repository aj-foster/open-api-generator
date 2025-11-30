defmodule Affinda.DateAnnotationUpdate do
  @moduledoc """
  Provides struct and type for a DateAnnotationUpdate
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
          parsed: Date.t() | nil,
          raw: String.t() | nil,
          rectangle: Affinda.Rectangle.t() | nil,
          rectangles: [Affinda.Rectangle.t()] | nil,
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
      contentType: :string,
      dataPoint: :string,
      id: :integer,
      isAutoVerified: :boolean,
      isClientVerified: :boolean,
      isVerified: :boolean,
      pageIndex: :integer,
      parsed: {:string, "date"},
      raw: :string,
      rectangle: {Affinda.Rectangle, :t},
      rectangles: [{Affinda.Rectangle, :t}],
      textExtractionConfidence: :number
    ]
  end
end
