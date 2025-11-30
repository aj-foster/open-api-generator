defmodule Klaviyo.GetCatalogCategoryResponseCollection do
  @moduledoc """
  Provides struct and type for a GetCatalogCategoryResponseCollection
  """

  @type t :: %__MODULE__{
          data: [Klaviyo.GetCatalogCategoryResponseCollectionData.t()],
          links: Klaviyo.CollectionLinks.t()
        }

  defstruct [:data, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{Klaviyo.GetCatalogCategoryResponseCollectionData, :t}],
      links: {Klaviyo.CollectionLinks, :t}
    ]
  end
end
