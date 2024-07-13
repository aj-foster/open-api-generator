defmodule CatalogVariantUpdateJobCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a CatalogVariantUpdateJobCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: CatalogVariantUpdateJobCreateQueryResourceObjectAttributes.t(),
          type: String.t()
        }

  defstruct [:attributes, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {CatalogVariantUpdateJobCreateQueryResourceObjectAttributes, :t},
      type: {:const, "catalog-variant-bulk-update-job"}
    ]
  end
end
