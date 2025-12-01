defmodule Klaviyo.GetProfileResponseCollectionDataRelationships do
  @moduledoc """
  Provides struct and type for a GetProfileResponseCollectionDataRelationships
  """

  @type t :: %__MODULE__{
          lists: Klaviyo.GetProfileResponseCollectionDataRelationshipsLists.t() | nil,
          segments: Klaviyo.GetProfileResponseCollectionDataRelationshipsSegments.t() | nil
        }

  defstruct [:lists, :segments]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      lists: {Klaviyo.GetProfileResponseCollectionDataRelationshipsLists, :t},
      segments: {Klaviyo.GetProfileResponseCollectionDataRelationshipsSegments, :t}
    ]
  end
end
