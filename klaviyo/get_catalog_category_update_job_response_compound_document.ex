defmodule Klaviyo.GetCatalogCategoryUpdateJobResponseCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetCatalogCategoryUpdateJobResponseCompoundDocument
  """

  @type t :: %__MODULE__{
          data: Klaviyo.GetCatalogCategoryUpdateJobResponseCompoundDocumentData.t(),
          included: [Klaviyo.CatalogCategoryResponseObjectResource.t()] | nil
        }

  defstruct [:data, :included]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: {Klaviyo.GetCatalogCategoryUpdateJobResponseCompoundDocumentData, :t},
      included: [{Klaviyo.CatalogCategoryResponseObjectResource, :t}]
    ]
  end
end
