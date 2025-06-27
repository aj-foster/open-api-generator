defmodule GetCatalogItemDeleteJobResponseCollectionDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCatalogItemDeleteJobResponseCollectionDataRelationships
  """

  @type t :: %__MODULE__{
          items: GetCatalogItemDeleteJobResponseCollectionDataRelationshipsItems.t() | nil
        }

  defstruct [:items]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [items: {GetCatalogItemDeleteJobResponseCollectionDataRelationshipsItems, :t}]
  end
end
