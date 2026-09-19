defmodule Klaviyo.GetSegmentListResponseCollectionCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetSegmentListResponseCollectionCompoundDocument
  """

  @type t :: %__MODULE__{
          data: [Klaviyo.GetSegmentListResponseCollectionCompoundDocumentData.t()],
          included: [Klaviyo.TagResponseObjectResource.t()] | nil,
          links: Klaviyo.CollectionLinks.t()
        }

  defstruct [:data, :included, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{Klaviyo.GetSegmentListResponseCollectionCompoundDocumentData, :t}],
      included: [{Klaviyo.TagResponseObjectResource, :t}],
      links: {Klaviyo.CollectionLinks, :t}
    ]
  end
end
