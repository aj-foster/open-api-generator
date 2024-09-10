defmodule GetCatalogItemResponseCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCatalogItemResponseCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          variants: GetCatalogItemResponseCompoundDocumentDataRelationshipsVariants.t() | nil
        }

  defstruct [:variants]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [variants: {GetCatalogItemResponseCompoundDocumentDataRelationshipsVariants, :t}]
  end
end
