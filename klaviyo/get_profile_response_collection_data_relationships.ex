defmodule GetProfileResponseCollectionDataRelationships do
  @moduledoc """
  Provides struct and type for a GetProfileResponseCollectionDataRelationships
  """

  @type t :: %__MODULE__{
          lists: GetProfileResponseCollectionDataRelationshipsLists.t() | nil,
          segments: GetProfileResponseCollectionDataRelationshipsSegments.t() | nil
        }

  defstruct [:lists, :segments]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      lists: {GetProfileResponseCollectionDataRelationshipsLists, :t},
      segments: {GetProfileResponseCollectionDataRelationshipsSegments, :t}
    ]
  end
end
