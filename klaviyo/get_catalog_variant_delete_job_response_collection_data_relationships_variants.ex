defmodule Klaviyo.GetCatalogVariantDeleteJobResponseCollectionDataRelationshipsVariants do
  @moduledoc """
  Provides struct and type for a GetCatalogVariantDeleteJobResponseCollectionDataRelationshipsVariants
  """

  @type t :: %__MODULE__{links: Klaviyo.RelationshipLinks.t() | nil}

  defstruct [:links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [links: {Klaviyo.RelationshipLinks, :t}]
  end
end
