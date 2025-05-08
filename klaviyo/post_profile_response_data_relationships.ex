defmodule PostProfileResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PostProfileResponseDataRelationships
  """

  @type t :: %__MODULE__{
          lists: PostProfileResponseDataRelationshipsLists.t() | nil,
          segments: PostProfileResponseDataRelationshipsSegments.t() | nil
        }

  defstruct [:lists, :segments]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      lists: {PostProfileResponseDataRelationshipsLists, :t},
      segments: {PostProfileResponseDataRelationshipsSegments, :t}
    ]
  end
end
