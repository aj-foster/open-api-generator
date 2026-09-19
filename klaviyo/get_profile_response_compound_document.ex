defmodule Klaviyo.GetProfileResponseCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetProfileResponseCompoundDocument
  """

  @type t :: %__MODULE__{
          data: Klaviyo.GetProfileResponseCompoundDocumentData.t(),
          included:
            [Klaviyo.ListResponseObjectResource.t() | Klaviyo.SegmentResponseObjectResource.t()]
            | nil
        }

  defstruct [:data, :included]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: {Klaviyo.GetProfileResponseCompoundDocumentData, :t},
      included: [
        union: [
          {Klaviyo.ListResponseObjectResource, :t},
          {Klaviyo.SegmentResponseObjectResource, :t}
        ]
      ]
    ]
  end
end
