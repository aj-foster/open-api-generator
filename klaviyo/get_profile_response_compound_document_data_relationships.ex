defmodule GetProfileResponseCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetProfileResponseCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          lists: GetProfileResponseCompoundDocumentDataRelationshipsLists.t() | nil,
          segments: GetProfileResponseCompoundDocumentDataRelationshipsSegments.t() | nil
        }

  defstruct [:lists, :segments]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      lists: {GetProfileResponseCompoundDocumentDataRelationshipsLists, :t},
      segments: {GetProfileResponseCompoundDocumentDataRelationshipsSegments, :t}
    ]
  end
end
