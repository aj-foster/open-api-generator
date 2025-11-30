defmodule Klaviyo.ProfileMergeQueryResourceObjectRelationships do
  @moduledoc """
  Provides struct and type for a ProfileMergeQueryResourceObjectRelationships
  """

  @type t :: %__MODULE__{
          profiles: Klaviyo.ProfileMergeQueryResourceObjectRelationshipsProfiles.t()
        }

  defstruct [:profiles]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [profiles: {Klaviyo.ProfileMergeQueryResourceObjectRelationshipsProfiles, :t}]
  end
end
