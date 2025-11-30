defmodule Klaviyo.CatalogVariantUpdateJobCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a CatalogVariantUpdateJobCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          variants: Klaviyo.CatalogVariantUpdateJobCreateQueryResourceObjectAttributesVariants.t()
        }

  defstruct [:variants]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [variants: {Klaviyo.CatalogVariantUpdateJobCreateQueryResourceObjectAttributesVariants, :t}]
  end
end
