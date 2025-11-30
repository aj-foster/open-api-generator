defmodule Klaviyo.GetListListResponseCollectionCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetListListResponseCollectionCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          profiles:
            Klaviyo.GetListListResponseCollectionCompoundDocumentDataRelationshipsProfiles.t()
            | nil,
          tags:
            Klaviyo.GetListListResponseCollectionCompoundDocumentDataRelationshipsTags.t() | nil
        }

  defstruct [:profiles, :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      profiles:
        {Klaviyo.GetListListResponseCollectionCompoundDocumentDataRelationshipsProfiles, :t},
      tags: {Klaviyo.GetListListResponseCollectionCompoundDocumentDataRelationshipsTags, :t}
    ]
  end
end
