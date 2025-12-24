defmodule Klaviyo.GetTagResponseCollectionCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetTagResponseCollectionCompoundDocument
  """

  @type t :: %__MODULE__{
          data: [Klaviyo.GetTagResponseCollectionCompoundDocumentData.t()],
          included: [Klaviyo.TagGroupResponseObjectResource.t()] | nil,
          links: Klaviyo.CollectionLinks.t()
        }

  defstruct [:data, :included, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{Klaviyo.GetTagResponseCollectionCompoundDocumentData, :t}],
      included: [{Klaviyo.TagGroupResponseObjectResource, :t}],
      links: {Klaviyo.CollectionLinks, :t}
    ]
  end
end
