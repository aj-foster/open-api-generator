defmodule Klaviyo.GetSegmentRelationshipsResponseCollection do
  @moduledoc """
  Provides struct and type for a GetSegmentRelationshipsResponseCollection
  """

  @type t :: %__MODULE__{data: [Klaviyo.GetSegmentRelationshipsResponseCollectionData.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{Klaviyo.GetSegmentRelationshipsResponseCollectionData, :t}]]
  end
end
