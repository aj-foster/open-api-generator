defmodule ProfileMergeQueryResourceObjectRelationships do
  @moduledoc """
  Provides struct and type for a ProfileMergeQueryResourceObjectRelationships
  """

  @type t :: %__MODULE__{profiles: ProfileMergeQueryResourceObjectRelationshipsProfiles.t()}

  defstruct [:profiles]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [profiles: {ProfileMergeQueryResourceObjectRelationshipsProfiles, :t}]
  end
end
