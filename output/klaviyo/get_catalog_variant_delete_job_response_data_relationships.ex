defmodule GetCatalogVariantDeleteJobResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCatalogVariantDeleteJobResponseDataRelationships
  """

  @type t :: %__MODULE__{
          variants: GetCatalogVariantDeleteJobResponseDataRelationshipsVariants.t() | nil
        }

  defstruct [:variants]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [variants: {GetCatalogVariantDeleteJobResponseDataRelationshipsVariants, :t}]
  end
end
