defmodule Klaviyo.PatchSegmentPartialUpdateResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PatchSegmentPartialUpdateResponseDataRelationships
  """

  @type t :: %__MODULE__{
          profiles: Klaviyo.PatchSegmentPartialUpdateResponseDataRelationshipsProfiles.t() | nil,
          tags: Klaviyo.PatchSegmentPartialUpdateResponseDataRelationshipsTags.t() | nil
        }

  defstruct [:profiles, :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      profiles: {Klaviyo.PatchSegmentPartialUpdateResponseDataRelationshipsProfiles, :t},
      tags: {Klaviyo.PatchSegmentPartialUpdateResponseDataRelationshipsTags, :t}
    ]
  end
end
