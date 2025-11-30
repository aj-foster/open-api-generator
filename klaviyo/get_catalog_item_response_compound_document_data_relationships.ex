defmodule Klaviyo.GetCatalogItemResponseCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCatalogItemResponseCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          variants:
            Klaviyo.GetCatalogItemResponseCompoundDocumentDataRelationshipsVariants.t() | nil
        }

  defstruct [:variants]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [variants: {Klaviyo.GetCatalogItemResponseCompoundDocumentDataRelationshipsVariants, :t}]
  end
end
