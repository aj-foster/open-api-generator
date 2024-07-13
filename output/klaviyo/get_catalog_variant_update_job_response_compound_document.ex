defmodule GetCatalogVariantUpdateJobResponseCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetCatalogVariantUpdateJobResponseCompoundDocument
  """

  @type t :: %__MODULE__{
          data: GetCatalogVariantUpdateJobResponseCompoundDocumentData.t(),
          included: [CatalogVariantResponseObjectResource.t()] | nil
        }

  defstruct [:data, :included]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: {GetCatalogVariantUpdateJobResponseCompoundDocumentData, :t},
      included: [{CatalogVariantResponseObjectResource, :t}]
    ]
  end
end
