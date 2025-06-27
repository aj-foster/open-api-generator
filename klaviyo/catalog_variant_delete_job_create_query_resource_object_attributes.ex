defmodule CatalogVariantDeleteJobCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a CatalogVariantDeleteJobCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          variants: CatalogVariantDeleteJobCreateQueryResourceObjectAttributesVariants.t()
        }

  defstruct [:variants]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [variants: {CatalogVariantDeleteJobCreateQueryResourceObjectAttributesVariants, :t}]
  end
end
