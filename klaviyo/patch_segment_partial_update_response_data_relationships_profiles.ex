defmodule PatchSegmentPartialUpdateResponseDataRelationshipsProfiles do
  @moduledoc """
  Provides struct and type for a PatchSegmentPartialUpdateResponseDataRelationshipsProfiles
  """

  @type t :: %__MODULE__{
          data: [PatchSegmentPartialUpdateResponseDataRelationshipsProfilesData.t()],
          links: RelationshipLinks.t() | nil
        }

  defstruct [:data, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{PatchSegmentPartialUpdateResponseDataRelationshipsProfilesData, :t}],
      links: {RelationshipLinks, :t}
    ]
  end
end
