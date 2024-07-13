defmodule GetCatalogVariantUpdateJobResponseCollectionCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCatalogVariantUpdateJobResponseCollectionCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          variants:
            GetCatalogVariantUpdateJobResponseCollectionCompoundDocumentDataRelationshipsVariants.t()
            | nil
        }

  defstruct [:variants]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      variants:
        {GetCatalogVariantUpdateJobResponseCollectionCompoundDocumentDataRelationshipsVariants,
         :t}
    ]
  end
end
