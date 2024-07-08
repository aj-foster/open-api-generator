defmodule GetSegmentListResponseCollectionCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetSegmentListResponseCollectionCompoundDocument
  """

  @type t :: %__MODULE__{
          data: [GetSegmentListResponseCollectionCompoundDocumentData.t()],
          included: [TagResponseObjectResource.t()] | nil,
          links: CollectionLinks.t()
        }

  defstruct [:data, :included, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{GetSegmentListResponseCollectionCompoundDocumentData, :t}],
      included: [{TagResponseObjectResource, :t}],
      links: {CollectionLinks, :t}
    ]
  end
end
