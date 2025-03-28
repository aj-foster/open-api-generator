defmodule CatalogItemDeleteJobCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a CatalogItemDeleteJobCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: CatalogItemDeleteJobCreateQueryResourceObjectAttributes.t(),
          type: String.t()
        }

  defstruct [:attributes, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {CatalogItemDeleteJobCreateQueryResourceObjectAttributes, :t},
      type: {:const, "catalog-item-bulk-delete-job"}
    ]
  end
end
