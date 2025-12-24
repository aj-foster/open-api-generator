defmodule Klaviyo.GetCatalogVariantDeleteJobResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCatalogVariantDeleteJobResponseDataRelationships
  """

  @type t :: %__MODULE__{
          variants: Klaviyo.GetCatalogVariantDeleteJobResponseDataRelationshipsVariants.t() | nil
        }

  defstruct [:variants]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [variants: {Klaviyo.GetCatalogVariantDeleteJobResponseDataRelationshipsVariants, :t}]
  end
end
