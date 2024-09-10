defmodule ProfileMergeQueryResourceObjectRelationshipsProfiles do
  @moduledoc """
  Provides struct and type for a ProfileMergeQueryResourceObjectRelationshipsProfiles
  """

  @type t :: %__MODULE__{data: [ProfileMergeQueryResourceObjectRelationshipsProfilesData.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{ProfileMergeQueryResourceObjectRelationshipsProfilesData, :t}]]
  end
end
