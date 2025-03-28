defmodule GetCatalogVariantCreateJobResponseCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetCatalogVariantCreateJobResponseCompoundDocument
  """

  @type t :: %__MODULE__{
          data: GetCatalogVariantCreateJobResponseCompoundDocumentData.t(),
          included: [CatalogVariantResponseObjectResource.t()] | nil
        }

  defstruct [:data, :included]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: {GetCatalogVariantCreateJobResponseCompoundDocumentData, :t},
      included: [{CatalogVariantResponseObjectResource, :t}]
    ]
  end
end
