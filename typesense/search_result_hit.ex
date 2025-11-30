defmodule Typesense.SearchResultHit do
  @moduledoc """
  Provides struct and type for a SearchResultHit
  """

  @type t :: %__MODULE__{
          document: map | nil,
          geo_distance_meters: map | nil,
          highlight: map | nil,
          highlights: [Typesense.SearchHighlight.t()] | nil,
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
      document: :map,
      geo_distance_meters: :map,
      highlight: :map,
      highlights: [{Typesense.SearchHighlight, :t}],
      text_match: {:integer, "int64"},
      vector_distance: {:number, "float"}
    ]
  end
end
