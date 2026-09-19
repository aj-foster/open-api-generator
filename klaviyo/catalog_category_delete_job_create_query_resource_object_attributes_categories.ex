defmodule Klaviyo.CatalogCategoryDeleteJobCreateQueryResourceObjectAttributesCategories do
  @moduledoc """
  Provides struct and type for a CatalogCategoryDeleteJobCreateQueryResourceObjectAttributesCategories
  """

  @type t :: %__MODULE__{data: [Klaviyo.CatalogCategoryDeleteQueryResourceObject.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{Klaviyo.CatalogCategoryDeleteQueryResourceObject, :t}]]
  end
end
