defmodule Klaviyo.GetCatalogCategoryResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCatalogCategoryResponseDataRelationships
  """

  @type t :: %__MODULE__{
          items: Klaviyo.GetCatalogCategoryResponseDataRelationshipsItems.t() | nil
        }

  defstruct [:items]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [items: {Klaviyo.GetCatalogCategoryResponseDataRelationshipsItems, :t}]
  end
end
