defmodule Klaviyo.CatalogVariantCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a CatalogVariantCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.CatalogVariantCreateQueryResourceObjectAttributes.t(),
          relationships: Klaviyo.CatalogVariantCreateQueryResourceObjectRelationships.t(),
          type: String.t()
        }

  defstruct [:attributes, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.CatalogVariantCreateQueryResourceObjectAttributes, :t},
      relationships: {Klaviyo.CatalogVariantCreateQueryResourceObjectRelationships, :t},
      type: {:const, "catalog-variant"}
    ]
  end
end
