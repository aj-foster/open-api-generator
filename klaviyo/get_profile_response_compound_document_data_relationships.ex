defmodule Klaviyo.GetProfileResponseCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetProfileResponseCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          lists: Klaviyo.GetProfileResponseCompoundDocumentDataRelationshipsLists.t() | nil,
          segments: Klaviyo.GetProfileResponseCompoundDocumentDataRelationshipsSegments.t() | nil
        }

  defstruct [:lists, :segments]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      lists: {Klaviyo.GetProfileResponseCompoundDocumentDataRelationshipsLists, :t},
      segments: {Klaviyo.GetProfileResponseCompoundDocumentDataRelationshipsSegments, :t}
    ]
  end
end
