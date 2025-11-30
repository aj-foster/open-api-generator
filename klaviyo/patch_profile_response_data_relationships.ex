defmodule Klaviyo.PatchProfileResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PatchProfileResponseDataRelationships
  """

  @type t :: %__MODULE__{
          lists: Klaviyo.PatchProfileResponseDataRelationshipsLists.t() | nil,
          segments: Klaviyo.PatchProfileResponseDataRelationshipsSegments.t() | nil
        }

  defstruct [:lists, :segments]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      lists: {Klaviyo.PatchProfileResponseDataRelationshipsLists, :t},
      segments: {Klaviyo.PatchProfileResponseDataRelationshipsSegments, :t}
    ]
  end
end
