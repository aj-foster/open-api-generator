defmodule Klaviyo.GetTagSegmentRelationshipsResponseCollection do
  @moduledoc """
  Provides struct and type for a GetTagSegmentRelationshipsResponseCollection
  """

  @type t :: %__MODULE__{data: [Klaviyo.GetTagSegmentRelationshipsResponseCollectionData.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{Klaviyo.GetTagSegmentRelationshipsResponseCollectionData, :t}]]
  end
end
