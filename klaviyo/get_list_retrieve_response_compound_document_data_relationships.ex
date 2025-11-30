defmodule Klaviyo.GetListRetrieveResponseCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetListRetrieveResponseCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          profiles:
            Klaviyo.GetListRetrieveResponseCompoundDocumentDataRelationshipsProfiles.t() | nil,
          tags: Klaviyo.GetListRetrieveResponseCompoundDocumentDataRelationshipsTags.t() | nil
        }

  defstruct [:profiles, :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      profiles: {Klaviyo.GetListRetrieveResponseCompoundDocumentDataRelationshipsProfiles, :t},
      tags: {Klaviyo.GetListRetrieveResponseCompoundDocumentDataRelationshipsTags, :t}
    ]
  end
end
