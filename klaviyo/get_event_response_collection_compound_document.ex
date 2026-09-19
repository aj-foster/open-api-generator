defmodule Klaviyo.GetEventResponseCollectionCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetEventResponseCollectionCompoundDocument
  """

  @type t :: %__MODULE__{
          data: [Klaviyo.GetEventResponseCollectionCompoundDocumentData.t()],
          included:
            [
              Klaviyo.AttributionResponseObjectResource.t()
              | Klaviyo.MetricResponseObjectResource.t()
              | Klaviyo.ProfileResponseObjectResource.t()
            ]
            | nil,
          links: Klaviyo.CollectionLinks.t()
        }

  defstruct [:data, :included, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{Klaviyo.GetEventResponseCollectionCompoundDocumentData, :t}],
      included: [
        union: [
          {Klaviyo.AttributionResponseObjectResource, :t},
          {Klaviyo.MetricResponseObjectResource, :t},
          {Klaviyo.ProfileResponseObjectResource, :t}
        ]
      ],
      links: {Klaviyo.CollectionLinks, :t}
    ]
  end
end
