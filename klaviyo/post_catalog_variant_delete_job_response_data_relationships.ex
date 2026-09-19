defmodule Klaviyo.PostCatalogVariantDeleteJobResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PostCatalogVariantDeleteJobResponseDataRelationships
  """

  @type t :: %__MODULE__{
          variants: Klaviyo.PostCatalogVariantDeleteJobResponseDataRelationshipsVariants.t() | nil
        }

  defstruct [:variants]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [variants: {Klaviyo.PostCatalogVariantDeleteJobResponseDataRelationshipsVariants, :t}]
  end
end
