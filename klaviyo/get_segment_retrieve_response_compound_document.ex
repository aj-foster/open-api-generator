defmodule Klaviyo.GetSegmentRetrieveResponseCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetSegmentRetrieveResponseCompoundDocument
  """

  @type t :: %__MODULE__{
          data: Klaviyo.GetSegmentRetrieveResponseCompoundDocumentData.t(),
          included: [Klaviyo.TagResponseObjectResource.t()] | nil
        }

  defstruct [:data, :included]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: {Klaviyo.GetSegmentRetrieveResponseCompoundDocumentData, :t},
      included: [{Klaviyo.TagResponseObjectResource, :t}]
    ]
  end
end
