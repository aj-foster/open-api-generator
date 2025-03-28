defmodule CatalogVariantDeleteJobCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a CatalogVariantDeleteJobCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: CatalogVariantDeleteJobCreateQueryResourceObjectAttributes.t(),
          type: String.t()
        }

  defstruct [:attributes, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {CatalogVariantDeleteJobCreateQueryResourceObjectAttributes, :t},
      type: {:const, "catalog-variant-bulk-delete-job"}
    ]
  end
end
