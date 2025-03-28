defmodule CatalogVariantCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a CatalogVariantCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: CatalogVariantCreateQueryResourceObjectAttributes.t(),
          relationships: CatalogVariantCreateQueryResourceObjectRelationships.t(),
          type: String.t()
        }

  defstruct [:attributes, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {CatalogVariantCreateQueryResourceObjectAttributes, :t},
      relationships: {CatalogVariantCreateQueryResourceObjectRelationships, :t},
      type: {:const, "catalog-variant"}
    ]
  end
end
