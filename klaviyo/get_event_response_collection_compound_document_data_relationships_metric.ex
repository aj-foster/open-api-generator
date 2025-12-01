defmodule Klaviyo.GetEventResponseCollectionCompoundDocumentDataRelationshipsMetric do
  @moduledoc """
  Provides struct and type for a GetEventResponseCollectionCompoundDocumentDataRelationshipsMetric
  """

  @type t :: %__MODULE__{
          data: Klaviyo.GetEventResponseCollectionCompoundDocumentDataRelationshipsMetricData.t(),
          links: Klaviyo.RelationshipLinks.t() | nil
        }

  defstruct [:data, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: {Klaviyo.GetEventResponseCollectionCompoundDocumentDataRelationshipsMetricData, :t},
      links: {Klaviyo.RelationshipLinks, :t}
    ]
  end
end
