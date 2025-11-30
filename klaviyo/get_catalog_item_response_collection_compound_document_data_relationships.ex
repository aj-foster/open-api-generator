defmodule Klaviyo.GetCatalogItemResponseCollectionCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCatalogItemResponseCollectionCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          variants:
            Klaviyo.GetCatalogItemResponseCollectionCompoundDocumentDataRelationshipsVariants.t()
            | nil
        }

  defstruct [:variants]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      variants:
        {Klaviyo.GetCatalogItemResponseCollectionCompoundDocumentDataRelationshipsVariants, :t}
    ]
  end
end
