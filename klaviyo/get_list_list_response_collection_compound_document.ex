defmodule GetListListResponseCollectionCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetListListResponseCollectionCompoundDocument
  """

  @type t :: %__MODULE__{
          data: [GetListListResponseCollectionCompoundDocumentData.t()],
          included: [TagResponseObjectResource.t()] | nil,
          links: CollectionLinks.t()
        }

  defstruct [:data, :included, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{GetListListResponseCollectionCompoundDocumentData, :t}],
      included: [{TagResponseObjectResource, :t}],
      links: {CollectionLinks, :t}
    ]
  end
end
