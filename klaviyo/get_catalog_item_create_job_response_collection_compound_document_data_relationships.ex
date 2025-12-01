defmodule Klaviyo.GetCatalogItemCreateJobResponseCollectionCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCatalogItemCreateJobResponseCollectionCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          items:
            Klaviyo.GetCatalogItemCreateJobResponseCollectionCompoundDocumentDataRelationshipsItems.t()
            | nil
        }

  defstruct [:items]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      items:
        {Klaviyo.GetCatalogItemCreateJobResponseCollectionCompoundDocumentDataRelationshipsItems,
         :t}
    ]
  end
end
