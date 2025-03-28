defmodule GetSegmentResponseCollectionDataRelationships do
  @moduledoc """
  Provides struct and type for a GetSegmentResponseCollectionDataRelationships
  """

  @type t :: %__MODULE__{
          profiles: GetSegmentResponseCollectionDataRelationshipsProfiles.t() | nil,
          tags: GetSegmentResponseCollectionDataRelationshipsTags.t() | nil
        }

  defstruct [:profiles, :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      profiles: {GetSegmentResponseCollectionDataRelationshipsProfiles, :t},
      tags: {GetSegmentResponseCollectionDataRelationshipsTags, :t}
    ]
  end
end
