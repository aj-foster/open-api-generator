defmodule Klaviyo.PatchListPartialUpdateResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PatchListPartialUpdateResponseDataRelationships
  """

  @type t :: %__MODULE__{
          profiles: Klaviyo.PatchListPartialUpdateResponseDataRelationshipsProfiles.t() | nil,
          tags: Klaviyo.PatchListPartialUpdateResponseDataRelationshipsTags.t() | nil
        }

  defstruct [:profiles, :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      profiles: {Klaviyo.PatchListPartialUpdateResponseDataRelationshipsProfiles, :t},
      tags: {Klaviyo.PatchListPartialUpdateResponseDataRelationshipsTags, :t}
    ]
  end
end
