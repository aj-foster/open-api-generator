defmodule GetCatalogItemCreateJobResponseCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetCatalogItemCreateJobResponseCompoundDocument
  """

  @type t :: %__MODULE__{
          data: GetCatalogItemCreateJobResponseCompoundDocumentData.t(),
          included: [CatalogItemResponseObjectResource.t()] | nil
        }

  defstruct [:data, :included]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: {GetCatalogItemCreateJobResponseCompoundDocumentData, :t},
      included: [{CatalogItemResponseObjectResource, :t}]
    ]
  end
end
