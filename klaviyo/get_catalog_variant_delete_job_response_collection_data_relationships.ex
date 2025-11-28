defmodule GetCatalogVariantDeleteJobResponseCollectionDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCatalogVariantDeleteJobResponseCollectionDataRelationships
  """

  @type t :: %__MODULE__{
          variants:
            GetCatalogVariantDeleteJobResponseCollectionDataRelationshipsVariants.t() | nil
        }

  defstruct [:variants]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [variants: {GetCatalogVariantDeleteJobResponseCollectionDataRelationshipsVariants, :t}]
  end
end
