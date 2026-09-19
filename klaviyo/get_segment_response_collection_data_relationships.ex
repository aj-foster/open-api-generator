defmodule Klaviyo.GetSegmentResponseCollectionDataRelationships do
  @moduledoc """
  Provides struct and type for a GetSegmentResponseCollectionDataRelationships
  """

  @type t :: %__MODULE__{
          profiles: Klaviyo.GetSegmentResponseCollectionDataRelationshipsProfiles.t() | nil,
          tags: Klaviyo.GetSegmentResponseCollectionDataRelationshipsTags.t() | nil
        }

  defstruct [:profiles, :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      profiles: {Klaviyo.GetSegmentResponseCollectionDataRelationshipsProfiles, :t},
      tags: {Klaviyo.GetSegmentResponseCollectionDataRelationshipsTags, :t}
    ]
  end
end
