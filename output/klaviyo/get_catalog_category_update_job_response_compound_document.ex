defmodule GetCatalogCategoryUpdateJobResponseCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetCatalogCategoryUpdateJobResponseCompoundDocument
  """

  @type t :: %__MODULE__{
          data: GetCatalogCategoryUpdateJobResponseCompoundDocumentData.t(),
          included: [CatalogCategoryResponseObjectResource.t()] | nil
        }

  defstruct [:data, :included]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: {GetCatalogCategoryUpdateJobResponseCompoundDocumentData, :t},
      included: [{CatalogCategoryResponseObjectResource, :t}]
    ]
  end
end
