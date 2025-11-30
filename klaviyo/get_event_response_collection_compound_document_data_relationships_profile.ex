defmodule Klaviyo.GetEventResponseCollectionCompoundDocumentDataRelationshipsProfile do
  @moduledoc """
  Provides struct and type for a GetEventResponseCollectionCompoundDocumentDataRelationshipsProfile
  """

  @type t :: %__MODULE__{
          data:
            Klaviyo.GetEventResponseCollectionCompoundDocumentDataRelationshipsProfileData.t(),
          links: Klaviyo.RelationshipLinks.t() | nil
        }

  defstruct [:data, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: {Klaviyo.GetEventResponseCollectionCompoundDocumentDataRelationshipsProfileData, :t},
      links: {Klaviyo.RelationshipLinks, :t}
    ]
  end
end
