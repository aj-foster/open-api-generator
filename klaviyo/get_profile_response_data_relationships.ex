defmodule Klaviyo.GetProfileResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a GetProfileResponseDataRelationships
  """

  @type t :: %__MODULE__{
          lists: Klaviyo.GetProfileResponseDataRelationshipsLists.t() | nil,
          segments: Klaviyo.GetProfileResponseDataRelationshipsSegments.t() | nil
        }

  defstruct [:lists, :segments]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      lists: {Klaviyo.GetProfileResponseDataRelationshipsLists, :t},
      segments: {Klaviyo.GetProfileResponseDataRelationshipsSegments, :t}
    ]
  end
end
