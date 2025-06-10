defmodule SearchResultHit do
  @moduledoc """
  Provides struct and type for a SearchResultHit
  """

  @type t :: %__MODULE__{
          document: SearchResultHitDocument.t() | nil,
          geo_distance_meters: SearchResultHitGeoDistanceMeters.t() | nil,
          highlight: map | nil,
          highlights: [SearchHighlight.t()] | nil,
          text_match: integer | nil,
          vector_distance: number | nil
        }

  defstruct [
    :document,
    :geo_distance_meters,
    :highlight,
    :highlights,
    :text_match,
    :vector_distance
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      document: {SearchResultHitDocument, :t},
      geo_distance_meters: {SearchResultHitGeoDistanceMeters, :t},
      highlight: :map,
      highlights: [{SearchHighlight, :t}],
      text_match: :integer,
      vector_distance: :number
    ]
  end
end
