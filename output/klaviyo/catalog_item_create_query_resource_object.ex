defmodule CatalogItemCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a CatalogItemCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: CatalogItemCreateQueryResourceObjectAttributes.t(),
          relationships: CatalogItemCreateQueryResourceObjectRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {CatalogItemCreateQueryResourceObjectAttributes, :t},
      relationships: {CatalogItemCreateQueryResourceObjectRelationships, :t},
      type: {:const, "catalog-item"}
    ]
  end
end
