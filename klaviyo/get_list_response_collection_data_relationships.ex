defmodule Klaviyo.GetListResponseCollectionDataRelationships do
  @moduledoc """
  Provides struct and type for a GetListResponseCollectionDataRelationships
  """

  @type t :: %__MODULE__{
          profiles: Klaviyo.GetListResponseCollectionDataRelationshipsProfiles.t() | nil,
          tags: Klaviyo.GetListResponseCollectionDataRelationshipsTags.t() | nil
        }

  defstruct [:profiles, :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      profiles: {Klaviyo.GetListResponseCollectionDataRelationshipsProfiles, :t},
      tags: {Klaviyo.GetListResponseCollectionDataRelationshipsTags, :t}
    ]
  end
end
