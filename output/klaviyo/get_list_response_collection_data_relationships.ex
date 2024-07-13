defmodule GetListResponseCollectionDataRelationships do
  @moduledoc """
  Provides struct and type for a GetListResponseCollectionDataRelationships
  """

  @type t :: %__MODULE__{
          profiles: GetListResponseCollectionDataRelationshipsProfiles.t() | nil,
          tags: GetListResponseCollectionDataRelationshipsTags.t() | nil
        }

  defstruct [:profiles, :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      profiles: {GetListResponseCollectionDataRelationshipsProfiles, :t},
      tags: {GetListResponseCollectionDataRelationshipsTags, :t}
    ]
  end
end
