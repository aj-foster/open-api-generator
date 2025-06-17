defmodule GetCatalogVariantCreateJobResponseCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCatalogVariantCreateJobResponseCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          variants:
            GetCatalogVariantCreateJobResponseCompoundDocumentDataRelationshipsVariants.t() | nil
        }

  defstruct [:variants]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [variants: {GetCatalogVariantCreateJobResponseCompoundDocumentDataRelationshipsVariants, :t}]
  end
end
