defmodule Klaviyo.GetCatalogVariantUpdateJobResponseCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetCatalogVariantUpdateJobResponseCompoundDocument
  """

  @type t :: %__MODULE__{
          data: Klaviyo.GetCatalogVariantUpdateJobResponseCompoundDocumentData.t(),
          included: [Klaviyo.CatalogVariantResponseObjectResource.t()] | nil
        }

  defstruct [:data, :included]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: {Klaviyo.GetCatalogVariantUpdateJobResponseCompoundDocumentData, :t},
      included: [{Klaviyo.CatalogVariantResponseObjectResource, :t}]
    ]
  end
end
