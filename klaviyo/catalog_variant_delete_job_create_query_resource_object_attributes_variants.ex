defmodule CatalogVariantDeleteJobCreateQueryResourceObjectAttributesVariants do
  @moduledoc """
  Provides struct and type for a CatalogVariantDeleteJobCreateQueryResourceObjectAttributesVariants
  """

  @type t :: %__MODULE__{data: [CatalogVariantDeleteQueryResourceObject.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{CatalogVariantDeleteQueryResourceObject, :t}]]
  end
end
