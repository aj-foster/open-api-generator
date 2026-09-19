defmodule Klaviyo.GetSegmentListResponseCollectionCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetSegmentListResponseCollectionCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          profiles:
            Klaviyo.GetSegmentListResponseCollectionCompoundDocumentDataRelationshipsProfiles.t()
            | nil,
          tags:
            Klaviyo.GetSegmentListResponseCollectionCompoundDocumentDataRelationshipsTags.t()
            | nil
        }

  defstruct [:profiles, :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      profiles:
        {Klaviyo.GetSegmentListResponseCollectionCompoundDocumentDataRelationshipsProfiles, :t},
      tags: {Klaviyo.GetSegmentListResponseCollectionCompoundDocumentDataRelationshipsTags, :t}
    ]
  end
end
