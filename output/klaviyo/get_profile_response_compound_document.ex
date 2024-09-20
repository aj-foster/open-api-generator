defmodule GetProfileResponseCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetProfileResponseCompoundDocument
  """

  @type t :: %__MODULE__{
          data: GetProfileResponseCompoundDocumentData.t(),
          included: [ListResponseObjectResource.t() | SegmentResponseObjectResource.t()] | nil
        }

  defstruct [:data, :included]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: {GetProfileResponseCompoundDocumentData, :t},
      included: [union: [{ListResponseObjectResource, :t}, {SegmentResponseObjectResource, :t}]]
    ]
  end
end
