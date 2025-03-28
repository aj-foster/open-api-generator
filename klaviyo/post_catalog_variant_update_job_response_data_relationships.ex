defmodule PostCatalogVariantUpdateJobResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PostCatalogVariantUpdateJobResponseDataRelationships
  """

  @type t :: %__MODULE__{
          variants: PostCatalogVariantUpdateJobResponseDataRelationshipsVariants.t() | nil
        }

  defstruct [:variants]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [variants: {PostCatalogVariantUpdateJobResponseDataRelationshipsVariants, :t}]
  end
end
