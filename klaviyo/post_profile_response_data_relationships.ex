defmodule Klaviyo.PostProfileResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PostProfileResponseDataRelationships
  """

  @type t :: %__MODULE__{
          lists: Klaviyo.PostProfileResponseDataRelationshipsLists.t() | nil,
          segments: Klaviyo.PostProfileResponseDataRelationshipsSegments.t() | nil
        }

  defstruct [:lists, :segments]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      lists: {Klaviyo.PostProfileResponseDataRelationshipsLists, :t},
      segments: {Klaviyo.PostProfileResponseDataRelationshipsSegments, :t}
    ]
  end
end
