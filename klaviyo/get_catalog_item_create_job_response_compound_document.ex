defmodule Klaviyo.GetCatalogItemCreateJobResponseCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetCatalogItemCreateJobResponseCompoundDocument
  """

  @type t :: %__MODULE__{
          data: Klaviyo.GetCatalogItemCreateJobResponseCompoundDocumentData.t(),
          included: [Klaviyo.CatalogItemResponseObjectResource.t()] | nil
        }

  defstruct [:data, :included]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: {Klaviyo.GetCatalogItemCreateJobResponseCompoundDocumentData, :t},
      included: [{Klaviyo.CatalogItemResponseObjectResource, :t}]
    ]
  end
end
