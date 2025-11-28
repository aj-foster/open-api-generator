defmodule GetCatalogVariantCreateJobResponseCollectionCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCatalogVariantCreateJobResponseCollectionCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          variants:
            GetCatalogVariantCreateJobResponseCollectionCompoundDocumentDataRelationshipsVariants.t()
            | nil
        }

  defstruct [:variants]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      variants:
        {GetCatalogVariantCreateJobResponseCollectionCompoundDocumentDataRelationshipsVariants,
         :t}
    ]
  end
end
