defmodule CatalogVariantCreateJobCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a CatalogVariantCreateJobCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          variants: CatalogVariantCreateJobCreateQueryResourceObjectAttributesVariants.t()
        }

  defstruct [:variants]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [variants: {CatalogVariantCreateJobCreateQueryResourceObjectAttributesVariants, :t}]
  end
end
