defmodule PatchSegmentPartialUpdateResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PatchSegmentPartialUpdateResponseDataRelationships
  """

  @type t :: %__MODULE__{
          profiles: PatchSegmentPartialUpdateResponseDataRelationshipsProfiles.t() | nil,
          tags: PatchSegmentPartialUpdateResponseDataRelationshipsTags.t() | nil
        }

  defstruct [:profiles, :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      profiles: {PatchSegmentPartialUpdateResponseDataRelationshipsProfiles, :t},
      tags: {PatchSegmentPartialUpdateResponseDataRelationshipsTags, :t}
    ]
  end
end
