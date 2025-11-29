defmodule GetSegmentResponseCollection do
  @moduledoc """
  Provides struct and type for a GetSegmentResponseCollection
  """

  @type t :: %__MODULE__{data: [GetSegmentResponseCollectionData.t()], links: CollectionLinks.t()}

  defstruct [:data, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{GetSegmentResponseCollectionData, :t}], links: {CollectionLinks, :t}]
  end
end
