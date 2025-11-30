defmodule Klaviyo.PatchCatalogCategoryResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PatchCatalogCategoryResponseDataRelationships
  """

  @type t :: %__MODULE__{
          items: Klaviyo.PatchCatalogCategoryResponseDataRelationshipsItems.t() | nil
        }

  defstruct [:items]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [items: {Klaviyo.PatchCatalogCategoryResponseDataRelationshipsItems, :t}]
  end
end
