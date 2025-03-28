defmodule PatchListPartialUpdateResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PatchListPartialUpdateResponseDataRelationships
  """

  @type t :: %__MODULE__{
          profiles: PatchListPartialUpdateResponseDataRelationshipsProfiles.t() | nil,
          tags: PatchListPartialUpdateResponseDataRelationshipsTags.t() | nil
        }

  defstruct [:profiles, :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      profiles: {PatchListPartialUpdateResponseDataRelationshipsProfiles, :t},
      tags: {PatchListPartialUpdateResponseDataRelationshipsTags, :t}
    ]
  end
end
