defmodule Klaviyo.CatalogItemCreateQueryResourceObjectRelationships do
  @moduledoc """
  Provides struct and type for a CatalogItemCreateQueryResourceObjectRelationships
  """

  @type t :: %__MODULE__{
          categories:
            Klaviyo.CatalogItemCreateQueryResourceObjectRelationshipsCategories.t() | nil
        }

  defstruct [:categories]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [categories: {Klaviyo.CatalogItemCreateQueryResourceObjectRelationshipsCategories, :t}]
  end
end
