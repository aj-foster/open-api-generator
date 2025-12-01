defmodule Klaviyo.PatchTagGroupResponseDataRelationshipsTags do
  @moduledoc """
  Provides struct and type for a PatchTagGroupResponseDataRelationshipsTags
  """

  @type t :: %__MODULE__{
          data: [Klaviyo.PatchTagGroupResponseDataRelationshipsTagsData.t()],
          links: Klaviyo.RelationshipLinks.t() | nil
        }

  defstruct [:data, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{Klaviyo.PatchTagGroupResponseDataRelationshipsTagsData, :t}],
      links: {Klaviyo.RelationshipLinks, :t}
    ]
  end
end
