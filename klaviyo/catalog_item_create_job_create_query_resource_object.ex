defmodule CatalogItemCreateJobCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a CatalogItemCreateJobCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: CatalogItemCreateJobCreateQueryResourceObjectAttributes.t(),
          type: String.t()
        }

  defstruct [:attributes, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {CatalogItemCreateJobCreateQueryResourceObjectAttributes, :t},
      type: {:const, "catalog-item-bulk-create-job"}
    ]
  end
end
