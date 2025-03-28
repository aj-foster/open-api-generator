defmodule CatalogItemUpdateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a CatalogItemUpdateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: CatalogItemUpdateQueryResourceObjectAttributes.t(),
          id: String.t(),
          relationships: CatalogItemUpdateQueryResourceObjectRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {CatalogItemUpdateQueryResourceObjectAttributes, :t},
      id: {:string, :generic},
      relationships: {CatalogItemUpdateQueryResourceObjectRelationships, :t},
      type: {:const, "catalog-item"}
    ]
  end
end
