defmodule Klaviyo.GetProfileResponseCollectionCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetProfileResponseCollectionCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          lists:
            Klaviyo.GetProfileResponseCollectionCompoundDocumentDataRelationshipsLists.t() | nil,
          segments:
            Klaviyo.GetProfileResponseCollectionCompoundDocumentDataRelationshipsSegments.t()
            | nil
        }

  defstruct [:lists, :segments]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      lists: {Klaviyo.GetProfileResponseCollectionCompoundDocumentDataRelationshipsLists, :t},
      segments:
        {Klaviyo.GetProfileResponseCollectionCompoundDocumentDataRelationshipsSegments, :t}
    ]
  end
end
