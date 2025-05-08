defmodule GetProfileResponseCollectionCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetProfileResponseCollectionCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          lists: GetProfileResponseCollectionCompoundDocumentDataRelationshipsLists.t() | nil,
          segments:
            GetProfileResponseCollectionCompoundDocumentDataRelationshipsSegments.t() | nil
        }

  defstruct [:lists, :segments]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      lists: {GetProfileResponseCollectionCompoundDocumentDataRelationshipsLists, :t},
      segments: {GetProfileResponseCollectionCompoundDocumentDataRelationshipsSegments, :t}
    ]
  end
end
