defmodule PostCatalogVariantCreateJobResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PostCatalogVariantCreateJobResponseDataRelationships
  """

  @type t :: %__MODULE__{
          variants: PostCatalogVariantCreateJobResponseDataRelationshipsVariants.t() | nil
        }

  defstruct [:variants]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [variants: {PostCatalogVariantCreateJobResponseDataRelationshipsVariants, :t}]
  end
end
