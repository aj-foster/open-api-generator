defmodule GetProfileResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a GetProfileResponseDataRelationships
  """

  @type t :: %__MODULE__{
          lists: GetProfileResponseDataRelationshipsLists.t() | nil,
          segments: GetProfileResponseDataRelationshipsSegments.t() | nil
        }

  defstruct [:lists, :segments]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      lists: {GetProfileResponseDataRelationshipsLists, :t},
      segments: {GetProfileResponseDataRelationshipsSegments, :t}
    ]
  end
end
