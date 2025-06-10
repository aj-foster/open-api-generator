defmodule CatalogItemUpdateJobCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a CatalogItemUpdateJobCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: CatalogItemUpdateJobCreateQueryResourceObjectAttributes.t(),
          type: String.t()
        }

  defstruct [:attributes, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {CatalogItemUpdateJobCreateQueryResourceObjectAttributes, :t},
      type: {:const, "catalog-item-bulk-update-job"}
    ]
  end
end
