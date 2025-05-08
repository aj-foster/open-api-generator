defmodule CatalogVariantCreateJobCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a CatalogVariantCreateJobCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: CatalogVariantCreateJobCreateQueryResourceObjectAttributes.t(),
          type: String.t()
        }

  defstruct [:attributes, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {CatalogVariantCreateJobCreateQueryResourceObjectAttributes, :t},
      type: {:const, "catalog-variant-bulk-create-job"}
    ]
  end
end
