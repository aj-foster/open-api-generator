defmodule PostCatalogVariantDeleteJobResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PostCatalogVariantDeleteJobResponseDataRelationships
  """

  @type t :: %__MODULE__{
          variants: PostCatalogVariantDeleteJobResponseDataRelationshipsVariants.t() | nil
        }

  defstruct [:variants]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [variants: {PostCatalogVariantDeleteJobResponseDataRelationshipsVariants, :t}]
  end
end
