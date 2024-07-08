defmodule GetEventResponseCollectionCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetEventResponseCollectionCompoundDocument
  """

  @type t :: %__MODULE__{
          data: [GetEventResponseCollectionCompoundDocumentData.t()],
          included:
            [
              AttributionResponseObjectResource.t()
              | MetricResponseObjectResource.t()
              | ProfileResponseObjectResource.t()
            ]
            | nil,
          links: CollectionLinks.t()
        }

  defstruct [:data, :included, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{GetEventResponseCollectionCompoundDocumentData, :t}],
      included: [
        union: [
          {AttributionResponseObjectResource, :t},
          {MetricResponseObjectResource, :t},
          {ProfileResponseObjectResource, :t}
        ]
      ],
      links: {CollectionLinks, :t}
    ]
  end
end
