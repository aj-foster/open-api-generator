defmodule Klaviyo.GetCatalogVariantCreateJobResponseCompoundDocumentDataRelationshipsVariants do
  @moduledoc """
  Provides struct and type for a GetCatalogVariantCreateJobResponseCompoundDocumentDataRelationshipsVariants
  """

  @type t :: %__MODULE__{
          data: [
            Klaviyo.GetCatalogVariantCreateJobResponseCompoundDocumentDataRelationshipsVariantsData.t()
          ],
          links: Klaviyo.RelationshipLinks.t() | nil
        }

  defstruct [:data, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [
        {Klaviyo.GetCatalogVariantCreateJobResponseCompoundDocumentDataRelationshipsVariantsData,
         :t}
      ],
      links: {Klaviyo.RelationshipLinks, :t}
    ]
  end
end
