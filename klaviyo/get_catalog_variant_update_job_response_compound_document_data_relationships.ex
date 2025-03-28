defmodule GetCatalogVariantUpdateJobResponseCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCatalogVariantUpdateJobResponseCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          variants:
            GetCatalogVariantUpdateJobResponseCompoundDocumentDataRelationshipsVariants.t() | nil
        }

  defstruct [:variants]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [variants: {GetCatalogVariantUpdateJobResponseCompoundDocumentDataRelationshipsVariants, :t}]
  end
end
