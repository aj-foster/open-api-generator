defmodule Klaviyo.GetFlowResponseCollectionCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetFlowResponseCollectionCompoundDocument
  """

  @type t :: %__MODULE__{
          data: [Klaviyo.GetFlowResponseCollectionCompoundDocumentData.t()],
          included:
            [Klaviyo.FlowActionResponseObjectResource.t() | Klaviyo.TagResponseObjectResource.t()]
            | nil,
          links: Klaviyo.CollectionLinks.t()
        }

  defstruct [:data, :included, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{Klaviyo.GetFlowResponseCollectionCompoundDocumentData, :t}],
      included: [
        union: [
          {Klaviyo.FlowActionResponseObjectResource, :t},
          {Klaviyo.TagResponseObjectResource, :t}
        ]
      ],
      links: {Klaviyo.CollectionLinks, :t}
    ]
  end
end
