defmodule Klaviyo.GetCatalogItemUpdateJobResponseCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetCatalogItemUpdateJobResponseCompoundDocument
  """

  @type t :: %__MODULE__{
          data: Klaviyo.GetCatalogItemUpdateJobResponseCompoundDocumentData.t(),
          included: [Klaviyo.CatalogItemResponseObjectResource.t()] | nil
        }

  defstruct [:data, :included]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: {Klaviyo.GetCatalogItemUpdateJobResponseCompoundDocumentData, :t},
      included: [{Klaviyo.CatalogItemResponseObjectResource, :t}]
    ]
  end
end
