defmodule Klaviyo.PostCatalogVariantUpdateJobResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PostCatalogVariantUpdateJobResponseDataRelationships
  """

  @type t :: %__MODULE__{
          variants: Klaviyo.PostCatalogVariantUpdateJobResponseDataRelationshipsVariants.t() | nil
        }

  defstruct [:variants]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [variants: {Klaviyo.PostCatalogVariantUpdateJobResponseDataRelationshipsVariants, :t}]
  end
end
