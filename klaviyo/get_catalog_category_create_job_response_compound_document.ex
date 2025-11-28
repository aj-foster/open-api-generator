defmodule GetCatalogCategoryCreateJobResponseCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetCatalogCategoryCreateJobResponseCompoundDocument
  """

  @type t :: %__MODULE__{
          data: GetCatalogCategoryCreateJobResponseCompoundDocumentData.t(),
          included: [CatalogCategoryResponseObjectResource.t()] | nil
        }

  defstruct [:data, :included]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: {GetCatalogCategoryCreateJobResponseCompoundDocumentData, :t},
      included: [{CatalogCategoryResponseObjectResource, :t}]
    ]
  end
end
