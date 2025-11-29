defmodule PatchProfileResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PatchProfileResponseDataRelationships
  """

  @type t :: %__MODULE__{
          lists: PatchProfileResponseDataRelationshipsLists.t() | nil,
          segments: PatchProfileResponseDataRelationshipsSegments.t() | nil
        }

  defstruct [:lists, :segments]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      lists: {PatchProfileResponseDataRelationshipsLists, :t},
      segments: {PatchProfileResponseDataRelationshipsSegments, :t}
    ]
  end
end
