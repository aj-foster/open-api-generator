defmodule GetCatalogItemUpdateJobResponseCollectionCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCatalogItemUpdateJobResponseCollectionCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          items:
            GetCatalogItemUpdateJobResponseCollectionCompoundDocumentDataRelationshipsItems.t()
            | nil
        }

  defstruct [:items]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [items: {GetCatalogItemUpdateJobResponseCollectionCompoundDocumentDataRelationshipsItems, :t}]
  end
end
